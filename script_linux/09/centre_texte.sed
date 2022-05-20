#! /bin/sed -f
:boucle
s/^.\{1,78\}$/ & /
t boucle
