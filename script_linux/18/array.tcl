#! /usr/bin/tcl

array set a "un 1 deux 2 trois 3 quatre 4 cinq 5 six 6 sept 7"

set rech [array startsearch a]

while {[array anymore a $rech]} {
	set cle [array nextelement a $rech]
	set valeur $a($cle)
	puts "$cle -> $valeur"
}
array donesearch a $rech

