#! /usr/bin/perl

package main;

use 5.22.0;
use strict;
use warnings;

=pod

Create a program that checks a date given by user.
It should accept dates in two formats:
"May 01 2017" and "12-31-2031".
A name of the month may contain symbols of a mixed case.
Your program should perform a syntax check and a logical check,
i.e. there is no "Feb 30 2027" or "14-15-2019".
As a result, the program should print on a terminal:
"Syntax: OK, Date is valid" or something like that.
Use regular expressions to accomplish this task.

=cut
print("Enter date(MM-DD-YYYY / MM DD YYYY): ");
my $date = <STDIN>;
chomp $date;


my ($month, $separator, $day, $year) = ($date =~ m/(\d+|\w+)([\s{1}|\-])(\d+)[\s{1}|\-](\d+)/i);

my $checker = "$day"."$separator"."$month"."$separator"."$year";

if ($checker =~ m/(0[1-9]|1[0-9]|2[0-8]|29((?=[\-|\s{1}](([0][13-9]|1[0-2])|(Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))|(?=[\-|\s{1}]((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))[\-|\s{1}]([0-9]{2}(0[48]|[13579][26]|[2468][048])|([02468][048]|[13579][26])00))))|30(?=-(0[13-9]|1[0-2]))|31(?=-(0[13578]|1[02])))[\-|\s{1}]((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))[\-|\s{1}][0-9]{4}/i) {
	say("OK");
} else {
	say("Smth wrong");
}
=pod

MM-DD-YYYY
wrong
((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))[\s{1}|\-](0[1-9]|1[0-9]|2[0-8]|29((?=[\-|\s{1}](([0][13-9]|1[0-2])|(Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))|(?=[\-|\s{1}]((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))[\s{1}|\-]([0-9]{2}(0[48]|[13579][26]|[2468][048])|([02468][048]|[13579][26])00))))|30(?=[\-|\s{1}](0[13-9]|1[0-2]))|31(?=[\-|\s{1}](0[13578]|1[02])))[\s{1}|\-][0-9]{4}

DD-MM-YYYY
^(0[1-9]|1[0-9]|2[0-8]|29((?=-(([0][13-9]|1[0-2])|(Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))|(?=-((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))-([0-9]{2}(0[48]|[13579][26]|[2468][048])|([02468][048]|[13579][26])00))))|30(?=-(0[13-9]|1[0-2]))|31(?=-(0[13578]|1[02])))-((0[1-9]|1[0-2])|(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))-[0-9]{4}$

=cut

