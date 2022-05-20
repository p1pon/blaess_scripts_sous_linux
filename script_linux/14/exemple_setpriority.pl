#! /usr/bin/perl -w

my $pid = fork;
die "Erreur dans fork" if (! defined ($pid));

if ($pid == 0) {
	print "Fils : $$\n";
	setpriority 0, 0, 10 + getpriority (0, 0) or die "getpriority : $!";
	sleep 1;
} else {
	print "Père : $$\n";
	sleep 1;
}

for (my $i = 0; $i < 10; $i ++) {
	for (my $j = 0; $j < 1000000; $j ++) {
	}
	print "$$\n";
}

waitpid $pid, 0 if ($pid != 0);
