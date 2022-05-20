#! /usr/bin/perl -w

use strict;
use Socket;

# Configuration du serveur
my $adresse_srv = "";
my $port_srv = 2001;
my $protocole_srv = "tcp";

$SIG{CHLD}="IGNORE"; # Pour éliminer les zombies automatiquement.

my $proto = getprotobyname ($protocole_srv);
$proto = getprotobynumber ($protocole_srv) unless defined ($proto);
die "Protocole : $!\n" unless (defined ($proto));

my $port = $port_srv if ($port_srv !~ /\D/);
$port = getservbyname ($port_srv, $proto) unless (defined ($port));
die "Service : $!\n" unless (defined ($port));

my $adr = gethostbyname ($adresse_srv);
$adr = gethostbyaddr ($adresse_srv, AF_INET) unless (defined ($adr));
$adr = INADDR_ANY unless (defined ($adr));

socket SOCK_SRV, PF_INET, SOCK_STREAM, $proto or die "socket : $!\n";
setsockopt (SOCK_SRV, SOL_SOCKET, SO_REUSEADDR, pack ("l", 1));
bind (SOCK_SRV, sockaddr_in ($port, $adr)) or die "bind : $!\n";
listen (SOCK_SRV, 5);

while (1) {
	accept SOCK, SOCK_SRV or last;
	($port, $adr) = unpack_sockaddr_in getpeername SOCK;
	print "Connexion depuis ". inet_ntoa ($adr) . ", port $port\n";
	if (fork != 0) {
		close SOCK;
		next;
	}
	close SOCK_SRV;

	# Ici commence le véritable travail du serveur
	select SOCK;
	$| = 1;
	print "Bonjour : ";
	while (<SOCK>) {
		last if /fin/;
		print uc $_;
	}
	exit (0);
}
