#! /usr/bin/perl

package Table {

	use 5.22.0;
	use strict;
	use warnings;
	
	use Entity;

	sub new {
		my $class = shift;
		my $self = {
			rows => shift,
			columns => shift,
		};

		bless $self, $class;
		return $self;
	}

	sub print_table($$) {
		my $self = shift;
		my $entity1 = shift;
		my $entity2 = shift;

		for (my $i = 0; $i < $self->{rows}; $i++) {
			for (my $j = 0; $j < $self->{columns}; $j++) {
				if (
					($entity1->get_i() == $entity2->get_i()) and ($entity1->get_j() == $entity2->get_j())
					) {
					$entity1->generate_coordinates();
					$entity2->generate_coordinates();
				} elsif (
					($i == $entity1->get_i()) and ($j == $entity1->get_j())
					) {
					print("1 ");
				} elsif (
					($i == $entity2->get_i()) and ($j == $entity2->get_j())
					) {
					print("2 ");
				} else {
					print(". ");
				}
			}
			print("\n");
		}
	}
}

1;