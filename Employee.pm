#! /usr/bin/perl

package Employee;

use Person;
use strict;

our @ISA = qw(Person);

sub new {
  my ($class) = @_;

  my $self = $class->SUPER::new( $_[1], $_[2], $_[3] );

  $self->{_id} = undef;
  $self->{_title} = undef;

  bless $self, $class;
  return $self;
}

sub getFirstName {
  my ($self) = @_;

  return $self->{_lastName};
}

sub DESTROY {
  print "Employee::DESTROY called\n";
}

return 1;