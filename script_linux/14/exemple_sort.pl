#! /usr/bin/perl -w
use strict;

my @table = (
    "100100", "0111010010", "01001", "0110", "101", "10010101",
    "1001010", "11", "100101011", "0");

my @triee = sort fn_tri @table;

foreach my $chaine (@triee) {
    print "$chaine \n";
}

sub fn_tri
{
    return (length ($b) <=> length ($a));
}
