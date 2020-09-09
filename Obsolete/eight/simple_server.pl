#!/usr/bin/perl
use warnings;
use strict;
chdir("eight");
print `python3 -m http.server --cgi 8000`;