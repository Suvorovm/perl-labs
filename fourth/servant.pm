#! /bin/usr/perl
package servant;
require Exporter;
use Switch;
@ISA = qw(UNIVERSAL Exporter);
@EXPORT = qw( construct DESTROY show change );
# Служащие — социальная группа, включающая всех 
# занятых по найму нефизическим трудом 
# в промышленности (инженеры, бухгалтеры, секретари и так далее),
#  а также наёмных работников в торговле и сфере услуг.


#Конструктор
sub construct{
    #Обязательно передавать в конструктор имя класса
    my $classname = shift;
    my $srv = {};
    $srv->{Classname} = $classname;
    #Имя
    $srv->{Name} = shift;
    #Фамилия
    $srv->{Surname} = shift;
    #Отчество
    $srv->{Lastname} = shift;
    #Дата рождения
    $srv->{Birthday} = shift;
    #Сфера деятельности
    $srv->{SphereOfActivity} = shift;
    #Проффесия
    $srv->{Profession} = shift;  
    #номер трудовой книжки
    $srv->{WorkBookNumber} = shift;
    #превращает ссылку в объект класса.
    bless $srv, servant;
    return $srv;
}

sub DESTROY{
    my $ref =shift;
    # $ref->SUPER::DESTROY; #вызов родительского деструктора
    print "Объект удален\n";
}

sub change{
    my $ref = shift;
    my $val = shift;
    my $field = shift;

    switch($field){
    case "Name" {$ref->{Name} = $val;}
    case "Surname" {$ref->{Surname} = $val;}
    case "Lastname" {$ref->{Lastname} = $val;}
    case "Birthday" {$ref->{Birthday}=$val;}
    case "SphereOfActivity" {$ref->{SphereOfActivity}=$val;}
    case "Profession" {$ref->{Profession}=$val;}
    case "WorkBookNumber" {$ref->{WorkBookNumber}=$val;}
    else {print "\n";}
    }



}


sub show{
    my $ref = shift;
    print "Имя:                $ref->{Name}\n";
    print "Фамилия:            $ref->{Surname}\n";
    print "Отчество:           $ref->{Lastname}\n";
    print "Дата рожения:       $ref->{Birthday}\n";
    print "Сфера деятельности: $ref->{SphereOfActivity}\n";
    print "Проффессия:         $ref->{Profession}\n";
    print "Номер труд. книжки: $ref->{WorkBookNumber}\n";

}
1;