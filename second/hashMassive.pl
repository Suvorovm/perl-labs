#! /bin/usr/perl
use Switch;

#Все форматы и процедруки внизу

%hashMassive;
while($choose != 4){
    $~=menu;
    write;
    print "What you want?: ";
    $choose = <STDIN>;

    # Нужен для отсечения \n, а то когда ты Enter нажимаешь получается "1\n"
    chomp($choose);

    switch($choose){
    case 1 {&addValue;}
    case 2 {&deleteValue;}
    case 3 {&showHashMassive;}
    case 4 {exit;}
    else {print "Неизвестнай команда";}
    }

}

format menu =
---------------------------
-------HASH-MASSIVE--------
---------------------------
---     1.Добавить      ---
---     2.Удалить       ---
---     3.Показать      ---
---      4.Выйти        ---
---------------------------
.

#Добавление элемента в хеш-массив
sub addValue{
    print "\n\n\n";
    print "Введите ключ:     ";
    $keyAdd = <STDIN>;
    chomp($keyAdd);
    print "Введите значение: ";
    $valueAdd = <STDIN>;
    chomp($valueAdd);
    $hashMassive{$keyAdd} = $valueAdd;
    print "\n\n\n";
}


#Удаление элемента их хеш-массива
sub deleteValue{
    print "\n\n\n";
    print "Введите ключ элемента:   ";
    $keyDelete = <STDIN>;
    chomp($keyDelete);
    delete ($hashMassive{$keyDelete});
    print "\n\n\n";
}

sub showHashMassive{
   print "\n\n\n ХЕШ-МАССИВ\n\n";
   while(@Res = each %hashMassive){
       print "$Res[0] = @Res[1]\n";
   }
   print "\n\n\n";
}