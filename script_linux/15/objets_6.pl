#! /usr/bin/perl -w

use strict;
use Cercle;
use Carre;

print "Cr�ation d'un cercle... ";
my $c1 = new Cercle 3, 10, 20, 30;
$c1 -> affiche ();
print "\n";
print "Translation du cercle de (5,5,5).\n";
$c1 -> translate (5, 5, 5);
print "Affichage du cercle... ";
$c1 -> affiche ();
print "\n";

print "Cr�ation de quatre points...\n";
my $p1 = new Point 0, 0, 0;
my $p2 = new Point 1, 0, 0;
my $p3 = new Point 1, 1, 0;
my $p4 = new Point 0, 1, 0;
print "Cr�ation d'un carr� avec ces points\n";
my $ca1 = new Carre ($p1, $p2, $p3, $p4);
print "Copie du carr�\n";
my $ca2 = new Carre $ca1;
print "Translation de la copie\n";
$ca2 -> translate (5, 5, 5);
print "Affichage de l'original : \n";
$ca1 -> affiche ();
print "Affichage de la copie translat�e : \n";
$ca2 -> affiche ();
