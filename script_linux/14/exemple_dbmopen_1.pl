#! /usr/bin/perl -w

use strict;

my %hachage = (
	"lundi"    => "monday",
	"mardi"    => "tuesday",
	"mercredi" => "wednesday",
	"jeudi"    => "thursday",
	"vendredi" => "friday",
	"samedi"   => "saturday",
	"dimanche" => "sunday"
	);


my $nom_base = "jours";
my %sauvegarde;

dbmopen %sauvegarde, $nom_base, 0666 or die "Ouverture impossible";
%sauvegarde = %hachage;
dbmclose %sauvegarde;

