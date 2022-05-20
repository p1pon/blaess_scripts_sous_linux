#! /usr/bin/perl

use strict;

my %hachage;
my $nom_base = "jours";

my %sauvegarde;
dbmopen %sauvegarde, $nom_base, undef or die "Ouverture impossible";
%hachage = %sauvegarde;
dbmclose %sauvegarde;

while (my ($jour, $day) = each %hachage) {
	print "$jour -> $day\n";
}
