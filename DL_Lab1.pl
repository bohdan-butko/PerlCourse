#! /usr/bin/perl

use strict;
use warnings;

print "Enter full path: ";

my $file = <STDIN>;
chomp $file;
my $longest_word = 0;

open( my $fh, "<", $file ) or die "Couldn't open file, $!";

while ( my $row = <$fh> ) {
  chomp $row;
  my @words = split / /, $row;

  for ( my $var = 0; $var < scalar @words; $var++ ) {
    if ( length $words[$var] > length $longest_word ) {
      $longest_word = $words[$var];
    }
  }
}

print "$longest_word - " . length $longest_word;
print "\n";
