#! /usr/bin/perl -w

%html_2_latin = (
	"&Agrave;"	=> "�",	"&Aacute;"	=> "�",
	"&Acirc;"	=> "�",	"&Atilde;"	=> "�",
	"&Auml;"	=> "�",	"&Aring;"	=> "�",
	"&AElig;"	=> "�",	"&Ccedil;"	=> "�",
	"&Egrave;"	=> "�",	"&Eacute;"	=> "�",
	"&Ecirc;"	=> "�",	"&Euml;"	=> "�",
	"&Igrave;"	=> "�",	"&Iacute;"	=> "�",
	"&Icirc;"	=> "�",	"&Iuml;"	=> "�",
	"&ETH;"		=> "�",	"&Ntilde;"	=> "�",
	"&Ograve;"	=> "�",	"&Oacute;"	=> "�",
	"&Ocirc;"	=> "�",	"&Otilde;"	=> "�",
	"&Ouml;"	=> "�",	"&Oslash;"	=> "�",
	"&Ugrave;"	=> "�",	"&Uacute;"	=> "�",
	"&Ucirc;"	=> "�",	"&Uuml;"	=> "�",
	"&Yacute;"	=> "�",	"&THORN;"	=> "�",
	"&szlig;"	=> "�",	"&agrave;"	=> "�",
	"&aacute;"	=> "�",	"&acirc;"	=> "�",
	"&atilde;"	=> "�",	"&auml;"	=> "�",
	"&aring;"	=> "�",	"&aelig;"	=> "�",
	"&ccedil;"	=> "�",	"&egrave;"	=> "�",
	"&eacute;"	=> "�",	"&ecirc;"	=> "�",
	"&euml;"	=> "�",	"&igrave;"	=> "�",
	"&iacute;"	=> "�",	"&icirc;"	=> "�",
	"&iuml;"	=> "�",	"&eth;"		=> "�",
	"&ntilde;"	=> "�",	"&ograve;"	=> "�",
	"&oacute;"	=> "�",	"&ocirc;"	=> "�",
	"&otilde;"	=> "�",	"&ouml;"	=> "�",
	"&oslash;"	=> "�",	"&ugrave;"	=> "�",
	"&uacute;"	=> "�",	"&ucirc;"	=> "�",
	"&uuml;"	=> "�",	"&yacute;"	=> "�",
	"&thorn;"	=> "�"
);

%html_2_ascii = (
	"&nbsp;" =>  " ",
	"&amp;"  =>  "&",
	"&lt;"   =>  "<",
	"&gt;"   =>  ">"
	);

while (<>) {
	s/<[^>]*>//g;
	foreach $entite (keys %html_2_latin) {
		s/$entite/$html_2_latin{$entite}/ge;
	}
	foreach $entite (keys %html_2_ascii) {
		s/$entite/$html_2_ascii{$entite}/ge;
	}
	@mots = m/[^ \t\n]*/g;
	foreach $mot (@mots) {
		$frequence {lc $mot} ++;
	}
}
open STDOUT, "|sort -r";
foreach $mot (keys %frequence) {
	printf "%05d %s\n", $frequence{$mot}, $mot;
}
close STDOUT;
