#! /usr/bin/awk -f

BEGIN {
	printf "S�parateur de champs ? "
	getline FS < "-"
}

{
	print $1
}

