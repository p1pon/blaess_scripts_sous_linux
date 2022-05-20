#! /usr/bin/awk -f

BEGIN {
	printf "Séparateur de champs ? "
	getline FS < "-"
}

{
	print $1
}

