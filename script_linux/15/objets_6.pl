#! /usr/bin/perl -w

use strict;
use Cercle;
use Carre;

print "Création d'un cercle... ";
my $c1 = new Cercle 3, 10, 20, 30;
$c1 -> affiche ();
print "\n";
print "Translation du cercle de (5,5,5).\n";
$c1 -> translate (5, 5, 5);
print "Affichage du cercle... ";
$c1 -> affiche ();
print "\n";

print "Création de quatre points...\n";
my $p1 = new Point 0, 0, 0;
my $p2 = new Point 1, 0, 0;
my $p3 = new Point 1, 1, 0;
my $p4 = new Point 0, 1, 0;
print "Création d'un carré avec ces points\n";
my $ca1 = new Carre ($p1, $p2, $p3, $p4);
print "Copie du carré\n";
my $ca2 = new Carre $ca1;
print "Translation de la copie\n";
$ca2 -> translate (5, 5, 5);
print "Affichage de l'original : \n";
$ca1 -> affiche ();
print "Affichage de la copie translatée : \n";
$ca2 -> affiche ();
