#! /usr/local/bin/ruby

module Transformations

	def translation (vx, vy, vz)
		@points . each do |point|
			point[0] += vx
			point[1] += vy
			point[2] += vz
		end
	end
end

class Point
	include Transformations
	def initialize (x, y, z)
		@points = [[x, y, z]]
	end
	def to_s
		pt = @points[0]
		return "Point (#{pt[0]}, #{pt[1]}, #{pt[2]})"
	end
end

class Cercle
	include Transformations
	def initialize (x, y, z, r)
		@points = [[x, y, z]]
		@rayon = r
	end
	def to_s
		pt = @points[0]
		return "Cercle (#{pt[0]}, #{pt[1]}, #{pt[2]}) - #{@rayon}"
	end
end

point = Point . new (1, 2, 3)
print point, "\n"
point . translation (4, 5, 6)
print point, "\n"
cercle = Cercle . new (1, 1, 1, 5)
print cercle, "\n"
cercle . translation (4, 5, 6)
print cercle, "\n"
