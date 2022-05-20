#! /usr/bin/perl -w

$ligne = "root:x:0:0:root:/root:/bin/bash";

@liste = $ligne =~ m/[^:]+/g;

for ($i = 0; $i < @liste; $i++) {
	print "liste[$i] = $liste[$i] \n";
}
