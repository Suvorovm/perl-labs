#! /bin/usr/perl

#Разработать программу, которая во входном файле отыскивает последовательности символов (лексемы), 
#соответствующие записи чисел арабскими цифрами, и заменяет их последовательностями символов, 
#соответствующих записи чисел римскими цифрами. Имя входного файла вводится через командную строку 
#или с клавиатуры.





print "Введите название файла:\n";

my $input = <STDIN>;
chomp($input);
sysopen(my $FILE, $input, O_RDWR) or die ("Файла не существует: $!\n");

while(<$FILE>){

   if ( $_ =~  m/d+/ ) {
   my ($used1, $used2) = $1, $2;
   print $used1;
   print $used2
   # here we will have the 524944 in the $used variable
   # and 1000000 in $total.
}
}

close($FILE);

