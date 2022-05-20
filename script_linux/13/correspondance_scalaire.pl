#! /usr/bin/perl -w

$ligne = "root:x:0:0:root:/root:/bin/bash";
$i = 0;
while ($ligne =~ m/[^:]+/g) {
	$i ++;
}
print "Nb occurrences : $i\n";
