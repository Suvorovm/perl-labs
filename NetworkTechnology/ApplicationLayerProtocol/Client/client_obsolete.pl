#!/usr/bin/perl -w


use IO::Socket;
use Net::hostent;
$PORT=9000; #need 2345 port
$server=IO::Socket::INET->new(Proto=>'tcp',LocalPort=>$PORT,Listen=>SOMAXCONN,Reuse=>1);
die "can't setup client" unless $server;
print $server "Client start succes\n";

while($client = $server->accept()){
 $client->autoflush(1);   
}

