#! /usr/local/bin/ruby

class String
	def + (chaine)
		return (to_f + chaine . to_f) . to_s
	end
end

print "6.5" + "0.05957", "\n"
