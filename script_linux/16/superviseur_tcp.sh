#! /bin/sh
exec /usr/X11R6/bin/xterm	-title "Superviseur TCP"	\
				-geometry 80x10			\
				-bg black			\
				-fg green			\
				-e ./superviseur_tcp.pl -i ppp0

				

