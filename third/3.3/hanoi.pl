#! /bin/usr/perl

#Массивы стержней
@Aa;
@Bb;
@Cc;

$A = "A";
$B = "B";
$C = "C";

print"Введите количество дисков на 1 стержне:  ";
$disks = <STDIN>;

for($i = $disks; $i > 0; $i--){
push(@Aa, $i);
}


$buf=<STDIN>;

#\@Aa - ссылка на массив Aa
#$A - название массива(нужно для печати последовательности шагов)
#$disks - количество дисков
hanoiTower(\@Aa, $A, \@Bb, $B, \@Cc, $C, $disks);

print"\n--РЕЗУЛЬТАТ--";
print"\nAa: @Aa\n";
print"\nBb: @Bb\n";
print"\nCc:  @Cc\n";

sub hanoiTower{
    #Записываем в локальные переменные все параметры, которые мы передаем(@_ - все параметры здесь в виде массива)
    my ($first, $A, $second, $B, $third, $C, $n) = @_;
        
  
    if($n == 1){
        $disk = pop (@$first);
        push @$third, $disk;
        print"\nAa: @$first\n";
        print"\nBb: @$second\n";
        print"\nCc: @$third\n";
        print"Перенос диска диаметра $disk со стержня $A на стержень $C\n";
        return  
    }
    else{
        
        hanoiTower(\@$first, $A, \@$third, $C, \@$second, $B, $n-1);    
        $disk = pop(@$first);
        push @$third, $disk;
        print"Перенос диска диаметра $disk со стержня $A на стержень $C\n";
        hanoiTower(\@$second, $B, \@$first, $A, \@$third, $C, $n-1);
    }
       




}