#! /usr/bin/perl -w

package Objet;

sub new($$)
{
	my $pkg = shift;
	my $nom = shift;
	my $r = {"nom" => $nom};
	bless $r, $pkg;
	return ($r);
}

sub DESTROY
{
	my $r = shift;
	print $r->{"nom"} . " : Arrrrgh ! \n";
}

package main;

print "Cr�ation de l'objet Blinky dans r�f�rence obj1\n";
my $obj1 = new Objet ("Blinky");
print "Cr�ation de l'objet Pinky dans r�f�rence obj2\n";
my $obj2 = new Objet ("Pinky");
{
print "Entr�e dans un bloc lexical ind�pendant\n";
print "Cr�ation de l'objet Inky dans r�f�rence obj3\n";
my $obj3 = new Objet ("Inky");
print "Sortie du bloc lexical (et disparition de obj3)\n";
}
print "Cr�ation de l'objet Clyde dans r�f�rence obj2\n";
$obj2 = new Objet ("Clyde");
print "Ecrasement de la r�f�rence obj1\n";
$obj1=0;
print "Fin du programme\n";

