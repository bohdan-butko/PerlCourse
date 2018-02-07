#! /usr/bin/perl

package Assignment_7_Book;

use 5.22.0;
use strict;
use warnings;

sub new {
	my $class = shift;
	my $self = {
		Title => shift,
		Author => shift,
		Section => shift,
		Shelf => shift,
		On_hands => shift,
	};

	bless $self, $class;
	return $self;
}

sub print_info {
	my $self = shift;

	say("==================================================================");
	say("Title: ", $self->{Title});
	say("Author: ", $self->{Author});
	say("Section: ", $self->{Section});
	say("Shelf: ", $self->{Shelf});
	say("On hands: ", $self->{On_hands});
}

sub set_title($) {
	my $self = shift;
	
	$self->{Title} = shift;
}

sub get_title {
	my $self = shift;

	return $self->{Title};
}


sub set_author($) {
	my $self = shift;
	
	$self->{Author} = shift;
}

sub get_author {
	my $self = shift;

	return $self->{Author};
}


sub set_section($) {
	my $self = shift;
	
	$self->{Section} = shift;
}

sub get_section {
	my $self = shift;

	return $self->{Section};
}


sub set_shelf($) {
	my $self = shift;
	
	$self->{Shelf} = shift;
}

sub get_shelf {
	my $self = shift;

	return $self->{Shelf};
}


sub set_on_hands($) {
	my $self = shift;
	
	$self->{On_hands} = shift;
}

sub get_on_hands {
	my $self = shift;

	return $self->{On_hands};
}

1;