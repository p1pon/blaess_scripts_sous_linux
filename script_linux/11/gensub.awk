#! /usr/bin/awk -f

{
	chaine = "AZERTYUIOPAZERTYUIOPAZERTYUIOP"
	print "chaine originale        = " chaine
	print "expression rationnelle  = " $1
	print "chaine de remplacement  = " $2
	print "occurrence remplac�e    = " $3
	if (($3!="g") && ($3!="G"))
		$3=$3+0
	ch2 = gensub ($1, $2, $3, chaine)
	print "r�sultat = " ch2
}
