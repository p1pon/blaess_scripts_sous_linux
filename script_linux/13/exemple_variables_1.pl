#! /usr/bin/perl -w

$a = "précédent";

print "Avant : a=$a, b=$b\n";
fonction();
print "Après : a=$a, b=$b\n";

sub fonction
{
	$a="suivant";
	$b="nouveau";
}
