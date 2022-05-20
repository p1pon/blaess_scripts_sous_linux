#! /usr/bin/awk -f

BEGIN {
	a="mot"
	print "a = " a
	if (a + 0 > 1) {
		print "a > 1"
		print "a * 1 = " a * 1
	} else {
		print "a <= 1"
	}
}
