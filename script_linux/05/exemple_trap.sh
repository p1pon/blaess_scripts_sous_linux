#! /bin/sh

function gestionnaire_1
{
	echo " -> SIGINT reçu dans gestionnaire 1"
}

function gestionnaire_2
{
	echo " -> SIGINT reçu dans gestionnaire 2"
}

trap '$GEST' INT

echo "GEST non configurée : envoi de SIGINT"
kill -INT $$

echo "GEST=gestionnaire_1 : envoi de SIGINT"
GEST=gestionnaire_1
kill -INT $$

echo "GEST=gestionnaire_2 : envoi de SIGINT"
GEST=gestionnaire_2
kill -INT $$
