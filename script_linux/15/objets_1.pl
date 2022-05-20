#! /usr/bin/perl -w

package Point;

sub new
{
    my $r_pt = { "x" => 0,
                 "y" => 0,
                 "z" => 0 };
    return ($r_pt);
}

sub translation
{
    my ($r_pt, $x, $y, $z) = @_;
    $r_pt -> {"x"} += $x;
    $r_pt -> {"y"} += $y;
    $r_pt -> {"z"} += $z;
}

sub affiche
{
    my ($r_pt) = @_;
    print "(". $r_pt->{"x"} . ", " .
               $r_pt->{"y"} . ", " .
               $r_pt->{"z"} . ")\n";
}

package main;

$pt = Point::new();
Point::translation($pt,1,2,3);
Point::affiche($pt);

