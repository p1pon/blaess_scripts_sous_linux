#! /usr/bin/awk -f

{
	for (i = 1; i <= NF; i ++)
		print $i | "sort > sort.tmp"
	close ("sort > sort.tmp")
	while ((getline $i < "sort.tmp") > 0)
		print ">" $i
	close ("sort.tmp")
	system ("/bin/rm -f sort.tmp")
}
