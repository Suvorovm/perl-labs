#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;

my $catsock = '/tmp/catsock';
unlink $catsock;
my $UNIX_server = IO::Socket::UNIX->new(
    Local  => $catsock,
    Listen => 15
) or die "Can\'t create socket :$!";

for (; accept(CLIENT, $UNIX_server); close(CLIENT)) {
    while (defined(my $message = <CLIENT>)) {
        print $message;
    }
}
close($UNIX_server);