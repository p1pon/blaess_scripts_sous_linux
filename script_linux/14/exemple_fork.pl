#! /usr/bin/perl -w

use strict;

print "PID : $$, PPID : " . getppid . "\n";
my $pid = fork;
die "Erreur dans fork " if (! defined ($pid));
if ($pid == 0) {
	print "Je suis le processus fils, de PID $$, ";
	print "mon père est " . getppid ."\n";
} else {
	print "Je suis le processus père, de PID $$, ";
	print "mon fils est $pid \n";
	waitpid $pid, 0;
}

