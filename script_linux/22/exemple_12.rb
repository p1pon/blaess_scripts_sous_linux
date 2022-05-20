#! /usr/local/bin/ruby

class Couleur
	def [] (lambda)
		# lambda est la longueur d'onde en nm
		return ("ultraviolet") 	if (lambda <= 400)
		return ("violet")	if (lambda <= 440)
		return ("bleu")		if (lambda <= 500)
		return ("vert")		if (lambda <= 560)
		return ("jaune")	if (lambda <= 590)
		return ("orange")	if (lambda <= 610)
		return ("rouge")	if (lambda <= 780)
		return ("infrarouge")
	end
end

couleur = Couleur . new

[530, 780, 470, 580, 600] . each { |i|
	print "#{ i }nm -> #{ couleur[i] }\n"
}

