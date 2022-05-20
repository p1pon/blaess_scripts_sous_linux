#! /usr/bin/perl -w

use strict;
use Fcntl;

my $etat = 0;
fcntl STDIN, &F_GETFL, $etat;
$etat |= O_NONBLOCK;
fcntl STDIN, &F_SETFL, $etat;

my $i = 0;
my @dessin = ('|', '\\', '-', '/');
print "\n(/) ";
while (!defined (my $touche = getc)) {
	print "\b\b\b$dessin[$i++]) ";
	$i = 0 if ($i == 4);
	select undef, undef, undef, 0.2;
}
