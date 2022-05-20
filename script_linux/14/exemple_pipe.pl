#! /usr/bin/perl -w

use strict;

pipe SORTIE, ENTREE or die "pipe : ";
my $pid = fork;
die "fork : " if (! defined $pid);
if ($pid == 0) {
	# Processus fils : lecteur
	close ENTREE;
	while (<SORTIE>) {
		print "Lecteur : $_";
	}
} else {
	# Processus père : écrivain
	close SORTIE;
	my $ancien_select = select ENTREE;
	$| = 1;
	select $ancien_select;
	for (my $i=0; $i < 10; $i ++) {
		my $chaine = sprintf "%d", rand (1000);
		print "Écrivain : $chaine \n";
		print ENTREE "$chaine\n";
	}
	close ENTREE;
	waitpid $pid, 0;
}
