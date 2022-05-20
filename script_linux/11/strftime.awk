#! /usr/bin/awk -f

BEGIN {
	print strftime ("Date : %x", systime())
}

{
	printf "%s : ", strftime ("%X", $1)
	printf "Essai connexion depuis %s port %d ", $3, $4
	printf "sur port %d\n", $2
}
