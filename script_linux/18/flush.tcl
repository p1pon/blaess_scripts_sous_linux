#! /usr/bin/tcl

for {set i 0} {$i < 50} {incr i 1} {
	if {($i % 10) == 0} {
		puts -nonewline "."
		flush stdout
	}
	after 100
}
puts ""
