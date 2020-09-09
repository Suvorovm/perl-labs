#! /bin/usr/perl

#Решить задачу 3 из лабораторной работы № 3, 
#выдавая выходную информацию в текстовый файл.



# +> - чтение и запись с очисткой    > только запись
open  (my $OUT, "> output.txt")  or  die  ("Cant open file : $!");

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

print $OUT "\nAa: @Aa\n";
print $OUT "\nBb: @Bb\n";
print $OUT "\nCc:  @Cc\n";

#\@Aa - ссылка на массив Aa
#$A - название массива(нужно для печати последовательности шагов)
#$disks - количество дисков
hanoiTower(\@Aa, $A, \@Bb, $B, \@Cc, $C, $disks);

print $OUT "\n--РЕЗУЛЬТАТ--";
print $OUT "\nAa: @Aa\n";
print $OUT "\nBb: @Bb\n";
print $OUT "\nCc:  @Cc\n";

print "Данные записаны в файл output.txt\n";

sub hanoiTower{
    #Записываем в локальные переменные все параметры, которые мы передаем(@_ - все параметры здесь в виде массива)
    my ($first, $A, $second, $B, $third, $C, $n) = @_;
        
  
    if($n == 1){    
        $disk = pop (@$first);
        push @$third, $disk;   
        print $OUT "Перенос диска диаметра $disk со стержня $A на стержень $C\n";
        return  
    }
    else{
        
        hanoiTower(\@$first, $A, \@$third, $C, \@$second, $B, $n-1);    
        $disk = pop(@$first);
        push @$third, $disk;
        print $OUT "Перенос диска диаметра $disk со стержня $A на стержень $C\n";
        hanoiTower(\@$second, $B, \@$first, $A, \@$third, $C, $n-1);
    }  

}