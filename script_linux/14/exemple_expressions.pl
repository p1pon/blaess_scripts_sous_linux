#! /usr/bin/perl -w

use strict;

my $chaine = "AZERTUIOEQSDDTXCVBNERTN";

while ($chaine =~ m/E[^T]*T/g) {
	print "$`($&)$'\n";
}

