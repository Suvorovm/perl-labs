#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;
my $remote_host = "localhost";
my $remote_port = 1027;
my $tcp_client = IO::Socket::INET->new(
    PeerAddr => $remote_host,
    PeerPort => $remote_port,
    Proto    => "tcp",
    Type     => SOCK_STREAM)
    or die "Can\'t connect to $remote_host!";
print $tcp_client "Hello over there!\n";
close($tcp_client);
