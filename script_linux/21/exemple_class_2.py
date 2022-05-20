#! /usr/bin/python

class Point :
	def x (self, * args) :
		if len (args) == 0 : return (self._x)
		if len (args) == 1 : self . _x = args[0]
		else : raise TypeError, "x() prend 0 ou 1 argument"
		
	def y (self, * args) :
		if len (args) == 0 : return (self._y)
		if len (args) == 1 : self . _y = args[0]
		else : raise TypeError, "y() prend 0 ou 1 argument"

	def z (self, * args) :
		if len (args) == 0 : return (self._z)
		if len (args) == 1 : self . _z = args[0]
		else : raise TypeError, "z() prend 0 ou 1 argument"
		
	def __init__ (self, *args) :
		if len(args) == 0 : self._z = self._y = self._x = 0
		elif len(args) == 3 :
			self._x = args [0]
			self._y = args [1]
			self._z = args [2]
		elif ((type (args[0]) == type (self)) and
			(self . __class__ == args[0] . __class__)) :
			self._x = args[0].x()
			self._y = args[0].y()
			self._z = args[0].z()
		else : raise TypeError, "mauvais arguments"

	def affichage (self) :
		print (self._x, self._y, self._z)

print "Constructeur vierge"
pt1 = Point()
pt1 . affichage()

print "Utilisation des accesseurs en modification"
pt1 . x (10)
pt1 . y (20)
pt1 . z (30)
pt1 . affichage()

print "Utilisation des accesseurs en lecture"
print " x =", pt1 . x()
print " y =", pt1 . y()
print " z =", pt1 . z()

print "Constructeur avec valeurs initiales"
pt2 = Point (1, 2, 3)
pt2 . affichage()

print "Constructeur par copie"
pt3 = Point(pt1)
pt3 . affichage()

