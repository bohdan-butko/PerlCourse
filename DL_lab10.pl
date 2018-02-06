#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use DL_lab10;

my @matrix = gen($ARGV[0], $ARGV[1], $ARGV[2]);
my @results = min_max_avg(\@matrix);
print_matrix(\@matrix, \@results);