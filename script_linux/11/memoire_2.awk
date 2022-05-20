#! /usr/bin/awk -f

BEGIN {
	ko = ""
	for (i = 0; i < 1024; i ++)
		ko = ko "X"
	Mo = ""
	for (i = 0; i < 1024; i ++)
		Mo = Mo ko
	for (i = 0; i < 64; i ++) {
		chaine = chaine Mo
		print i
	}
	chaine = ""
}

{	
	system ($0)
}

