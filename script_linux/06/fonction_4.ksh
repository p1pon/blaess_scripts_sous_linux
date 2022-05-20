#! /bin/ksh

function carre
{
	echo $(($1 * $1))
}

function cube
{
	cube=$(($1 * $1 * $1))
}

	x=$1
	x2=$(carre $x)
	cube $x
	x3=$cube	

	echo "x=$x    x^2=$x2    x^3=$x3"

