#! /usr/bin/awk -f

function factorielle (n)
{
	f = 1
	while (n > 1) {
		f *= n
		n --
	}
	return (f)
}


{
	print "(" $0 ")! = " factorielle($0)
}
