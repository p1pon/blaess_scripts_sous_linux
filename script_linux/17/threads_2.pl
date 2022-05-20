#! /usr/bin/perl -w

	use threads;
	use threads::shared;

	my $compteur : shared = 0;

sub fonction_thread {
	my ($n) = @_;
	for (my $i=0; $i < 5; $i ++) {
		{
			lock ($compteur);
			my $i = $compteur;
			sleep (1);
			$compteur = $i+1;
			print "Je suis le thread $n (compteur = $compteur)\n";
		}
		sleep (1);
	}
	return (0);
}

	my $thr1 = threads->new (\&fonction_thread, 1);
	my $thr2 = threads->new (\&fonction_thread, 2);
	my $thr3 = threads->new (\&fonction_thread, 3);

	$thr1->join;
	$thr2->join;
	$thr3->join;
	exit (0);
