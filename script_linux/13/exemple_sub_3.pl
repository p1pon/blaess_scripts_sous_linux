#! /usr/bin/perl -w

sub somme;

print "1+2 = " . somme 1, 2 . "\n";
print "1+2+3+4 = " . somme 1, 2, 3, 4 . "\n";

sub somme
{
	$somme = 0;
	foreach $val (@_) {
		$somme += $val;
	}
	return ($somme);
}
