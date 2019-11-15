#! /bin/usr/perl

##########sudo apt-get install libswitch-perl ОБЯЗАТЕЛЬНО УСТАНОВИТЬ!!!!#########
# push (@INC,"/home/twoxowt/Univer/Perl/perl-labs/fourth");
use lib "/home/twoxowt/Univer/Perl/perl-labs/fourth";
use servant;
use Switch;


my $instance;

while($choose != 5){
    $~=menu;
    write;
    print "Ввод: ";
    my $choose = <STDIN>;
    chomp($choose);

    switch($choose){
    case 1 {$instance = createInstance();}
    case 2 {&changeValue;}
    case 3 {&showInstance;}
    case 4 {&deleteValue;}
    case 5 {exit;}
    else {print "Неизвестнай команда\n";}
    }

}

#Создание объекта класса servant
sub createInstance{

    print "NAME: ";
    $name = <STDIN>;
    print "SURNAME: ";
    $surname = <STDIN>;
    print "LASTNAME: ";
    $latname = <STDIN>;
    print "BIRTHDAY: ";
    $birth = <STDIN>;
    print "SPHERE: ";
    $sphere = <STDIN>;
    print "PROFFESION: ";
    $proff = <STDIN>;
    print "WORKNUMBER: ";
    $wrknum = <STDIN>;

    #Передаем все введеные даные в конструктор servant'а
    return construct(servant, $name, $surname, $latname, $birth, $sphere, $proff, $wrknum);

}


sub deleteValue{
    unless($instance){
        print "Объект не объявлен\n";
        return;
    }
    $instance->DESTROY();
}

sub showInstance{
    unless($instance){
        print "Объект не объявлен\n";
        return;
    }
    $instance->show();
}

sub changeValue{
    unless($instance){
        print "Объект не объявлен\n";
        return;
    }
    print "Что требуется изменить?\n";
    print "1.Имя\n2.Фамилия\n3.Отчество\n4.Дата рождения\n5.Сфера деятельности\n";
    print "6.Проффесия\n7.Номер трудовой книжки\n8.Отмена\n";
    
    my $choose2 = <STDIN>;
    my $change;
    my $field;
    chomp($choose2);
    switch($choose2){
    case 1 {print"Введите Имя:\n"; $field = "Name";}
    case 2 {print"Введите Фамилию:\n"; $field = "Surname";}
    case 3 {print"Введите Отчество:\n"; $field = "Lastname";}
    case 4 {print"Введите Дату рождения:\n"; $field = "Birthday";}
    case 5 {print"Введите Сферу деятельности:\n"; $field = "SphereOfActivity";}
    case 6 {print"Введите Проффесию:\n"; $field = "Profession";}
    case 7 {print"Введите Номер трудовой книжки:\n"; $field = "WorkBookNumber";}
    case 8 {return;}
    else {print "Неизвестнай команда\n";}
    }

    $change = <STDIN>;

    $instance->change($change, $field);
}



format menu =
---------------------------
-----------СЛУЖАЩИЙ--------
---------------------------
---     1.Заполнить     ---
---     2.Изменить      ---
---     3.Показать      ---
---     4.Удалить       ---
---      5.Выйти        ---
---------------------------
.