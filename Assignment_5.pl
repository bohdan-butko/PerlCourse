#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use Getopt::Long;

Getopt::Long::Configure qw(gnu_getopt);

sub usage { "Usage: $0 --find PATTERN | [--tree] | [--size]\n" }

my $pattern;
my $tree;
my $size;

GetOptions(
		   "find|f=s" => \$pattern,
		   "tree|t" => \$tree,
		   "size|s" => \$size,
		   )
	or die usage;
	
opendir(DIR, $pattern) or die "Couldn't open directory, $!";

while (my $file = readdir DIR) {
	say($file);
}
say("\n\n");

chdir("..");

while (my $file = readdir DIR) {
	say($file);
}


closedir(DIR);
