#! /bin/sed -f

# Eliminer les commentaires sur la m�me ligne
s!/\*.*\*/!!

# Eliminer les commentaires sur plusieurs lignes
/\/\*/,/\*\//d

# Eliminer les directives pr�processeur
/^[ 	]*#/d

# Eliminer le corps des fonctions
/^{/,/^}/d

# Ne conserver que les lignes contenant des parenth�ses
/.*(.*)/!d
