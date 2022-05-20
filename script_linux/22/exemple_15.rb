#! /usr/local/bin/ruby

image = [ [ [255, 0, 255],  [127, 255, 127],  [127, 0, 0] ],
	  [ [0, 255, 127],  [127, 127, 255],  [0, 0, 255] ],
	  [ [255, 127, 0],  [255, 255, 255],  [0, 255, 0] ]
	]

nouvelle = image . collect { |ligne|
	ligne . collect { |pixel|
		pixel . collect { |couleur|  couleur / 2
		}
	}
}

nouvelle .  each { |ligne|
		ligne . each { |pixel|
			print "["
			print pixel . join (", ")
			print "] "
		}
	print "\n"
}
