#! /bin/sed -f

# Eliminer les commentaires sur la même ligne
s!/\*.*\*/!!

# Eliminer les commentaires sur plusieurs lignes
/\/\*/,/\*\//d

# Eliminer les directives préprocesseur
/^[ 	]*#/d

# Eliminer le corps des fonctions
/^{/,/^}/d

# Ne conserver que les lignes contenant des parenthèses
/.*(.*)/!d
