#! /usr/bin/python

def init_port (vitesse=9600, parite="paire", nb_bits=8, nb_stop=1):
	print "Initialisation …", vitesse, "bits/s"
	print "  Parite :", parite
	print "  ", nb_bits, "bits de donn‚es"
	print "  ", nb_stop, "bits d'arrˆt"

init_port ()
init_port (parite="nulle", vitesse=28800)
init_port (2400, "impaire", 7, 2)

