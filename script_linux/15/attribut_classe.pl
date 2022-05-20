#! /usr/bin/perl -w

use strict;

package Point;

$Point::rapport_zoom = 1.0;

sub zoom ($;$)
{
	shift;
	return ($Point::rapport_zoom) if (! defined ($_[0]));
	$Point::rapport_zoom = $_[0];
}

sub new 
{
	my $pkg = shift;
	my $r = {"x"=>0};
	bless $r, $pkg;
	return ($r);
}

package main;

Point->zoom(4);
print "Zoom : " . Point->zoom() . "\n";
my $p = new Point();
$p->zoom(8);
print "Zoom : " . $p -> zoom() . "\n";

