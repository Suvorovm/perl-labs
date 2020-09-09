
#! /bin/usr/perl

 use File::Find; 
 use File::stat;
#/home/suvorov/uni/perlLAbs/fifth/5.3/testsFiles


$outPut = "Введите путь\n";
print"Введите путь\n";
$path = <STDIN>;#c пустыми скобками не работатет
print"Введите последовательность символов\n";
$expansion =<STDIN>;
print"Игнорировать регистр ? Yes/No\n";
$ignoreCaseOut = <STDIN>;
$caseIgnored = 0;
chomp($ignoreCaseOut);
if($ignoreCaseOut  eq "Yes"){
$caseIgnored = 1
}

chomp($path);
chomp($expansion);


opendir(DEP, $path) || die "Каталога не существует $! \n ";
$outPut = "";
PrintAndopenRecursive(DEP,$path,$expansion,$caseIgnored);

open  (my $OUT, ">> report.txt")  or  die  ("Cant open file : $!");
 print $OUT "Выражени $expansion \n";
 close $OUT;


sub PrintAndopenRecursive {
    my($dirInfo,$path,$expansion,$caseIgnored,) = @_;
    while (my $file = readdir($dirInfo)) {        
        if($file eq "." || $file eq ".."){
         #не сработало ne
        }else
            {                
                $pathTempory = "$path/$file";
                if (-d $pathTempory){
                 PrintAndopenRecursive(DIR,$pathTempory,$_[2],$caseIgnored, )
                }else{
                    
                    if($caseIgnored){

                          if($file =~ m/$expansion/i){
                            $lowerExpr = lc($expansion);
                            $lowerFile = lc($file);
                            my $count = () = $lowerFile =~ /$lowerExpr/g;
                            $outputString = $outputString."Имя Файла $file Количество повторов $count \n"; 
                            open  (my $OUT, "> report.txt")  or  die  ("Cant open file : $!");
                            print $OUT $outputString;
                            close $OUT;
                        }
                    }
                     else{
                            if($file =~ m/$expansion/){
                            $count = ($file =~ tr/$expansion//);
                            $outputString = $outputString."Имя Файла $file Количество повторов $count \n"; 
                            open  (my $OUT, "> report.txt")  or  die  ("Cant open file : $!");
                            print $OUT $outputString;
                            close $OUT;
                           
                             } 
                           
                         }                     
                                                      
                 }
            }                        
    }
    closedir($dirInfo);
}