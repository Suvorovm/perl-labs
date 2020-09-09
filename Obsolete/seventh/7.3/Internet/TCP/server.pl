#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;
my $server_port = 1027;
my $tcp_server = IO::Socket::INET->new(
    LocalPort => $server_port,
    Type      => SOCK_STREAM,
    Reuse     => 1,
    Listen    => 20)
    or die "Can\'t use port:$server_port";

while (my $tcp_client = $tcp_server->accept()) {
    my $message = <$tcp_client>;
    print $message;
    $tcp_client->send("Hi from server!\n");
    close($tcp_client);
}
close($tcp_server);