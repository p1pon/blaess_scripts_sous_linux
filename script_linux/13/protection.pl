#! /usr/bin/perl -w

$nombre = 12;
$chaine = "abc def";
@table  = ("un", "deux", "trois");

print "Protection forte avec des apostrophes\n";
print '$nombre $chaine @table \n';

print "\nProtection faible avec des guillemets\n";
print "$nombre $chaine @table \n";

print "\nPas de protection\n";
print 12, $chaine, @table;

print "\n";
