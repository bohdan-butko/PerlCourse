#! /usr/bin/perl

use strict;
use warnings;

my $file = "/etc/dictionaries-common/words";
my $amount = 0;

open( my $fh, "<", $file ) or die "Couldn't open file: $file, $!";

while ( my $word = <$fh> ) {
  chomp $word;

  if ( (length $word > 1) and ($word eq reverse($word))) {
    print("$word\n");
  }
}
