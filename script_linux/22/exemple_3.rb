#! /usr/local/bin/ruby

class Classe

	def initialize ()
		@attrib = 0
	end

	def attrib ()
		@attrib
	end

	def attrib= (valeur)
		@attrib = valeur
	end
end

instance = Classe . new()
print "Attribut : ", instance . attrib, "\n"
print "Modification...\n"
instance . attrib = 123
print "Attribut : ", instance . attrib, "\n"

