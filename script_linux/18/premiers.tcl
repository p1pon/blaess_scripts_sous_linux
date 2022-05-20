#! /usr/bin/tcl

proc premier n {
	for {set i 2} {$i < $n} {incr i 1} {
		if {($n % $i) == 0} {
			return 0
		}
	}
	return 1
}

for {set a [lindex $argv 0]} {$a < [lindex $argv 1]} {incr a 1} {
	if [premier $a] {
		puts -nonewline "$a "
	}
}
puts ""
