#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Socket;

my $catsock = '/tmp/catsock';
my $UNIX_client = IO::Socket::UNIX->new(
    Peer => $catsock,
    Timeout => 15)
    or die "Can\'t use socket :$!";

print $UNIX_client "UNIX socket\n";
close ($UNIX_client);
