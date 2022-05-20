#! /usr/bin/awk -f

BEGIN {
	chaine = "AZERTYUIOPAZERTYUIOPAZERTYUIOP"
	blanc  = "                              "
	print chaine
}

{
	ret = match(chaine, $0)
	if (ret == 0) {
		print "Pas trouvé"
	} else {
		print chaine
		printf "%s", substr(blanc, 1, RSTART - 1)
		print substr(chaine, RSTART, RLENGTH)
	}
}
