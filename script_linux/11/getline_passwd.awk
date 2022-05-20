#! /usr/bin/awk -f

BEGIN {
	FS = ":"
	while ((getline < "/etc/passwd") > 0)
		print $1
}
