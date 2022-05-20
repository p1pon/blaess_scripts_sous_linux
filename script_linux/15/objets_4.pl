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

print "Création de l'objet Blinky dans référence obj1\n";
my $obj1 = new Objet ("Blinky");
print "Création de l'objet Pinky dans référence obj2\n";
my $obj2 = new Objet ("Pinky");
{
print "Entrée dans un bloc lexical indépendant\n";
print "Création de l'objet Inky dans référence obj3\n";
my $obj3 = new Objet ("Inky");
print "Sortie du bloc lexical (et disparition de obj3)\n";
}
print "Création de l'objet Clyde dans référence obj2\n";
$obj2 = new Objet ("Clyde");
print "Ecrasement de la référence obj1\n";
$obj1=0;
print "Fin du programme\n";

