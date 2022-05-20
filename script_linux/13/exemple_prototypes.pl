#! /usr/bin/perl -w

sub fonction_1() {};
fonction_1;
fonction_1();

$a=10;
sub fonction_2($) {};
fonction_2($a);
fonction_2 $a;
fonction_2(12);
fonction_2 12;

sub fonction_3(\$) {};
fonction_3($a);
fonction_3 $a;

$b=12;
sub fonction_4($$) {};
fonction_4 10, 12;
fonction_4 $a, $b;
fonction_4 ($a, $b);

sub fonction_5($;$) {};
fonction_5 10;
fonction_5 10, 12;
fonction_5 ($a);
fonction_5 ($a, $b);

@t=(1, 2, 3);
@u=(4, 5, 6);
%h=("un" => 1, "deux" => 2);
sub fonction_6 (@) { };
fonction_6 ();
fonction_6 ($a);
fonction_6 ($a, 10, $b);
fonction_6 (@t);
fonction_6 (@t, @u);
fonction_6 (%h);

sub fonction_7 (\@) { };
fonction_7 (@t);

