#! /usr/bin/python

class Point :
	x = 0
	y = 0
	z = 0
	def translation (self, vx, vy, vz):
		self . x = self . x + vx
		self . y = self . y + vy
		self . z = self . z + vz
	def affichage (self) :
		print (self.x, self.y, self.z)

pt = Point ()
pt . x = 10
pt . y = 20
pt . z = 30
pt . translation (100, 200, 300)
pt . affichage()
