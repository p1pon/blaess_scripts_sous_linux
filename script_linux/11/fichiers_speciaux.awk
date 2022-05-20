#! /usr/bin/awk -f

BEGIN {
	getline pid    < "/dev/pid"
	getline ppid   < "/dev/ppid"
	getline pgrpid < "/dev/pgrpid"
	getline < "/dev/user"
	uid  = $1
	euid = $2
	gid  = $3
	egid = $4

	print "PID    = " pid
	print "PPID   = " ppid
	print "PGRPID = " pgrpid
	print "UID    = " uid
	print "EUID   = " euid
	print "GID    = " gid
	print "EGID   = " egid
}
