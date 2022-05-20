#! /usr/bin/awk -f

{
	a=$0 * 1
	b=$0 ""
	print "a vaut " a
	print "b vaut " b
	if (a > 1) {
		print "a > 1"
	} else if (a == 1) {
		print "a = 1"
	} else {
		print "a < 1"
	}
	if (b > 1) {
		print "b > 1"
	} else if (b == 1) {
		print "b = 1"
	} else {
		print "b < 1"
	}
}
