#! /bin/usr/perl

 use File::Find; 
 use File::stat;
#/home/suvorov/uni/perlLAbs/fifth/5.3/testsFiles


$outPut = "Введите путь\n";
print"Введите путь\n";
$path = <STDIN>;#c пустыми скобками не работатет
print"Введите расширение\n";
$expansion = <STDIN>;

chomp($path);
chomp($expansion);

opendir(DEP, $path) || die "Каталога не существует $! \n ";
PrintAndopenRecursive(DEP,$path,$expansion);


sub PrintAndopenRecursive {
    my($dirInfo,$path,$expansion) = @_;
    while (my $file = readdir($dirInfo)) {        
        if($file eq "." || $file eq ".."){
         #не сработало ne
        }else
            {                
                $pathTempory = "$path/$file";
                if (-d $pathTempory){      

                 PrintAndopenRecursive(DIR,$pathTempory,$_[2],$spaces)
                }else{
                    
                    if($file =~ ".$expansion"){                  
                    unlink $pathTempory; 
                    print "1\n";
                    }                                   
                }
            }                        
    }
    closedir($dirInfo);
}