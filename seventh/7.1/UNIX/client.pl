#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Socket;
socket (CLIENT, PF_UNIX, SOCK_STREAM,0);
my $catsock = '/tmp/catsock';
connect (CLIENT,sockaddr_un($catsock))
    or die "Can\'t connect to $catsock: $!";
my $message = "UNIX socket\n";
print CLIENT $message;
close (CLIENT);