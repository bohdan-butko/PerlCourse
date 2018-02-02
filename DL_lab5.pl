#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use DL_lab5;

my $input_file = $ARGV[0];
my $amount_of_requests = $ARGV[1];
my $output_file = $ARGV[2];

my @hosts = DL_lab5::read_hosts($input_file);
my @results = ();

foreach my $host (@hosts) {
	my @result = DL_lab5::check($host, $amount_of_requests);
	push @results, \@result;
}

DL_lab5::print_res(@results, $output_file);