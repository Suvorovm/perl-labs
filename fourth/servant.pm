#! /bin/usr/perl
package servant;
require Exporter;
@ISA = qw(UNIVERSAL Exporter);
@EXPORT = qw( construct DESTROY  show );
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
 $ref->SUPER::DESTROY; #вызов родительского деструктора
}


sub show{
    my $ref = shift;
    print "ИМЯ:                $ref->{Name}\n";
    print "Фамилия:            $ref->{Surname}\n";
    print "Отчество:           $ref->{Lastname}\n";
    print "Дата рожения:       $ref->{Birthday}\n";
    print "Сфера деятельности: $ref->{SphereOfActivity}\n";
    print "Проффессия:         $ref->{Profession}\n";
    print "Номер труд. книжки: $ref->{WorkBookNumber}\n";

}
1;