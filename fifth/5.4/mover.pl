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
        
    }

    return;
}