$outPut = "Введите путь\n";
print"Введите путь\n";
$path = <STDIN>;

if (-w $path){
    print "В файл можно записать"
}else{
    print "В файл нельзя записать"
}