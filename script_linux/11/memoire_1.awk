#! /usr/bin/awk -f

BEGIN {
	ko = ""
	for (i = 0; i < 1024; i ++)
		ko = ko "X"
	Mo = ""
	for (i = 0; i < 1024; i ++)
		Mo = Mo ko
	i = 0
	chaine = ""
	while (1) {
		chaine = chaine Mo
		i ++
		print i
	}
}
