#! /usr/bin/perl -w

use strict;
use Module03;

fct_exportee();
print "$var_exportee\n";
print "@tab_exportee\n";
print "\n";
Module03::fct_exportable();
print "$Module03::var_exportable\n";
print "@Module03::tab_exportable\n";
print "\n";
Module03::fct_privee();
print "$Module03::var_privee\n";
print "@Module03::tab_privee\n";
