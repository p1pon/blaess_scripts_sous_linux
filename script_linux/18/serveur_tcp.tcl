#! /usr/bin/tcl


proc fonction_serveur {canal adresse port} {
	puts -nonewline "Connexion depuis "
	puts -nonewline [host_info official_name $adresse]
	puts " ($adresse) port $port"
	flush stdout
	while {[gets $canal ligne] > 0} {
		puts $canal [string toupper $ligne]
		flush $canal
	}
	close $canal
}

if [catch {socket -server fonction_serveur 2001} message] {
	puts "socket : $message"
	exit 1
}

mainloop
