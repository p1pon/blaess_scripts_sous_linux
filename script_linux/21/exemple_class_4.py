#! /usr/bin/python

class Vecteur :
	def __init__ (self, x, y, z) :
		self . x = x
		self . y = y
		self . z = z
	def __add__ (self, other) :
		return Vecteur (self . x + other . x,
				self . y + other . y,
				self . z + other . z)
	def __sub__ (self, other) :
		return Vecteur (self . x - other . x,
				self . y - other . y,
				self . z - other . z)
	def __repr__ (self) :
		return "Vecteur(%g, %g, %g)" % (self.x, self.y, self.z)

v1 = Vecteur (1.2, 2.3, 3.4)

v2 = Vecteur (4.5, 5.6, 6.7)

print v1, "+", v2, "=", v1 + v2
print v2, "-", v1, "=", v2 - v1

