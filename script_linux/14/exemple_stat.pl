#! /usr/bin/perl -w

foreach $fichier (@ARGV) {
  my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev,
      $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat $fichier;
	print "dev = $dev, ino = $ino, nlink = $nlink \n";
	print "uid = $uid, gid = $gid, size = $size \n";
}
