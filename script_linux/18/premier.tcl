#! /usr/bin/tcl

proc premier n {
	for {set i 2} {$i < $n} {incr i 1} {
		if {($n % $i) == 0} {
			return 0
		}
	}
	return 1
}

while {[gets stdin a] > 0} {
	if [premier $a] {
		puts "Premier !"
	} else {
		puts "Non premier"
	}
}
