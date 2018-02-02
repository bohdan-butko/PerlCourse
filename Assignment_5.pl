#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

use Getopt::Long;
use File::stat;

use Assignment_5;

Getopt::Long::Configure qw(gnu_getopt);

sub usage {"Usage: $0 --find PATTERN | [--tree] | [--size]\n"}

my $directory = "/home/user/Documents/Test";
my $pattern;
my $tree;
my $size;

GetOptions(
    "find|f=s" => \$pattern,
    "tree|t"   => \$tree,
    "size|s"   => \$size,
) or die usage;

Assignment_5::handle_dir($directory, $tree, $size);
