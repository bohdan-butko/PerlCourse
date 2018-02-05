#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use DL_lab7;

=pod

Create a matrix (a reference to an array of references)
and fill each element of this matrix with a random fractional number.
A program should print this matrix and also its greatest,
smallest and average values. The program should contain such functions:

a) gen, which generates a matrix  X by Y and fills it with
   random fractional numbers from 0 to P.
b) min_max_avg, which calculates the greatest,
   the smallest and the average values.
   The function returns these values as a list.
c) print_matrix, which prints the matrix and results of min_max_avg to STDOUT.

The program accepts X, Y and P as optional parameters.

=cut

# my @matrix = gen($ARGV[0], $ARGV[1], $ARGV[2]);
# my @results = min_max_avg(\@matrix);
# print_matrix(\@matrix, \@results);


my @matrix = DL_lab7::gen($ARGV[0], $ARGV[1], $ARGV[2]);
my @results = DL_lab7::min_max_avg(\@matrix);
DL_lab7::print_matrix(\@matrix, \@results);
