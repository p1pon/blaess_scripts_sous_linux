#! /usr/bin/python

x = "valeur globale"

def fonction_1 () :
	print "dans fonction_1  :", x

def fonction_2 () :
	x = "valeur locale"
	print "dans fonction_2  :", x

def fonction_3 () :
	global x
	x = "valeur modifiee"
	print "dans fonction_3  :", x


print "au niveau global :", x
fonction_1()
print "au niveau global :", x
fonction_2()
print "au niveau global :", x
fonction_3()
print "au niveau global :", x
