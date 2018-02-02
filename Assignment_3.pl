#! /usr/bin/perl

use strict;
use warnings;

my $file = "/etc/dictionaries-common/words";
my $line = 1;

print("Enter your word: ");
my $word = <STDIN>;
chomp $word;

open( my $fh, "<", $file ) or die "Couldn't open file: $file, $!";

while ( my $w = <$fh> ) {
  chomp $w;

  if ( $w eq $word ) {
    print("word: $word, w: $w, line: $line\n");
  }

  $line++;
}
