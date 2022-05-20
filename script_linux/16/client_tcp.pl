#! /usr/bin/perl -w

use strict;
use Socket;
use Fcntl;

# Configuration du serveur à contacter
my $adresse_srv = "localhost";
my $port_srv = 2001;
my $protocole_srv = "tcp";

# Nom du fichier d'enregistrement
my $nom_fichier = "test.enr";

open FICHIER, ">$nom_fichier" or die "$nom_fichier : $!\n";

my $proto = getprotobyname ($protocole_srv);
$proto = getprotobynumber ($protocole_srv) unless defined ($proto);
die "Protocole : $!\n" unless (defined ($proto));

my $port = $port_srv if ($port_srv !~ /\D/);
$port = getservbyname ($port_srv, $proto) unless (defined ($port));
die "Service : $!\n" unless (defined ($port));

my $adr = gethostbyname ($adresse_srv);
$adr = gethostbyaddr ($adresse_srv, AF_INET) unless (defined ($adr));
die "Adresse : $!\n" unless (defined ($adr));

socket SOCK_CLI, PF_INET, SOCK_STREAM, $proto or die "socket: $!\n";
connect (SOCK_CLI, sockaddr_in ($port, $adr)) or die "connect : $!\n";
select SOCK_CLI; $| = 1;
select STDOUT;   $| = 1;

my $etat = 0;
fcntl STDIN, &F_GETFL, $etat;
$etat |= O_NONBLOCK;
fcntl STDIN, &F_SETFL, $etat;
fcntl SOCK_CLI, &F_GETFL, $etat;
$etat |= O_NONBLOCK;
fcntl SOCK_CLI, &F_SETFL, $etat;

while (1) {
	my $buffer;
	my $a_lire = "";
	vec ($a_lire, fileno (STDIN), 1) = 1;
	vec ($a_lire, fileno (SOCK_CLI), 1) = 1;
	select $a_lire, undef, undef, undef;
	if (vec ($a_lire, fileno (STDIN), 1) == 1) {
		read STDIN, $buffer, 4096 or last;
		print SOCK_CLI  $buffer;
		chomp $buffer;
		print FICHIER ">> $buffer\n";
	}
	if (vec ($a_lire, fileno (SOCK_CLI), 1) == 1) {
		read SOCK_CLI, $buffer, 4096 or last;
		print STDOUT $buffer;
		chomp $buffer;
		print FICHIER "<< $buffer\n";
	}
}
close FICHIER;
close SOCK_CLI;

