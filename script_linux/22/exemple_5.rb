#! /usr/local/bin/ruby

class Classe

	@@nb_instances = 0

	attr_reader :numero

	def initialize ()
		@@nb_instances += 1
		@numero = @@nb_instances
	end

	def Classe.nb_instances
		@@nb_instances
	end
end


table_instances = []

for i in 0...10
	table_instances[i] = Classe . new
end

table_instances . each { |instance|
	print "Instance num‚ro ", instance . numero, "\n"
}

print "Nombre total d'instances = ", Classe.nb_instances, "\n"

