#! /usr/bin/perl

package Person;

use strict;
use warnings;

sub new {
  my $class = shift;
  my $self = {
    _firstName => shift,
    _lastName => shift,
    _ssn => shift,
  };

  bless $self, $class;
  return $self;
}

sub getFirstName {
  my ( $self ) = @_;
  return $self->{_firstName};
}

sub setFirstName {
  my ( $self, $firstName ) = @_;
  $self->{_firstName} = $firstName if defined($firstName);
  return $self->{_firstName};
}
return 1;