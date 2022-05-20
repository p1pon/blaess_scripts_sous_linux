#! /usr/bin/perl -w

	use strict;
	use Socket;
	
	my $nom_fichier_config  = "$ENV{HOME}/.big_mail_killer.conf";
	my $nb_lignes_affichees = 10;

	traitement_fichier_config ($nom_fichier_config);
	exit (0);
	
sub traitement_fichier_config ($)
{
	my ($nom_fic) = @_;
	my ($ligne);
	my (@champs);
	
	open (FIC_SERVEURS, $nom_fic) or die "Fichier $nom_fic illisible\n";

	while ($ligne = <FIC_SERVEURS>) {
		chomp ($ligne);
		next if ($ligne =~ /^[ \t]*#/);
		next if ($ligne =~ /^[ \t]*$/);
		@champs = split / +/, $ligne;
		die "Erreur de syntaxe dans $nom_fic : $ligne \n"
			 unless defined ($champs [2]);
		traitement_serveur_pop (@champs);
	}
	close (FIC_SERVEURS);
}

sub traitement_serveur_pop (@)
{
	my ($serveur_pop, $utilisateur, $mot_de_passe) = @_;

	my ($limite) = 137216; # Taille du vers SirCam.A 
	$limite = $_[3] if (defined ($_[3]));

	print STDOUT "Traitement serveur POP3 : $serveur_pop \n";

	my ($port, $in_addr, $sockaddr, $protocole);
	$port = getservbyname ('pop-3', 'tcp');

	$in_addr = inet_aton ($serveur_pop);
	die "Adresse serveur POP3 incorrecte : $serveur_pop \n"
		unless $in_addr;
	$sockaddr = sockaddr_in ($port, $in_addr);

	$protocole = getprotobyname ('tcp');
	socket (SOCK, PF_INET, SOCK_STREAM, $protocole)
		or die "socket(): $!\n";
	connect (SOCK, $sockaddr) or die "connect() : $!\n";
	select SOCK;
	$| = 1;
	select STDOUT;

	traitement_socket (\*SOCK, $utilisateur, $mot_de_passe, $limite);
	close (SOCK) or die "close() : $!";
}

sub traitement_socket (@)
{	
	my ($sock, $utilisateur, $mot_de_passe, $limite) = @_;

	my ($ligne);
	my ($mail);
	my (@big_mail);
	
	chomp($ligne = <$sock>);
	die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
	printf $sock "USER %s\r\n", $utilisateur;
	chomp($ligne = <$sock>); 
	die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
	printf $sock "PASS %s\r\n", $mot_de_passe;
	chomp($ligne = <$sock>); 
	die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
	printf $sock "LIST\r\n";
	chomp($ligne = <$sock>); 
	die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
	chomp ($ligne = <$sock>);
	while ($ligne !~ /^\.\r*$/) {
		next if ($ligne =~ /^$/);
		my (@champs) = split / +/, $ligne;
		if ($champs[1] > $limite) {
			$big_mail[@big_mail]=$champs[0];
		}
		chomp ($ligne = <$sock>);
	}
	foreach $mail (@big_mail) {
		if (confirmation_effacement ($sock, $mail)) {
			printf $sock "DELE %d\r\n", $mail;
			chomp($ligne = <$sock>); 
			die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
			printf STDOUT "Boum!\r\n";
		}
	}
	printf $sock "QUIT\r\n";
}

sub confirmation_effacement ($, $)
{
	my ($sock, $mail) = @_;
	my ($ligne);
	printf STDOUT "-" x 50 . "\n";
	printf $sock "TOP %d %d\r\n", $mail, $nb_lignes_affichees;
	chomp($ligne = <$sock>); 
	die "erreur POP3 : $ligne\n" if ($ligne !~ /^\+OK/);
	chomp ($ligne = <$sock>);
	while ($ligne !~ /^\.\r*$/) {
		printf STDOUT "%s\n", $ligne;
		chomp ($ligne = <$sock>);
	}
	printf STDOUT "\r\n>> Dois-je détruire le message ? ";
	my ($reponse);
	$reponse = <>;
	return ((uc (substr ($reponse, 0, 1)) eq "Y")
	     || (uc (substr ($reponse, 0, 1)) eq "O"));
}

