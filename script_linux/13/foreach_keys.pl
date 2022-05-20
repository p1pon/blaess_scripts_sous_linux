#! /usr/bin/perl -w

%semaine = (
	"lundi"    => "monday",
	"mardi"    => "tuesday",
	"mercredi" => "wednesday",
	"jeudi"    => "thursday",
	"vendredi" => "friday",
	"samedi"   => "saturday",
	"dimanche" => "sunday"
);

foreach $jour (keys %semaine) {
	print "$jour <=> $semaine{$jour}\n";
}
