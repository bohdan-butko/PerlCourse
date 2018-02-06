#! /usr/bin/perl

package main;

=pod

There are several arrays, each element of which is a word.
Create a function which finds the longest word(s)
from each given array and returns the result as a list.
References to arrays should be passed as arguments to the function.

=cut

use 5.22.0;
use strict;
use warnings;

sub longest_words {
	my @arrays = @_;
	my @results = ();
	
	foreach my $array (@arrays) {
		my @local_array = @{$array};
		my $longest_word = 0;
		
		foreach my $element (@local_array) {
			if((length $element) > (length $longest_word)) {
				$longest_word = $element;
			}
		}
		push @results, $longest_word;
	}
	return @results;
}

my @array1 = ("Hello", "world", "I'm", "a", "robot",);
my @array2 = ("Hello", "from", "the", "other", "side");
my @array3 = ("Hello", "darkness", "my", "old", "friend");

my @results = longest_words(\@array1, \@array2, \@array3);

foreach my $result (@results) {
	say($result);
}
