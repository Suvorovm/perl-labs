#! /bin/usr/perl

#Разработать программу, которая во входном файле отыскивает последовательности символов (лексемы), 
#соответствующие записи чисел арабскими цифрами, и заменяет их последовательностями символов,
# соответствующих записи чисел римскими цифрами. Имя входного файла вводится через командную строку 
#или с клавиатуры.

my %r = (
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
);

open (my $IN, "in.txt")  or  die  ("Cant open file : $!");

@strings = <$IN>;

#$str =~s/(\d+)/a2r($&)/ge;
#print $str;

foreach $line (@strings){
    #$line =~ s/M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/r2a($&)/ge;
    $line =~ s/(M{1,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|C?D|D?C{1,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|X?L|L?X{1,3})(IX|IV|V?I{0,3})|M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|I?V|V?I{1,3}))/r2a($&)/ge;
    print "$line";
  
}
close($IN);
open($OUT, ">out.txt") or  die  ("Cant open file : $!");
foreach $line (@strings){
        print $OUT "$line";
}

 
sub a2r {
    my ($in) = @_;
    my $result = "";
    my @ra = ('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');
    
    foreach my $i (@ra){
        my $repeat = int($in / $r{$i});
        $in -= $repeat * $r{$i};
        $result .= $i x $repeat;
    }
    return $result
}
 
sub r2a {
    my ($in) = @_;
    my $result = 0;
    my @chars = split("", $in);
    for (my $i=0; $i < @chars; $i++)
    {
        if($i + 1 < @chars && defined($r{$chars[$i] . $chars[$i + 1]}))
        {
            $result += $r{$chars[$i] . $chars[$i + 1]};
            $i++;
        }
        else
        {
            $result += $r{$chars[$i]};
        }
    }
    return $result;
}
 

#print(r2a("XCIX") ,"\n");