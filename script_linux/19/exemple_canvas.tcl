#! /usr/bin/wish

frame .f -relief raised -bd 2
pack  .f -expand 1 -fill both

frame .f.d -relief raised -bd 1
pack  .f.d -fill both -expand 1 -padx 5 -pady 5
canvas .f.d.canvas -relief sunken    -bd 1 		\
		-height 250	-width 250	 	\
		-scrollregion {-500 -500 500 500} 	\
		-xscrollcommand {.f.d.hsc set}	 	\
		-yscrollcommand {.f.d.vsc set}
scrollbar .f.d.vsc -bd 1 -orient vertical  	\
		-command {.f.d.canvas yview}
scrollbar .f.d.hsc -bd 1 -orient horizontal 	\
		-command {.f.d.canvas xview}
grid .f.d.canvas -row 0 -column 0 -sticky nsew
grid .f.d.vsc    -row 0 -column 1 -sticky nsew
grid .f.d.hsc    -row 1 -column 0 -sticky nsew
grid rowconfig    .f.d 0 -weight 1
grid columnconfig .f.d 0 -weight 1

pack [frame .f.bt] -pady 5
button .f.bt.ps -text "Créer fichier PS" -command {
	.f.d.canvas postscript -height 20c -width 20c -file "test.ps"
	}
button .f.bt.quitter -text "Quitter" -command {exit}
pack .f.bt.ps .f.bt.quitter -side left -padx 5

.f.d.canvas configure -background white

proc arc {x0 y0 l h x1 y1 x2 y2 start extent
		fill outline {style pieslice} {width 1}} {
	.f.d.canvas create arc				\
		[expr $x0 + $x1 * $l]			\
		[expr $y0 + ($y1) * $h]			\
		[expr $x0 + $x2 * $l]			\
		[expr $y0 + ($y2) * $h]			\
		-start	$start				\
		-extent $extent 	  		\
		-fill	$fill				\
		-outline $outline			\
		-style	$style				\
		-width  $width
}

proc oval {x0 y0 l h x1 y1 x2 y2 
		fill outline {width 1}} {
	.f.d.canvas create oval				\
		[expr $x0 + $x1 * $l]			\
		[expr $y0 + ($y1) * $h]			\
		[expr $x0 + $x2 * $l]			\
		[expr $y0 + ($y2) * $h]			\
		-fill	$fill				\
		-outline $outline			\
		-width $width
}

proc tux {x y l h} {
	# Tête
	oval $x $y $l $h 0.12 0.03 0.87 0.79         black  black
	arc  $x $y $l $h 0.12 -0.38 0.87 1.16 180  40 black  black
	arc  $x $y $l $h 0.12 -0.38 0.87 1.16 320  40 black  black
	# Epaules
	arc  $x $y $l $h 0.00 0.72 1.00 1.70  30 120 black  black chord
	# Gorge
	oval $x $y $l $h 0.25 0.55 0.75 0.91         white  black
	arc  $x $y $l $h 0.19 0.79 0.81 1.72  30 120 white  white
	# Yeux
	oval $x $y $l $h 0.21 0.28 0.50 0.65         grey   black
	oval $x $y $l $h 0.20 0.29 0.49 0.66         white  black
	arc  $x $y $l $h 0.27 0.41 0.42 0.60  30 340 black  black
	oval $x $y $l $h 0.54 0.28 0.81 0.65         grey   black
	oval $x $y $l $h 0.52 0.29 0.80 0.66         white  black
	arc  $x $y $l $h 0.57 0.41 0.72 0.60  30 340 black  black
	# Bec
	arc  $x $y $l $h 0.19 0.56 0.50 0.84  60 120 yellow yellow
	arc  $x $y $l $h 0.19 0.56 0.50 0.84  60 120 black  black  arc
	arc  $x $y $l $h 0.50 0.84 0.81 0.56   0 120 yellow yellow
	arc  $x $y $l $h 0.50 0.84 0.81 0.56   0 120 black  black  arc
	arc  $x $y $l $h 0.19 0.48 0.81 0.86 180 180 yellow yellow
	arc  $x $y $l $h 0.19 0.48 0.81 0.86 180 180 black  black  arc
	oval $x $y $l $h 0.31 0.54 0.69 0.75         yellow yellow
	arc  $x $y $l $h 0.31 0.54 0.69 0.75  30 120 black  black  arc
	# Bouche
	arc  $x $y $l $h 0.00 0.54 1.00 0.75 240  60 black  black  arc 2
	# Narines
	arc  $x $y $l $h 0.37 0.56 0.62 0.62 100  20 black  black  arc 2
	arc  $x $y $l $h 0.37 0.56 0.62 0.62  60  20 black  black  arc 2
}

tux 0 0 250 250

