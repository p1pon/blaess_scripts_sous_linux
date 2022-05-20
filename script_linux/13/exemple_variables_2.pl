#! /usr/bin/perl -w

fonction();

sub fonction
{
	my $a = "initiale";
	local $b = "initiale";

	print "fonction() : a=$a, b=$b\n";
	fonction_2();
	print "fonction() : a=$a, b=$b\n";
}

sub fonction_2
{
	$a="modifiée";
	$b = "modifiée";
	print "fonction_2() : a=$a, b=$b\n";	
}

