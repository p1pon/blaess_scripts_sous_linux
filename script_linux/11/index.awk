#! /usr/bin/awk -f

{
	if (index($0, "please") == 0)
		print "Demandez poliment !"
	else
		system (substr ($0, 1, index ($0, "please") - 1))
}
