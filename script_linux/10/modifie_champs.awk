#! /usr/bin/awk -f

BEGIN {
	FS=":"
}

/^root/ {
	print "Ligne " $0
	print "  NF = " NF
	for (i = 1; i <= NF; i++)
		print "   $" i " = " $i
	print "Modification d'un champ"
	print "  $2 <- 9999"
	$2 = 9999
	print "Vérification :"
	print "  $2 = " $2
	print "  $0 = " $0
	print "Consultation de champs inexistants"
	for (i = 1; i <= 5; i ++)
		print "   $" (NF+i) " = " $(NF+i)
	print "Ecriture dans des champs inexistants"
	print "   $" (NF + 2) " <- abcdef"
	$(NF+2) = "abcdef"
	print "Vérification :"
	print "   NF = " NF
	print "   $NF = " $NF
	print "   $0 = " $0
	print "Diminution de NF"
	print "   NF <- 4"
	NF = 4
	print "Vérification :"
	print "   NF = " NF
	for (i = 1; i <= NF; i++)
		print "   $" i " = " $i
	print "   $0 = " $0
	print "   $(NF+1) = $" (NF+1) " = " $(NF+1)
}
