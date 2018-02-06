#! /usr/bin/perl

use strict;
use warnings;

my %symbols_result = ();
my $file = $ARGV[0];
my $max = 0;
my $max_popular = 0;
my $min = 99;
my $min_popular = 0;

open( my $fh, "<", $file ) or die "Couldn't open file: $file, $!";

while ( my $row = <$fh> ) {
  chomp $row;
  my @symbols = split //, $row;

  for( my $i = 0; $i < scalar @symbols; $i++) {

      if ( $symbols_result{ $symbols[$i] } ) {
        $symbols_result{ $symbols[$i] } += 1;
      } else {
        $symbols_result{ $symbols[$i] } = 1;
      }

      if ( $symbols_result{ $symbols[$i] } > $max ) {
        $max = $symbols_result{ $symbols[$i] };
        $max_popular = $symbols[$i];
      }
      if ( $symbols_result{ $symbols[$i] } < $min ) {
        $min = $symbols_result{ $symbols[$i] };
        $min_popular = $symbols[$i];
      }
  }
}

if ( $max_popular eq "\n" ) {
  print '\n' . " - $max\n";
} else {
  print "$max_popular - $max\n";
}
if ( $min_popular eq "\n" ) {
  print '\n' . " - $min\n";
} else {
  print "$min_popular - $min\n";
}
