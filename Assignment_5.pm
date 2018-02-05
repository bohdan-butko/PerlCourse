#! /usr/bin/perl

package Assignment_5;

use 5.22.0;
use strict;
use warnings;

use File::stat;

sub handle_dir {
    my $dir     = $_[0];
    my $tree    = $_[1];
    my $size    = $_[2];
    my $padding = $_[3];

    if ($tree) {
        $padding = 0;
    }

    if ( -d $dir ) {
        chdir($dir);
        opendir( my $dh, $dir ) or die "Couldn't open dir: $dir, $!";

        if ($tree) {
            if ( $padding != 0 ) {
                for ( 0 .. $padding ) {
                    print " ";
                }
            }
            print "|-->";
        }

        my $temp = $dir;
        $temp =~ s/^.+\///g;

        if ($size) {
            my $dir_size = -s $dir;
            say("$temp($dir_size)");
        }
        else {
            say("$temp");
        }

        while ( defined( my $file = readdir($dh) ) ) {
            chomp $file;

            next if ( ( $file eq "." ) or ( $file eq ".." ) );
            if ($tree) {
                handle_dir( "$dir/$file", $tree, $size, $padding + 4 );
            }
            else {
                handle_dir( "$dir/$file", $tree, $size, );
            }

            if ($tree) {
                if ( -f $file ) {
                    for ( 0 .. $padding + 4 ) {
                        print " ";
                    }
                    print "|";
                    for ( 0 .. 1 ) {
                        print "-";
                    }
                    say( ">", $file );
                }
            }
            else {
                say( ">", $file );
            }
        }
        closedir($dh) or die "Couldn't close dir: $dir, $!";
    }
}
return 1;