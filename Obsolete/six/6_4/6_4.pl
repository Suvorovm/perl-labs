#!/usr/bin/perl

#ПОТОМУ ЧТО Я ПОЛЕНИЛСЯ НАПИСАТЬ НОРМАЛЬНО И БЕЗ КОПИПАСТА
use Encode;
use Text::Iconv;
use Encode qw/ decode /;
print "Введите путь к файлу\n";
$filePath = <STDIN>;#"/home/suvorov/uni/perlLAbs/six/6_4/files/input_dos866";
chomp $filePath;
print "Введите тип конвертации \n 1 - windows1251 - Utf-16 \n2 - dos866-windows1251\n";
$type =  <STDIN>;
chomp $type;
$resutString = '';
if ($type == 1){
    if (open(my $fh, '<:encoding(windows-1251)', $filePath)) {
    while (my $row = <$fh>) {
        chomp $row;
        $resutString = $resutString.$row;
    }
} 
else {
  warn "Could not open file '$filePath' $!";
}
    binmode($resutString, ":encoding(UTF-16)");
    open   (my $outPutDesc,'>:encoding(UTF-16)', "out.put")  or  die  ("Cant open file : $!");
    print $outPutDesc $resutString;
}
else{
    if (open(my $fh, '<:encoding(CP-866)', $filePath)) {
        while (my $row = <$fh>) {
            chomp $row;
            $resutString = $resutString.$row;
        }
        } else {
         warn "Could not open file '$filePath' $!";
        }   
    binmode($resutString, ":encoding(windows-1251)");
    #$resutString = decode('Windows-1251', $resutString);
    open   (my $outPutDesc,'>:encoding(windows-1251)', "out.put")  or  die  ("Cant open file : $!");
    print $outPutDesc $resutString;
}