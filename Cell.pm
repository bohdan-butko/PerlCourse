#! /usr/bin/perl

package Cell {

	use 5.22.0;
	use strict;
	use warnings;

	sub new {
		my $class = shift;
		my $self = {
			i => shift,
			j => shift,
			is_occupied => 0,
			sign => ".",
		};

		bless $self, $class;
		return $self;
	}

	sub is_occupied {
		my $self = shift;

		return $self->{is_occupied};
	}

	sub occupy($) {
		my $self = shift;

		$self->{sign} = shift;
		$self->{is_occupied} = 1;
	}

	sub deoccupy {
		my $self = shift;

		$self->{is_occupied} = 0;
		$self->{sign} = ".";
	}

	sub is_trap {
		my $self = shift;

		return $self->{is_trap};
	}

	sub set_trap {
		my $self = shift;
		
		$self->{sign} = "#";
		$self->{is_trap} = 1;
	}

	sub print_cell() {
		my $self = shift;

		print($self->{sign}, " ");
	}

	sub get_i {
		my $self = shift;

		return $self->{i};
	}

	sub get_j {
		my $self = shift;

		return $self->{j};
	}
}

1;