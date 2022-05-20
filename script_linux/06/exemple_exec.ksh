#! /bin/ksh
echo "Cette ligne est écrite avant le exec"
exec > sortie.txt
echo "Cette ligne est écrite après le exec"

