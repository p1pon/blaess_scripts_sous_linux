#! /usr/bin/python

import math

class Point :
	def __init__ (self) :
		self . x = self . y = self . z = 0

	def __getattr__ (self, attr) :
		if attr == 'module' :
			return math.sqrt( pow (self.x, 2) + 
					  pow (self.y, 2) +
					  pow (self.z, 2))
		print "Tentative de lecture d'attribut", attr, "inconnu."
		return ""

	def __setattr__ (self, attr, valeur) :
		if attr in ['x', 'y', 'z'] :
			self . __dict__ [attr] = valeur
			if (self . __dict__ [attr] < -10):
				self . __dict__ [attr] = -10
			if (self . __dict__ [attr] > 10):
				self . __dict__ [attr] = 10
			return
		print "Tentative d'ecrire dans attribut", attr, "inconnu."


pt = Point()
pt . x = 5
pt . y = -25
pt . z = 15
print "Point :", (pt.x, pt.y, pt.z)
print "Module =", pt . module
pt . i = 0
print pt . nom

