#! /usr/bin/awk -f

BEGIN {
	printf "SÚparateur de champs ? "
	getline FS < "-"
}

{
	print $1
}

