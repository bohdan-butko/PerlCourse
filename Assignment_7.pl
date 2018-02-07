#! /usr/bin/perl 

package main;

use 5.22.0;
use strict;
use warnings;

use Assignment_7_Book;

=pod

Write a console application which manages the database. 
It prints on a terminal all possible actions and waits for a user input.

load <file>        - loads the database file;
search [<pattern>] - searches for books by a given pattern.  
                     If a patten is not specified, the program prints all possible 
                     search srategies and waits until a user types a number of the strategy:
- by name
- by author
- ..

After choosing the strategy, the program prompts "Type a criteria" then waits for a user input.

add book - push a user through a dialog which prints prompts 
           "Type book name", "Type author", etc. 
           After that saves a new book to the database;

delete book <pattern> - deletes books; command find books by pattern, prints all found books. 
                        Then prints each found book and asks delete conformation. user types 
                        action yY - delete book nN - skip book A - detete all books remained in a list.

=cut

my $message;
my @books;
my $book;
my $file;

while (1) {
	say("\n======================================");
	say("Possible actions:");
	say("---load <file>");
	say("---show books");
	say("---add book");
	say("---delete book");
	say("---search [<pattern>]");

	print("\nEnter: ");

	$message = <STDIN>;
	chomp $message;

	if ($message =~ m/load (.*)/i) {
		($file) = ($message =~ m/load (.*)/i);
		
		open(my $fh, "<", $file) or die "Couldn't open file: $file, $!";

	        my $line = 1;

        while ( my $row = <$fh> ) {
            chomp $row;

            if ( $line == 1 ) {
                $book = new Assignment_7_Book();
                $book->set_title( substr $row, 7 );
            }
            if ( $line == 2 ) {
                $book->set_author( substr $row, 8 );
            }
            if ( $line == 3 ) {
                $book->set_section( substr $row, 9 );
            }
            if ( $line == 4 ) {
                $book->set_shelf( substr $row, 7 );
            }
            if ( $line == 5 ) {
                $book->set_on_hands( substr $row, 10 );
                push @books, $book;
            }

            $line++;

            if ( $line == 7 ) {
                $line = 0;
            }
        }
	}

	if ($message eq "show books") {
		foreach my $book (@books) {
			$book->print_info();
		}
	}

	if ($message eq "add book") {

		print("\nEnter Title: ");
		my $new_title = <STDIN>;
		chomp $new_title;

		print("\nEnter Author: ");
		my $new_author = <STDIN>;
		chomp $new_author;

		print("\nEnter Section: ");
		my $new_section = <STDIN>;
		chomp $new_section;

		print("\nEnter Shelf: ");
		my $new_shelf = <STDIN>;
		chomp $new_shelf;

		print("\nEnter on hands: ");
		my $new_on_hands = <STDIN>;
		chomp $new_on_hands;

		my $new_book = new Assignment_7_Book($new_title, $new_author, $new_section, $new_shelf, $new_on_hands);
		push @books, $new_book;

		open(my $fh, ">>", $file) or die "Couldn't open file: $file, $!";

		print($fh "\n\n");
		print($fh "Title: $new_title\n");
		print($fh "Author: $new_author\n");
		print($fh "Section: $new_section\n");
		print($fh "Shelf: $new_shelf\n");
		print($fh "On hands: $new_on_hands\n");

		close($fh);
	}

	if ($message eq "delete book") {
		print("Enter title to remove: ");
		my $title_to_remove = <STDIN>;
		chomp $title_to_remove;

		foreach my $book (@books) {
			if ($book->get_title() eq $title_to_remove) {
				$book = undef;
			}
		}
	}

	if ($message eq "search") {
		say("Options:");
		say("---by title");
		say("---by author");
		print("\nEnter: ");
		my $option = <STDIN>;
		chomp $option;

		if ($option eq "by title") {
			print("Enter title: ");
			my $titl = <STDIN>;
			chomp $titl;

			foreach my $book (@books) {
				if ($book->get_title() eq $titl) {
					$book->print_info();
				}
			}
		}

		if ($option eq "by author") {
			print("Enter author: ");
			my $athor = <STDIN>;
			chomp $athor;

			foreach my $book (@books) {
				if ($book->get_author() eq $athor) {
					book->print_info();
				}
			}
		}
	}
	# if ($message =~ m/search (.*)/i) {
	# 	my ($pattern) = ($message =~ m/search (.*)/i);

	# 	foreach my $book (@books) {
	# 		if ($book->get)
	# 	}
	# }
}


