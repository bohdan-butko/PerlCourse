#! /usr/bin/perl

package DL_lab5;

use 5.22.0;
use strict;
use warnings;

# return list of addresses
sub read_hosts($) {
	my ($file) = @_;
	my @addresses = ();
	
	open(my $input_file_handler, "<", $file)
		or die "Couldn't open file: $file, $!";
	
	while (my $host = <$input_file_handler>) {
		chomp $host;
		push @addresses, $host;
	}
	
	close($input_file_handler);
	return @addresses;
}

# returns a list which includes:
# IP address, domain name of the host (if exists), % loss, max time;
sub check($$) {
	my ($host, $amount) = @_;
	
	my $result = `ping -c $amount $host`;
	my ($remote_ip) = ($result =~ m/^PING .* \((\d+\.\d+\.\d+\.\d+)\)/g);
	my ($loss) = ($result =~ m/(\d+)\% packet loss/g);
	my $max_time = 0;
  
	for (1 .. $amount) {
	  my ($time) = ($result =~ m/icmp_seq=$_ ttl=\d+ time=(\d+\.\d+)/g);  
    
	  if ($time > $max_time) {
	    $max_time = $time; 
	  }
	}
	
	return ($host, $remote_ip, $max_time, $loss);
}

sub print_res(\@;$) {
	my @results = @{$_[0]};
	my $output_file = $_[1];
	
	if ($output_file) {
		open(my $output_file_handler, ">", $output_file)
			or die "Couldn't open file: $output_file, $!";
			
		foreach my $result (@results) {
			my ($host, $remote_ip, $max_time, $loss) = @{$result};
			
			say($output_file_handler "$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
			say("$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
		}
		
		close($output_file_handler);
	} else {
		foreach my $result (@results) {
			my ($host, $remote_ip, $max_time, $loss) = @{$result};
			
			say("$host ($remote_ip): max_time = $max_time ms; $loss% of loss;");
		}
	}	
}
return 1;