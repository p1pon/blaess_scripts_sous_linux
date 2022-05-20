#! /usr/bin/perl -w

use strict;

sub gestionnaire
{
	my $nom = shift;

	print "Le gestionnaire a été appelé par le signal $nom\n";
}
print "Mon PID est $$\n";
$SIG {"INT"} = "gestionnaire";
$SIG {"TERM"}= "gestionnaire";
$SIG {"HUP"} = "gestionnaire";
$SIG {"USR1"}= "IGNORE";

while (1) {
	getc;
}

