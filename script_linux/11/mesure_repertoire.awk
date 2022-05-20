#! /usr/bin/awk -f

BEGIN {
	total = 0
	while (( "ls -l" | getline ) > 0)
		if (substr ($1, 1, 1) == "-")
			total += $5
	print total
}
