#! /usr/local/bin/ruby

module Mon_module
	Constante = 9.81
	def Mon_module.methode ()
		print "M‚thode de module\n"
	end
end

print "Constante = #{ Mon_module::Constante } \n"
Mon_module . methode()

