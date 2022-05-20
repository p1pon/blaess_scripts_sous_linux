#! /usr/bin/perl -w

use strict;
use Cercle;

print "Création d'un cercle... ";
my $c1 = new Cercle 3, 10, 20, 30;
$c1 -> affiche ();
print "\nZoom sur le cercle\n";
$c1 -> zoom (5);
print "Affichage du cercle : ";
$c1 -> affiche ();
print "\nEncore un zoom sur le cercle\n";
$c1 -> zoom (2);
print "Affichage du cercle : ";
$c1 -> affiche ();
print "\n";

