#! /usr/bin/tcl

proc efface {args} {

	foreach arg $args {
		upvar $arg variable
		set variable 0
	}
}

set a 1
set b 2
set c 3
puts "a=$a, b=$b, c=$c"
puts "efface a b c ..."
efface a b c
puts "a=$a, b=$b, c=$c"
