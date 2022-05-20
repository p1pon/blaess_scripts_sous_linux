#! /usr/bin/python

def traite_ordre () :
	s = raw_input("> ")
	if s == "quit" :
		return 0
	if s == "list" :
		print "Affichage liste"
	else :
		print "Ordre inconnu !"
		return 0
	return 1


while (traite_ordre ()) :
	pass

