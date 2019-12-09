#!/usr/bin/perl -w
use strict;
use warnings FATAL => 'all';
use CGI qw(:standard);
print "Content-type: text/html\n\n";

my $filename = 'data.txt';
if (open(my $fh, '>>', $filename)) {
    if (param()) {
        my $message = param('message');
        my $username = param('username');
        print $fh "$username: $message\n";
    }
    close($fh);
}

if (open(my $fh, $filename)) {
    while (my $row = <$fh>) {
        print("<div>$row</div>");
    }
    close($fh);
}
