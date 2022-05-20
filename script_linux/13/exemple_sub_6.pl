#! /usr/bin/perl -w

sub efface
{
	@args=@_;
	for ($i = 0; $i < @args; $i++) {
		$args[$i] = 0;
	}
}

$a = 4;
$b = 5;
print "a=$a b=$b\n";
efface ($a, $b);
print "a=$a b=$b\n";
efface (12);
