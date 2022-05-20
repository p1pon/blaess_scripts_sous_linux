#! /usr/bin/perl -w

use strict;
use Module03 ('fct_exportable', '$var_exportable', '@tab_exportable');

fct_exportable();
print "$var_exportable\n";
print "@tab_exportable\n";
