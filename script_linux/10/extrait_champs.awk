#! /usr/bin/awk -f

BEGIN {
	RS="[\n\t ]*(}|{|(}[\n\t ]*{))[\n\t ]*"
	FS="[\t\n ]+"
	num_enr = 0
}

(NF==0) {
	next
}

{
	num_enr ++
	print "Enregistrement numéro " num_enr
	for (i = 1; i <= NF ; i ++)
		print "    Champ numéro " i " : "$i
}
