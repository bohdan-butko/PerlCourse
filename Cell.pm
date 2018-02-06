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
			sign => ". ",
		};

		bless $self, $class;
		return $self;
	}

	sub is_occupied {
		my $self = shift;

		return 1 if $self->{is_occupied};
		return 0 if $self->{is_occupied};
	}

	sub occupy($) {
		my $self = shift;

		$self->{sign} = shift;
		$self->{is_occupied} = 1;
	}

	sub deoccupy {
		my $self = shift;

		$self->{is_occupied} = 0;
	}

	sub print_cell($) {
		my $self = shift;
		$self->{sign} = shift;

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