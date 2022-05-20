#! /usr/local/bin/ruby

class Classe

	def initialize (val)
		print "Initialisation de l'instance numero ", val, "\n"
	end

	def methode_1 ()
		print "M‚thode 1\n"
	end

end



instance_1 = Classe . new (1)
instance_1 . methode_1 ()

instance_2 = Classe . new (2)
instance_2 . methode_1 ()
