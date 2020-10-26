#!/usr/bin/perl -w
use strict;
BEGIN { $ENV{PATH} = '/usr/ucb:/bin' }
use Socket;
use Carp;
sub logmsg { print "$0 $$: @_ at ", scalar localtime, "\n" } #loging



my $port = shift || 2345;
my $proto = getprotobyname('tcp');
$port = $1 if $port =~ /(\d+)/;
socket(Server, PF_INET, SOCK_STREAM, $proto)|| die "socket: $!";
setsockopt(Server, SOL_SOCKET, SO_REUSEADDR,pack("l", 1)) || die "setsockopt: $!";
bind(Server, sockaddr_in($port, INADDR_ANY)) || die "bind: $!";
listen(Server,SOMAXCONN) || die "listen: $!";
logmsg "server started on port $port";
my $waitedpid = 0;
my $paddr;

sub REAPER {
    $waitedpid=wait;
    $SIG{CHLD}=&REAPER;# loathe sysV
    logmsg "reaped $waitedpid" . ($? ? " with exit $?" : '');
}

$SIG{CHLD}=&REAPER;

