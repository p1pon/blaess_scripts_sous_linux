#! /bin/ksh
echo "Cette ligne est �crite avant le exec"
exec > sortie.txt
echo "Cette ligne est �crite apr�s le exec"

