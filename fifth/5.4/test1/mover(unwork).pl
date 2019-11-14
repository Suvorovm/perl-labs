#! /bin/usr/perl

#Разработать программу, которая перемещает каталог вместе со всем его содержимым. 
#Имя исходного каталога и место назначения вводятся пользователем.

#  Метод для копирования файлов
use File::Copy;

#Исходное место каталога
$departure;
#Место назначения каталога
$destination;

print "Введите желаемый для перемещения каталог(полный путь):\n";

$departure = <STDIN>;
chomp($departure);
print "Введите желаемое место назначение каталога(полный путь):\n";

$destination = <STDIN>;
chomp($destination);

# Проверяем существуют ли такие каталоги
opendir(DEP, $departure) || die "Каталога не существует $! \n ";
opendir(DES, $destination) || die "Каталога не существует $! \n ";
closedir DEP; 
closedir DES;


copy_file($departure, $destination);
#system("rm -rf $deptrute");
# Метод рекурсивного копирования файлов с удалением
sub copy_file{

    my($dep_dir, $dis_dir) = @_;

    opendir(DEP, $dep_dir) || die "ERROR $! \n ";
    
    # Запихиваем содержимое каталога в массив
    @allFiles = readdir DEP;
    close DEP;
    foreach my $file (@allFiles){

        # Если обычный файл, просто перемещаем
        move("$dep_dir/$file", "$dis_dir/$file") || die "Невозможно перенести $dep_dir/$file  в $dis_dir/$file \n $!";


        #Я БЛЯТЬ 2 ЧАСА БАШКУ ЛОМАЛ КАКОГО ХУЯ ЭТО НЕ РАБОТАЕТ, НАДО БУДЕТ СПРСОИТЬ КАКОГО ХЕРА БЛЯТЬ
        =comment
        #Если текущий элемент каталог то выполняем рекурсивное копирование
        if(-d "$dep_dir/$file"){
            # Если это не текущий каталог и не ссылка на родительский каталог
            if($file ne "." && $file ne ".." ){
                #создаем каталог в месте, куда копируем файлы и 
                #выполняем рекурсивное копирование текущего каталога
                mkdir "$dis_dir/$file";
                copy_file("$dep_dir/$file", "$dis_dir/$file");

            }
        }
        else{

            
            # Если обычный файл, просто перемещаем
            move("$dep_dir/$file", "$dis_dir/$file") || die "Невозможно перенести $dep_dir/$file  в $dis_dir/$file \n $!";

            print "$dep_dir/$file успешно перемещен в $dis_dir/$file\n";
            
        }
        =cut

    }


    return;
}