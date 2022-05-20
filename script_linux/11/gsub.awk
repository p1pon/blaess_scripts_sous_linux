#! /usr/bin/awk -f

{
	chaine = "AZERTYUIOPAZERTYUIOPAZERTYUIOP"
	print "chaine originale = " chaine
	print "expression rat.  = " $1
	print "ch. remplacement = " $2
	print "Nb remplacements = " gsub($1, $2, chaine)
	print chaine
}
