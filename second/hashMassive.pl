#! /bin/usr/perl
use Switch;

#Все форматы и процедруки внизу

%hashMassive;
%hashName;
%hashAge;

# Добавляем исходные значения в хеш-массивы
$hashMassive{1} = 2;
$hashMassive{2} = 3;
$hashMassive{3} = 4;

$hashName{1} = "Иван";
$hashName{2} = "Артур";
$hashName{3} = "Кирилл";

$hashAge{1} = 20;
$hashAge{2} = 18;
$hashAge{3} = 39;

#Счетсик хеш - массива
$countMassive = 4;

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

    $hashMassive{$countMassive} = $countMassive + 1;

    print "\n\n\n";
    print "Введите имя:     ";
    $name = <STDIN>;
    chomp($name);
    print "Введите возраст: ";
    $age = <STDIN>;
    chomp($age);
    $hashName{$countMassive} = $name;
    $hashAge{$countMassive} = $age;
    $countMassive++;
    print "\n\n\n";
}


#Удаление элемента их хеш-массива
sub deleteValue{
    print "\n\n\n";
    print "Введите имя:   ";
    $nameDelete = <STDIN>;
    chomp($nameDelete);
    $keyDelete = 0;


    #ТУТ ПИЗДЕЦ ИФ СЧИТАЕТ ЧТО У ВСЕХ ИМЕНА ОДИНАКОВЫЕ
    # foreach $k (keys %hash){
    # print "$k = $hash{$k}\n";
    # }
    foreach $k (keys %hashName){
        if($hashName{$k} eq $nameDelete){
            #Заптминаем ID для удаления из других хеш-массивов
           $keyDelete = $k;
        #    print("RES = $k\n");
           break;
        }
    }
    
    

    # print("Удаляем элемент с ID = $keyDelete");
    delete ($hashName{$keyDelete});
    delete ($hashAge{$keyDelete});

    #Ключ для ID
    $key = 0;
    #Значение для ID
    $val = 0;

    while(@Res = each %hashMassive){

       if($Res[0] == $keyDelete){
           $val = $Res[1];
           break;
       }
    }
    while(@Res = each %hashMassive){
        if($Res[1] == $keyDelete){
           $key = $Res[0];
           break;
       }
    }

    delete($hashMassive{$keyDelete});

    $hashMassive{$key} = $val;


    print "\n\n\n";
}

sub showHashMassive{
#    print "\n\n\n ХЕШ-МАССИВ ID\n\n";
#    while(@Res = each %hashMassive){

#        print "$Res[0] = @Res[1]\n";
#    }
#    print "\n\n\n";

#    print "\n\n\n ХЕШ-МАССИВ Name\n\n";
#    while(@Res = each %hashName){
#        print "$Res[0] = @Res[1]\n";
#    }
#    print "\n\n\n";

#    print "\n\n\n ХЕШ-МАССИВ Age\n\n";
#    while(@Res = each %hashAge){
#        print "$Res[0] = @Res[1]\n";
#    }
#    print "\n\n\n";


   print "\n\n\n ХЕШ-МАССИВ ID\n\n";

   print("ID    Name    Возраст\n");

   foreach $k (keys %hashMassive){
       if($k != 0){

       
        foreach $kN (keys %hashName){
            if($k == $kN){
                $Nam = $hashName{$kN};
            }
        }

            foreach $kA (keys %hashAge){
            if($k == $kA){
                $Age = $hashAge{$kA};
            }
        }
            

            print("$k   $Nam    $Age\n");
       }
   }
   print "\n\n\n";


}


