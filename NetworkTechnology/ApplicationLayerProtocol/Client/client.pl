#!/usr/bin/perl -w
use strict;
use warnings FATAL => 'all';
use POE;
use POE::Component::Client::TCP;
use POE::Filter::Reference;

my $host   = "localhost";    # The host to test.
my $port   = 7999;


POE::Component::Client::TCP->new(
  RemoteAddress => $host,
  RemotePort    => $port,
 # Filter        => "POE::Filter::Reference",
  Connected     => sub {
    my $j = "teste";
    print " The Seanse connected to $host:$port ...";
    #$_[HEAP]->{server}->put(\@values);
  },
  ConnectError => sub {
    print "could not connect to $host:$port ...";
  },
  ServerInput => sub {

    #when the server answer the question
    my ($kernel, $heap, $input) = @_[KERNEL, HEAP, ARG0];    

    if ($input eq "success"){
      print "\n Now you can work with server \n"
    }
    
    print $input. " ";;
    print "Input the coman\n";;
    my $comand = <STDIN>;
    chomp $comand;
    $_[HEAP]->{server}->put($comand);
  },

  
);
# Broadcast client input to everyone in the chat room.

$poe_kernel->run(); 

exit 0;