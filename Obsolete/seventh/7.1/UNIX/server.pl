#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Socket;

socket(SERVER, PF_UNIX, SOCK_STREAM, 0);
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1);
my $catsock = '/tmp/catsock';
unlink $catsock;
bind(SERVER, sockaddr_un($catsock))
    or die "Can\'t create server:$!";
listen(SERVER, SOMAXCONN)
    or die "Can\'t listen this socket:$!";

for (; accept(CLIENT, SERVER); close(CLIENT)) {
    while (defined(my $message = <CLIENT>)) {
        print $message;
    }
}
close(SERVER);
