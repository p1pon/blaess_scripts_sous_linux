#! /bin/ksh
	tput clear
	max_cols=$(tput cols)
	max_ligs=$(tput lines)
	max_colr=$(tput colors)
	max_cols=$((max_cols - 1))
	max_ligs=$((max_ligs - 1))
	max_colr=$((max_colr - 1))
	
	for i in $(seq 0 $max_cols) ; do
		for j in $(seq 0 $max_ligs) ; do
			n=$(bc -l mandelbrot.bc <<- fin
				-1.5
				-1
				1.5
				1
				100
				$max_cols
				$max_ligs
				$max_colr
				$i
				$j
			fin
			)
			n=${n%%.*}
			n=${n:-0}
			n=$((7 - n))
			tput setb $n
			tput cup $j $i
			echo -n " "
		done
	done
				
