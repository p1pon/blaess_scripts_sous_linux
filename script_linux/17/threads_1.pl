#! /usr/bin/perl -w

	use strict;
	use threads;

sub fonction_thread
{
	my $compteur = 0;
	my ($numero) = @_;

	for ($compteur = 0; $compteur < 5; $compteur ++) {
		print "  Thread $numero : compteur = $compteur\n";
		sleep 1;
	}
}

	my $th1 = threads->create(\&fonction_thread, 1);
	my $th2 = threads->create(\&fonction_thread, 2);
	my $th3 = threads->create(\&fonction_thread, 3);

	$th1->join();
	$th2->join();
	$th3->join();

	exit (0);
