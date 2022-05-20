#! /usr/bin/tcl

proc nom_port {port} {
	if {! [catch {set F [open "/etc/services" "r"]}]} {
		while {[gets $F ligne] >= 0} {
			if {[scan $ligne "%s %d/tcp" nom valeur] == 2} {
				if {$valeur == $port} {return $nom}
			}
		}
	}
	return "?"
}

if {[llength $argv] != 1} {
	puts "usage : [file tail [info script]] <hote>"
	exit 1
}
set hote [lindex $argv 0]

for {set port 0} {$port < 1024} {incr port 1} {
	if [catch {set F [socket $hote $port]}] { continue }
	close $F
	puts "$port ([nom_port $port])"
}

