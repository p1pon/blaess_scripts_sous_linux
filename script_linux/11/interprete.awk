#! /usr/bin/awk -f

/^$/ {		# ligne blanche -> ignor�e
	next
}

/^[ \t]*#/ {	# ligne de commentaire -> ignor�e
	next
}

$1 == "QUIT" {	# fin du script
	exit
}

$1 == "LIST" {	# lister les fichiers sur la suite de la ligne
	for (i = 2; i <= NF; i ++)
		system ("ls -l " $i)
	next
}

{	print "Erreur de syntaxe : " $0
	exit
}
