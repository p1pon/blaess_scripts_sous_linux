#! /usr/bin/tcl

proc unless {condition action {sinon ""} {action_sinon ""}} {
	if {! [expr $condition] } {
		eval $action
	} else {
		if {[string compare "$sinon" "else"] != 0} {
			eval $sinon
		} else {
			eval $action_sinon
		}
	}
}

unless {1 == 0} {
	puts "Ok 1"
}

unless {1 == 1} {
	puts "erreur"
}

unless {1 == 0} {
	puts "Ok 2"
} else {
	puts "erreur"
}

unless {1 == 1} {
	puts "erreur"
} {
	puts "Ok 3"
}

unless {1 == 1} {
	puts "erreur
} else {
	puts "Ok 4"
}

unless {[string compare "abc" [string tolower "ABC"]] != 0} {
	puts "Ok 5"
}


