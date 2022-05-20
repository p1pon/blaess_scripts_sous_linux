#! /usr/bin/perl -w

use strict;
use Socket;

my $adresse_srv = "";
my $port_srv = 2001;
my $protocole_srv = "udp";

my $proto = getprotobyname ($protocole_srv);
$proto = getprotobynumber ($protocole_srv) unless defined ($proto);
die "Protocole : $!\n" unless (defined ($proto));

my $port = $port_srv if ($port_srv !~ /\D/);
$port = getservbyname ($port_srv, $proto) unless (defined ($port));
die "Service : $!\n" unless (defined ($port));

my $adr = gethostbyname ($adresse_srv);
$adr = gethostbyaddr ($adresse_srv, AF_INET) unless (defined ($adr));
$adr = INADDR_ANY unless (defined ($adr));

socket SOCK, PF_INET, SOCK_DGRAM, $proto or die "socket : $!\n";

while (<>) {
	my $chaine;
	send SOCK, $_, 0, sockaddr_in ($port, $adr);
	recv SOCK, $chaine, 1024, 0;
	print "$chaine";
}

