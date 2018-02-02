#! /usr/bin/perl

package DL_lab7;

use 5.22.0;
use strict;
use warnings;
use experimental 'signatures'; 

sub gen($rows, $columns, $max_value) {
	
	$rows = 2 unless defined $rows;
	$columns = 2 unless defined $columns;
	$max_value = 10 unless defined $max_value;
	
	my @matrix = ();
	
	for (0 .. ($rows - 1)) {
		my @local_row = ();
		
		for (0 .. ($columns - 1)) {		
			push @local_row, int rand($max_value);
		}
		push @matrix, \@local_row;
	}
	return @matrix;
}

sub min_max_avg($matrix) {
	my @rows = @{$matrix};
	
	my $max;
	my $min;
	my $avg;
	
	foreach my $row (@rows) {
		foreach my $cell (@{$row}) {
			$max = $cell unless defined $max;
			$min = $cell unless defined $min;
			
			$max = $cell if ($cell > $max);
			$min = $cell if ($cell < $min);
			
			$avg += $cell;
		}
	}
	$avg = $avg / ((scalar @rows) * (scalar @{$rows[0]}));	
	return ($min, $max, $avg);
}

sub print_matrix($matrix, $results) {
	
	my @rows = @{$matrix};
	my ($min, $max, $avg) = @{$results};
	
	say("MATRIX\n");
	foreach my $row (@rows) {
		foreach my $column (@{$row}) {
			print("$column  ");
		}
		print("\n");
	}
	say("\nMin value: $min");
	say("Max value: $max");
	say("Avg value: $avg");
}
1;