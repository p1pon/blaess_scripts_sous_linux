#! /usr/bin/awk -f

BEGIN {
	ch="1234567890123456789012345678901234567890";
	for (i = 1; i < 5; i ++)
		print "substr (ch, " i ") = " substr (ch, i)
	for (i = 1; i < 4; i ++)
		for (j = 5; j < 9; j ++)
			print "substr (ch, " i ", " j ") = " substr (ch, i, j)	
}
