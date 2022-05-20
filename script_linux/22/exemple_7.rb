#! /usr/local/bin/ruby


module Stat

	def somme (table)
		s = 0
		table . each { |x|  s += x }
		return s
	end
	def moyenne (table)
		l = table . length
		return (0) if (l == 0)
		return (somme(table) / l)
	end
	def variance (table)
		m = moyenne (table)
		t = table . collect { |x|   (x - m) ** 2 }
		return (moyenne (t))
	end
end

include Stat

table = [1.0, 2.0, 3.0, 1.0, 2.0, 3.0]

print "Table    = #{ table.join (', ')  } \n"
print "Somme    = #{ somme (table)      } \n"
print "Moyenne  = #{ moyenne (table)    } \n"
print "Variance = #{ variance (table)   } \n"


