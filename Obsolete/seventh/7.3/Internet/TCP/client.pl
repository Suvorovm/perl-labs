#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;

$| = 1;

my $remote_host = "localhost";
my $remote_port = 1027;
my $tcp_client = IO::Socket::INET->new(
    PeerAddr => $remote_host,
    PeerPort => $remote_port,
    Proto    => "tcp",
    Type     => SOCK_STREAM)
    or die "Can\'t connect to $remote_host!";

my $server_port = 1027;

print $tcp_client "Hello over there!\n";
shutdown($tcp_client, 1);
my $resp = "";
$tcp_client->recv($resp, 1024);
print $resp;
$tcp_client->close();
