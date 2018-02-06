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

my $inside_body;
my $inside_tag;

open( my $fh, "<", "index.html" );

while ( my $row = <$fh> ) {
    chomp $row;

    $inside_body = 1 if $row eq "<body>";
    $inside_body = 0 if $row eq "</body>";

    if ($inside_body) {
    	handle_row($row);
    }
}


sub handle_row {
	my $row = $_[0];

	if()
}