#! /usr/bin/perl -w

$a = "pr�c�dent";

print "Avant : a=$a, b=$b\n";
fonction();
print "Apr�s : a=$a, b=$b\n";

sub fonction
{
	$a="suivant";
	$b="nouveau";
}
