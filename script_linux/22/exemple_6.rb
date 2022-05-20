#! /usr/local/bin/ruby

class Mere

	def initialize ()
		print "Initialisation de la classe Mere\n"
	end

	def methode_1 ()
		print "M‚thode 1 de la classe Mere\n"
	end

	def methode_2 ()
		print "M‚thode 2 de la classe Mere\n"
	end
end


class Fille < Mere

	def initialize (arg)
		super ()
		print "Initialisation de la classe Fille\n"
	end

	def methode_1 ()
		super 
		print "M‚thode 1 de la classe Fille\n"
	end
end


fille = Fille . new (1)
fille . methode_1 ()
fille . methode_2 ()

