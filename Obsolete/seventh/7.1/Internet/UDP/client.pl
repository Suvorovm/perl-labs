#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Socket;

my $remote_port = 1027;
my $remote_host = 'localhost';

socket(CLIENT, PF_INET, SOCK_DGRAM, getprotobyname('udp'));
my $internet_addr = inet_aton($remote_host)
    or die "Couldn\'t  build Internet address for $remote_host";
connect(CLIENT, sockaddr_in($remote_port, $internet_addr))
    or die "Can\'t connect to $remote_host:$!";

my $message = "Hello!\n";
print CLIENT $message;
close(CLIENT);
