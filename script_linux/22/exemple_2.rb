#! /usr/local/bin/ruby

class Nouvelle

	def initialize (num)
		@numero = num
	end

	def publique_1 ()
		print "Instance ", @numero, " : methode publique 1\n"
	end

	def publique_2 (instance)
		print "Instance ", @numero, " : methode publique 2\n"
		print "    invocation de protegee()\n"
		instance . protegee ()
	end

	def publique_3 ()
		print "Instance ", @numero, " : methode publique 3\n"
		print "    invocation de privee()\n"
		privee ()
	end

	def protegee ()
		print "Instance ", @numero, " : methode proteg‚e\n"
	end

	def privee ()
		print "Instance ", @numero, " : methode priv‚e\n"
	end
	
	public		:publique_1, :publique_2
	protected	:protegee
	private		:privee
end

instance_1 = Nouvelle . new (1)
instance_2 = Nouvelle . new (2)
instance_1 . publique_1 ()
print "\n"
instance_1 . publique_2 (instance_2)
print "\n"
instance_2 . publique_3 ()


