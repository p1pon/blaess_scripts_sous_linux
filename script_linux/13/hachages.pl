#! /usr/bin/perl -w

%semaine = ("lundi", "monday", "mardi", "tuesday", "mercredi", "wednesday",
	"jeudi", "thursday", "vendredi", "friday", "samedi", "saturday",
	"dimanche", "sunday");

@semaine=%semaine;

for ($i = 0; $i < @semaine; $i ++) {
print '$semaine [', $i, '] = ', $semaine[$i], "\n";
}
