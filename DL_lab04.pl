#! /usr/bin/perl

use strict;
use warnings;
use 5.22.0;

my $input_file = $ARGV[0];
my $amount_of_requests = $ARGV[1];
my $output_file;
my $input_file_handler;
my $output_file_handler;

if ($ARGV[2]) {
  $output_file = $ARGV[2];
}

open($input_file_handler, "<", $input_file)
  or die "Couldn't open file: $input_file, $!";

if ($output_file) {
  open($output_file_handler, ">", $output_file)
    or die "Couldn't open file: $output_file, $!";
}

while (my $host = <$input_file_handler>) {
	chomp $host;
  
  my $result = `ping -c $amount_of_requests $host`;
  my ($remote_ip) = ($result =~ m/^PING .* \((\d+\.\d+\.\d+\.\d+)\)/g);
  my ($loss) = ($result =~ m/(\d+)\% packet loss/g);
  
  my $max_time = 0;
  
  for (1 .. $amount_of_requests) {
    my ($time) = ($result =~ m/icmp_seq=$_ ttl=\d+ time=(\d+\.\d+)/g);  
    
    if ($time > $max_time) {
      $max_time = $time; 
    }
  }
  
  if ($output_file) {
    say($output_file_handler "$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
    say("$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
  } else {
    say($output_file_handler "$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
  }
}

if ($output_file_handler) {
  close($input_file_handler);
  close($output_file_handler);
} else {
  close($input_file_handler);
}