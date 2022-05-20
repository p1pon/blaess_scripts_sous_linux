#! /usr/bin/perl -w

	use strict;
	use threads;

sub fonction_thread
{
	my ($numero) = @_;
	sleep (1);
	return ($numero * $numero);
}

	my $th1 = threads->create(\&fonction_thread, 1);
	my $th2 = threads->create(\&fonction_thread, 2);
	my $th3 = threads->create(\&fonction_thread, 3);

	print "Le threads 1 renvoie : ".$th1->join()."\n";
	print "Le threads 2 renvoie : ".$th2->join()."\n";
	print "Le threads 3 renvoie : ".$th3->join()."\n";

	exit (0);
