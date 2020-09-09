#!/usr/bin/perl
 use File::Find; 
 use File::stat;
#/home/suvorov/work

my($typeWrite)  = @ARGV[0];
$outPut = "Введите путь\n";
print"Введите путь\n";
$path = <STDIN>;#c пустыми скобками не работатет
$outPut = $outPut.$path . "\n";
chomp($path);
opendir(DEP, $path) || die "Каталога не существует $! \n ";
PrintAndopenRecursive(DEP,$path,$outPut,2);


if($typeWrite eq "-f"){
    open  (my $OUT, "> output.txt")  or  die  ("Cant open file : $!");
    print $OUT $outPut;
}else{
    print $outPut;
}


sub PrintAndopenRecursive {
    my($dirInfo,$path,$outString,$spaces) = @_;
    while (my $file = readdir($dirInfo)) {        
        if($file eq "." || $file eq ".."){
         #не сработало ne
        }else
            {                
                $pathTempory = "$path/$file";
                if (-d $pathTempory){      
                 PrintSpasec($spaces);
                 $_[2] =  $_[2]."Дирректория : $file \n";                 
                 opendir(DIR, $pathTempory);
                 $spaces += 2; 
                 PrintAndopenRecursive(DIR,$pathTempory,$_[2],$spaces)
                }else{
                    PrintSpasec($spaces, $_[2]);
                    $_[2] =   $_[2]." Файл : $file ";                 
                    $_[2] =   $_[2].`ls -l $pathTempory`;                    
                }
            }                        
    }
    closedir($dirInfo);
}

sub PrintSpasec {
for (my $i=0; $i <= $_[0]; $i++) {
   $_[1] =  $_[1]." ";
}
}