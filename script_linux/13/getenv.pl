#! /usr/bin/perl -w

for ($i = 0; $i < @ARGV; $i ++) {
	print "$ARGV[$i] : $ENV{$ARGV[$i]}\n";
}
