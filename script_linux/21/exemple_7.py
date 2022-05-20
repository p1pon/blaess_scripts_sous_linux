#! /usr/bin/python

def somme (*args) :
	s = 0
	for arg in args :
		s = s + arg
	return s

operation = somme

print operation (1, 2, 3, 4)
