#! /usr/bin/awk -f

BEGIN {
	print "ARGC = " ARGC
	for (i = 0; i < ARGC; i ++)
		print "ARGV [" i "] = " ARGV [i]
}

{
	print "ARGIND = " ARGIND
	print "FILENAME = " FILENAME
	print ""
ARGIND++;
	nextfile
}
