#! /usr/bin/python

class GrandMereMaternelle :
	def A (self) : print "Methode A() de GrandMereMaternelle"
	def B (self) : print "Methode B() de GrandMereMaternelle"
	def C (self) : print "Methode C() de GrandMereMaternelle"
	def D (self) : print "Methode D() de GrandMereMaternelle"
	def E (self) : print "Methode E() de GrandMereMaternelle"
	def F (self) : print "Methode F() de GrandMereMaternelle"
	def G (self) : print "Methode G() de GrandMereMaternelle"
	def X (self) : print "Methode X() de GrandMereMaternelle"

class GrandPereMaternel :
	def A (self) : print "Methode A() de GrandPereMaternel"
	def B (self) : print "Methode B() de GrandPereMaternel"
	def C (self) : print "Methode C() de GrandPereMaternel"
	def D (self) : print "Methode D() de GrandPereMaternel"
	def E (self) : print "Methode E() de GrandPereMaternel"
	def F (self) : print "Methode F() de GrandPereMaternel"
	def X (self) : print "Methode X() de GrandPereMaternel"

class GrandMerePaternelle :
	def A (self) : print "Methode A() de GrandMerePaternelle"
	def B (self) : print "Methode B() de GrandMerePaternelle"
	def C (self) : print "Methode C() de GrandMerePaternelle"
	def D (self) : print "Methode D() de GrandMerePaternelle"
	def X (self) : print "Methode X() de GrandMerePaternelle"

class GrandPerePaternel :
	def A (self) : print "Methode A() de GrandPerePaternel"
	def B (self) : print "Methode B() de GrandPerePaternel"
	def C (self) : print "Methode C() de GrandPerePaternel"
	def X (self) : print "Methode X() de GrandPerePaternel"

class Mere (GrandPereMaternel, GrandMereMaternelle) :
	def A (self) : print "Methode A() de Mere"
	def B (self) : print "Methode B() de Mere"
	def C (self) : print "Methode C() de Mere"
	def D (self) : print "Methode D() de Mere"
	def E (self) : print "Methode E() de Mere"
	def X (self) : 
		print  "Methode X() de Mere"
		GrandPereMaternel . X(self)
		GrandMereMaternelle . X(self)

class Pere (GrandPerePaternel, GrandMerePaternelle) :
	def A (self) : print "Methode A() de Pere"
	def B (self) : print "Methode B() de Pere"
	def X (self) : 
		print  "Methode X() de Pere"
		GrandPerePaternel . X(self)
		GrandMerePaternelle . X(self)

class Fils (Pere, Mere) :
	def A (self) : print "Methode A() de Fils"
	def X (self) : 
		print "Methode X() de Fils"
		Pere . X(self)
		Mere . X(self)

f = Fils()
f . A()
f . B()
f . C()
f . D()
f . E()
f . F()
f . G()
print ""
f . X()
