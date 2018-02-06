#! /usr/bin/perl

use strict;
use warnings;

my $services = "/etc/services";
my $port_number;
my $fh;
my ($service, $port);

if ( scalar @ARGV > 0 ) {
  open( $fh, "<", $services ) or die "Couldn't open file: $services, $!";
  while ( my $row = <$fh> ) {
    for ( my $i = 0; $i < scalar @ARGV; $i++) {
      $port_number = $ARGV[$i];
      if ( $row =~ m/\s$port_number\/(tcp|udp)/ ) {
        ($service, $port) = ($row =~ m/([a-zA-Z\-]+)\s+(\d+)\/(tcp|udp)/);
        print "$port - $service\n";
      }
    }
  }
} else {
  print "No args: port\n";
  exit;
}

unless ( $port ) {
  print "Incorrect port\n";
}
