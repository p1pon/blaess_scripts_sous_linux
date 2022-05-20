#! /usr/bin/awk -f

BEGIN {
	print "Bloc BEGIN"
	print "    x = " x
}


{
	print "Fichier = " FILENAME
	print "    x = " x
	nextfile
}
