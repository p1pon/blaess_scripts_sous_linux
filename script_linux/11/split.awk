#! /usr/bin/awk -f
BEGIN {
	chaine="AZERTYUIOQSDFGHJKLAZERTYUIOP"
	print "chaine = " chaine
}

{
	n = split (chaine, table, $0)
	print "Nb �l�ments = " n
	for (i = 1; i <= n; i ++)
		print i " : " table [i]
}
