#! /usr/bin/wish

set fichier "manuel.gif"

pack [frame .f]
set img [image create photo -file $fichier]
label .f.l -image $img -relief sunken -bd 2
pack .f.l -ipadx 5 -ipady 5 -padx 5 -pady 5
