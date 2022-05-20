#! /usr/bin/tcl

foreach arg $argv {
	puts "$arg :"
	while {1} {
		set arg [string trimleft $arg "\t "]
		set l [string length $arg]
		if {$l == 0} { break }
		set m [string wordend $arg 0]
		puts ">>[string range $arg 0 [expr $m - 1]]<<"
		set arg [string rang $arg $m $l]
	}
}
	
