#! /usr/bin/perl -w

sub efface
{
	for ($i = 0; $i < @_; $i++) {
		$_[$i] = 0;
	}
}

$a = 4;
$b = 5;
print "a=$a b=$b\n";
efface ($a, $b);
print "a=$a b=$b\n";
efface (12);
