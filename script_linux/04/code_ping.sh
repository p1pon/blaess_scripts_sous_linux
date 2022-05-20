#! /bin/sh

while [ -n "$1" ]; do
    # on envoie un seul paquet et on
    # attend au plus deux secondes
    ping -c 1 -w 2 $1 > /dev/null 2>&1
    resultat=$?
    # ....
    if [ $resultat = 0 ]; then
        echo "$1 Ok !"
    elif [ $resultat = 1 ]; then
        echo "$1 injoignable"
    else
        echo "$1 inexistant"
    fi
    shift
done

