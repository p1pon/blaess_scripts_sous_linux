#! /usr/bin/perl -w

sub ecrivain
{
	$| = 1;
	my $numero = shift;
	for (my $i = 0; $i < 5; $i++) {
		sleep rand 3;
		my $val = rand 100;
		printf STDOUT "Fils %d : %d\n", $numero, $val;
		printf "%d\n", $val;
	}
}

pipe S1, E1;
my $pid1 = fork;
if ($pid1 == 0) {
	close S1; select E1; 
	ecrivain 1; exit 0;
}
close E1;

pipe S2, E2;
my $pid2 = fork;
if ($pid2 == 0) {
	close S1; close S2; select E2;
	ecrivain 2; exit 0;
}
close E2;

pipe S3, E3;
my $pid3 = fork;
if ($pid3 == 0) {
	close S1; close S2; close S3; select E3;
	ecrivain 3; exit 0;
}
close E3;

my $a_lire = '';
vec ($a_lire, fileno (S1), 1) = 1;
vec ($a_lire, fileno (S2), 1) = 1;
vec ($a_lire, fileno (S3), 1) = 1;
while (1) {
	my $prets = $a_lire;
	my ($nb_prets, $delai_restant) = select $prets, undef, undef, undef;
	if (vec ($prets, fileno (S1), 1) == 1) {
		my $ligne = <S1>;
		last if (! defined $ligne);
		print "Lecture depuis 1 : " . $ligne;
	}	
	if (vec ($prets, fileno (S2), 1) == 1) {
		my $ligne = <S2>;
		last if (! defined $ligne);
		print "Lecture depuis 2 : " . $ligne;
	}	
	if (vec ($prets, fileno (S3), 1) == 1) {
		my $ligne = <S3>;
		last if (! defined $ligne);
		print "Lecture depuis 3 : " . $ligne;
	}	
}
kill "KILL", $pid1, $pid2, $pid3;
waitpid $pid1, 0;
waitpid $pid2, 0;
waitpid $pid3, 0;
