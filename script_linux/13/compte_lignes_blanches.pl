#! /usr/bin/perl -w
my $n=0;
while (<>) {
	/^[ \n\t]*$/ and $n++;
}
print "Nb lignes blanches : $n\n";
