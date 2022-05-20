#! /usr/bin/awk -f

BEGIN {
	a="mot"
	print "a = " a
	if (a > 1) {
		print "a > 1"
		print "a * 1 = " a * 1
	}
}
