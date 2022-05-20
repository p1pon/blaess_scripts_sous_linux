#! /usr/bin/perl -w
use strict;

my ($a, $b, $c) = (1, 2, 3);
print "Externe : a=$a, b=$b, c=$c\n";
fonction ($a, $b, $c);
print "Externe : a=$a, b=$b, c=$c\n";

sub fonction
{
	print "fonction : \$_[0]=$_[0] \$_[1]=$_[1] \$_[2]=$_[2]\n";
	&sous_fonction;
	print "fonction : \$_[0]=$_[0] \$_[1]=$_[1] \$_[2]=$_[2]\n";
}

sub sous_fonction
{
	print "sous-fonction\n";
	($_[0], $_[1], $_[2]) = ($_[2], $_[1], $_[0]);
}
