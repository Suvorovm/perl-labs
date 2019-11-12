#! /bin/usr/perl

# push (@INC,"/home/twoxowt/Univer/Perl/perl-labs/fourth");
use lib "/home/twoxowt/Univer/Perl/perl-labs/fourth";
use servant;

#new('','','','','','','')


$first = construct(servant,'Халим','Хамзин','Равильевич','26.03.1999','Data Science','Аналитик','АД№090909');
$second = construct(servant,'Максим','Суворов','Дмитриевич','01.01.1999','GameDev','Разработчик','АИ№458975');

$first->show;
$second->show;