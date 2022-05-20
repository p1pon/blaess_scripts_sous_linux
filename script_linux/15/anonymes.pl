#! /usr/bin/perl

use strict;

my $r_points =
	[
		{ "nom"		=> "Origine",
		  "coord"	=> [0, 0, 0]
		},
		{ "nom"		=> "i",
		  "coord"	=> [1, 0, 0]
		},
		{ "nom"		=> "j",
		  "coord"	=> [0, 1, 0]
		},
		{ "nom"		=> "k",
		  "coord"	=> [0, 0, 1]
		}
	];

print "Entrez des indices entre 0 et 3\n";
while (<>) {
	next if (! defined ($r_points -> [$_]));
	print "Nom : " . $r_points -> [$_] {"nom"}       . "\n";
	print "  X = " . $r_points -> [$_] {"coord"} [0] . "\n";
	print "  Y = " . $r_points -> [$_] {"coord"} [1] . "\n";
	print "  Z = " . $r_points -> [$_] {"coord"} [2] . "\n";
}
