#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

=pod

Create a program which finds all words with doubled letters 
(e.g. "progress", "address", "tool" and so on) inside a body part 
of an html-document. The program should search for them outside 
html-tags, e.g. among words that are "visible" on a screen.
You should point a path to the html-file as an argument to the program. 
Print all found words to STDOUT.

=cut

open( my $fh, "<", "index2.html" );

while ( my $row = <$fh> ) {
    chomp $row;

    if ($row =~ m/<body>.*(\>)*.*([[:alpha:]])\1.*(\<\/)*.*<\/body>/ig) {
    	say("$row - MATCH");	
    }
}
