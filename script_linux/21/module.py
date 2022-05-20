#! /usr/bin/python

if __name__ == '__main__' :
	import sys
	print "Ce module n'est pas con‡u pour ˆtre lanc‚ directement,"
	print "veuillez l'importer dans un script applicatif"
	sys.exit (1)

class Classe :
	def __init__(self, valeur) :
		self . attribut = valeur 
	def methode (self) :
		print self . attribut
