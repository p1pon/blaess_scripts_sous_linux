class Vecteur :
	def __init__ (self, x, y, z) :
		self . x = x
		self . y = y
		self . z = z
	def __add__ (self, other) :
		return Vecteur (self . x + other . x,
				self . y + other . y,
				self . z + other . z)
	def __repr__ (self) :
		return "Vecteur (%g, %g, %g)" % (self.x, self.y, self.z)

