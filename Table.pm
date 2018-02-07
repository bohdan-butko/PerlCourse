#! /usr/bin/perl

package Table {

	use 5.22.0;
	use strict;
	use warnings;
	
	use Entity;
	use Cell;

	my @table;
	my @traps;

	sub new {
		my $class = shift;
		my $self = {
			rows => shift,
			columns => shift,
		};

		for (my $i = 0; $i < $self->{rows}; $i++) {
			my @row;
			for (my $j = 0; $j < $self->{columns}; $j++) {
				my $cell = new Cell($i, $j);

				# if (($i == 0 and $j == 0)
				# 	or
				# 	($i == 0 and $j == 1)
				# 	or
				# 	($i == 0 and $j == 2)
				# 	or
				# 	($i == 1 and $j == 0)
				# 	or
				# 	($i == 1 and $j == 2)
				# 	or
				# 	($i == 2 and $j == 0)
				# 	or
				# 	($i == 2 and $j == 1)
				# 	or
				# 	($i == 2 and $j == 2)) {
					
				# 	$cell->set_trap();
				# 	push @traps, $cell;
				# }

				push @row, $cell;
			}
			push @table, \@row;
		}

		bless $self, $class;
		return $self;
	}

	sub print_table($$) {
		my $self = shift;

		my $e1 = shift;
		my $e2 = shift;

		while ($e1->get_i() == $e2->get_i() and $e1->get_j() == $e2->get_j()) {

			$e1->generate_coordinates();
			$e2->generate_coordinates();
		}

		foreach my $row (@table) {
			foreach my $column (@{$row}) {
				
				if ($column->get_i() == $e1->get_i() and $column->get_j() == $e1->get_j()) {	

					$column->occupy("1");
					$column->print_cell();
				
				} elsif ($column->get_i() == $e2->get_i() and $column->get_j() == $e2->get_j()) {
					$column->occupy("2");
					$column->print_cell();
				} else {

					if ($column->is_trap()) {
						$column->print_cell();
					} else {
						$column->deoccupy() if $column->is_occupied();
						$column->print_cell();
					}
				}
			}
			print("\n");
		}
	}
}

1;