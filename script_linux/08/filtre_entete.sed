#! /bin/sed -f

1,/^$/ {
	/^From:/p
	/^Subject:/p
	d
}
