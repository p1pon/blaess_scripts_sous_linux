#! /usr/bin/perl -w

sub encadre
{
	my ($arg, $i);
	print "+" . "-" x 30 . "+\n";
	foreach $arg (@_) {
		$i = 28 - length ($arg);
		next if ($i < 0);
		print "| " . $arg . " " x $i . " |\n";
	}
	print "+" . "-" x 30 . "+\n";
}

	encadre ("Ceci est un essai", "d'encadrement de texte");
