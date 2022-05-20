#! /usr/bin/awk -f



BEGIN {
	nb_paragraphes=0
	RS=""
}

{
	nb_paragraphes ++
}

END {
	print "Nombre de paragraphes : " nb_paragraphes
}
