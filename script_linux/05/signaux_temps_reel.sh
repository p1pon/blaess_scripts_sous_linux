#! /bin/sh

if ! (kill -l | grep RTMIN > /dev/null) ; then
	echo "Les signaux temps-r�el ne sont pas disponibles"
	exit
fi 

MIN=$(kill -l SIGRTMIN)
MAX=$(kill -l SIGRTMAX)
echo "Il existe $((MAX-MIN+1)) signaux temps-r�el"
echo "s'�tendant de $MIN � $MAX"

