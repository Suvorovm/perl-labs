#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Socket;

my $server_port = 1027;
socket(my $server, PF_INET, SOCK_DGRAM, getprotobyname('udp'));
setsockopt($server, SOL_SOCKET, SO_REUSEADDR, 1);
bind($server, sockaddr_in($server_port, INADDR_ANY))
    or die "Can\'t create server:$!";

my $datagram;
my $flags = fcntl($server, MSG_PEEK, 0);
while (my $him = recv($server, $datagram, 42, $flags)) {
    print "Test: $datagram\n";
}