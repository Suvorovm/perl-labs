#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;
my $server_port = 1037;
my $udp_server = IO::Socket::INET->new(
    LocalPort => $server_port,
    Proto     => "udp")
    or die "Can\'t use port: $!";

my $MAXLEN = 1024;
while (my $him = $udp_server->recv(my $datagram, $MAXLEN)) {
    print($datagram)
}