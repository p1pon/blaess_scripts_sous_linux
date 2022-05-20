#! /bin/ksh

	i=1

function sous-fct 
{
	echo "Sous-fct () : i = $i"
}

function fonction
{
	local i=2
	echo "Fonction () : i = $i"
	sous-fct
}	

sous-fct
fonction
