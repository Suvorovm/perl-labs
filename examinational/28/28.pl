#!/usr/bin/perl

use CGI qw(:standard);


print "Content-type: text/html\n\n";
print "<font size=+1>Environment</font>\n";
print "Адресс удаленного компьютера: $ENV{$REMOTE_ADDR}\n";
$datestring = gmtime();
print "Текущее время :  $datestring \n";