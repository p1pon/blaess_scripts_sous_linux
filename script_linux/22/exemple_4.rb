#! /usr/local/bin/ruby

class Classe

	attr_accessor :attrib

	def initialize ()
		@attrib = 0
	end
end

instance = Classe . new()
print "Attribut : ", instance . attrib, "\n"
print "Modification...\n"
instance . attrib = 123
print "Attribut : ", instance . attrib, "\n"

