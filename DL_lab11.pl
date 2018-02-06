#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use Table;
use Entity;
use Cell;

=pod

Create a table of cells and a couple of entities, 
which change their position from one cell to another. 
The positions are changed every second. 
During each pass the entity randomly chooses one of eight neighbour cells 
to move toward. The entity should not change a cell if 
choosed cell is occupied by another instance or 
if it is placed out of table. You should use OOP paradigm 
to realize the task. The table and instances should be printed to STDOUT.

=cut

my $table = new Table(30, 30);

my $entity1 = new Entity(15, 15, 30, 30);
my $entity2 = new Entity(14, 16, 30, 30);

while (1) {
	
	sleep 1;
	system 'clear';
	
	$entity1->generate_coordinates();
	$entity2->generate_coordinates();

	$table->print_table($entity1, $entity2);
}