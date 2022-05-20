#! /usr/bin/perl -T 

use Net::RawIP; 
use Getopt::Std;

my %option;
getopts('a:hi:v', \%option);

usage (0) if ($option{"h"} != 0);

my @port_supervise;
@port_supervise [0..0x03FF] = (1) x 0x0400;

while (0+@ARGV > 0) {
	$_ = shift @ARGV;
	if (/^X(\d+)-(\d+)$/) {
		die "Port invalide : $_\n" if (($1 < 0) || ($1 > 0xFFFF));
		die "Port invalide : $_\n" if (($2 < 0) || ($2 > 0xFFFF));
		die "Intervalle invalide : $_\n" if ($1 > $2);
		for (my $i = $1 ; $i <= $2; $i ++) {
			$port_supervise [$i] = 0;
		}
	} elsif (/^X(\d+)$/) {
		die "Port invalide : $_\n" if (($1 < 0) || ($1 > 0xFFFF));
		$port_supervise [$1] = 0;
	} elsif (/^(\d+)-(\d+)$/) {
		die "Port invalide : $_\n" if (($1 < 0) || ($1 > 0xFFFF));
		die "Port invalide : $_\n" if (($2 < 0) || ($2 > 0xFFFF));
		die "Intervalle invalide : $_\n" if ($1 > $2);
		for (my $i = $1 ; $i <= $2; $i ++) {
			$port_supervise [$i] = 1;
		}
	} elsif (/^(\d+)$/) {
		die "Port invalide : $_\n" if (($1 < 0) || ($1 > 0xFFFF));
		$port_supervise [$1] = 1;
	} else {
		print STDERR "Ports à surveiller : \n";
		print STDERR "[X]n ou [X]n-m\n";
		exit (1);
	}
}

my $r_addrlist = ifaddrlist();
my @table_if = %$r_addrlist;

if (! defined ($option{"a"})) {
	$option{"i"} = $table_if[0] if (! defined ($option{"i"}));
	$option{"a"} = $$r_addrlist{$option{"i"}};
}

$option{"i"} = rdev ($option{"a"}) if (! defined ($option{"i"}));

if ($option{"v"}) {
	print "Interface : $option{i}  Adresse : $option{a}\n";
	print "Ports supervisés : \n";
	for (my $j = 0; $j < 1024; $j+=0x40) {
		printf "%04X - ", $j;
		for (my $i = 0; $i < 0x40; $i ++) {
			print $port_supervise[$i+$j] ? "#" : "_";
		}
		print "\n";
	}
}

$raw_ip = new Net::RawIP ();

# Interface : Option ligne de commande,
# Filtrage : protocole tcp (6) et adresse de destination,
# Taille de paquet : 1500,
# Timeout : aucun (0).
$pcap = $raw_ip -> pcapinit ($option{"i"},
				"proto 6 and dst host $option{'a'}",
				1500, 0);

loop $pcap, -1, \&traite_paquet, \[];


my %alarme;

sub traite_paquet {
	my ($vide, $pkthdr, $paquet) = @_;	
	my $time = time;
	foreach $cle (keys %alarme) {
		delete $alarme{$cle} if ($alarme{$cle} < $time - 20);
	}
	$raw_ip -> bset (substr ($paquet, linkoffset ($pcap)));
	alarme ($raw_ip -> get (
			{ ip => [("saddr")],
			 tcp => [("dest")]}));
}

sub alarme ($$$$)
{
	my ($adr_src, $port_dst) = @_;

	return if (! defined ($port_supervise [$port_dst]));
	return if ($port_supervise [$port_dst] == 0);
	return if (exists $alarme{$adr_src."-".$port_dst});

	$alarme{$adr_src."-".$port_dst} = time;

	my ($nom_port, @vide) = getservbyport ($port_dst, 'tcp');

	print "Alarme : " ;
	print (($adr_src & 0xFF000000) >> 24);	print ".";
	print (($adr_src & 0xFF0000) >> 16);	print ".";
	print (($adr_src & 0xFF00) >> 8);	print ".";
	print ($adr_src & 0xFF);		print " ";
	print "vers port $port_dst ($nom_port)\n";

	for (my $i = 0; $i < 3; $i ++) {
		print STDERR "\a";      # Bip !
		select undef, undef, undef, 0.5;
	}
}

sub usage ($)
{
	print STDERR "Superviseur TCP v. 1.0 - C. Blaess 2001\n";
	print STDERR "usage : $0 [options] [ports à surveiller]\n";
	print STDERR "options :\n";
	print STDERR "    -i <interface>   Interface à écouter\n";
	print STDERR "    -a <adresse>     Adresse de l'interface\n";
	print STDERR "    -v               Volubile\n";
	print STDERR "    -h               Cet écran d'aide\n";
	exit (@_); 
}

