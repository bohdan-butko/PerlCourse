#! /usr/bin/perl

package Entity {

    use 5.22.0;
    use strict;
    use warnings;

    sub new {
    	my $class = shift;
    	my $self = {
    		i => shift,
    		j => shift,
    		max_i => shift,
    		max_j =>shift,
    	};

    	bless $self, $class;
    	return $self;
    }

    sub get_i {
    	my $self = shift;
    	return $self->{i};
    }

    sub get_j {
    	my $self = shift;
    	return $self->{j};
    }

    sub generate_coordinates {
    	my $self = shift;

    	my $random = int rand(7);

    	if ($random == 0) {
    		my $temp_i = $self->{i} - 1;
    		my $temp_j = $self->{j} - 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} -= 1;
    			$self->{j} -= 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 1) {
    		my $temp_i = $self->{i} - 1;
    		my $temp_j = $self->{j};

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} -= 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 2) {
    		my $temp_i = $self->{i} - 1;
    		my $temp_j = $self->{j} + 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} -= 1;
    			$self->{j} += 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 3) {
    		my $temp_i = $self->{i};
    		my $temp_j = $self->{j} - 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{j} -= 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 4) {
    		my $temp_i = $self->{i};
    		my $temp_j = $self->{j} + 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{j} += 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 5) {
    		my $temp_i = $self->{i} + 1;
    		my $temp_j = $self->{j} - 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} += 1;
    			$self->{j} -= 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 6) {
    		my $temp_i = $self->{i} + 1;
    		my $temp_j = $self->{j};

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} += 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    	if ($random == 7) {
    		my $temp_i = $self->{i} + 1;
    		my $temp_j = $self->{j} + 1;

    		if (($temp_i <= $self->{max_i}) and ($temp_j <= $self->{max_j}) and ($temp_i >= 0) and ($temp_j >= 0)) {
    			$self->{i} += 1;
    			$self->{j} += 1;
    		} else {
    			$self->generate_coordinates();
    		}
    	}
    }
}

1;