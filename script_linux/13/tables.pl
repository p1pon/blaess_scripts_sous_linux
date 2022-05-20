#! /usr/bin/perl -w

@semaine = ("dim", "lun", "mar", "mer", "jeu", "ven", "sam");

for ($i = 0; $i < @semaine; $i ++) {
	print "semaine[$i] = $semaine[$i]\n";
}
print "semaine = @semaine\n";

@pairs = @semaine [0, 2, 4, 6];
print "pairs = @pairs\n";

($weekend[0], @ouvrables[0..4], $weekend[1]) = @semaine;
print "weekend = @weekend\n";
print "ouvrables = @ouvrables\n";

($mini, $maxi) = (12, 8);
print "(mini, maxi) = ($mini, $maxi)\n";

if ($mini > $maxi) {
	($mini, $maxi) = ($maxi, $mini);
}
print "(mini, maxi) = ($mini, $maxi)\n";
