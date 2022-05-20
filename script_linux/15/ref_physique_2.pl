#! /usr/bin/perl

sub fonction
{
	my ($ref_tab1, $ref_tab2) = @_;
	my @tab1 = @$ref_tab1;
	my @tab2 = @$ref_tab2;

	print "Tableau 1 :\n   ";
	foreach $i (@tab1) {
		print $i . " ";
	}
	print "\n";
	print "Tableau 2 :\n   ";
	foreach $i (@tab2) {
		print $i . " ";
	}
	print "\n";
}

@tableau_1 = ("un", "deux", "trois", "quatre");
@tableau_2 = ("one", "two", "three", "four");

fonction (\@tableau_1, \@tableau_2);
