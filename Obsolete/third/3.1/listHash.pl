
#! /bin/usr/perl
$END_INPUT = 'Y';
if (defined $head) { undef $head; }

$name      = "";
$surname   = "";
$lastName  = "";
$IdNumber  = "";
$birthYear = "";
$IsStoped  = 'N';

while ($ExitNumber != 5) {
  $~ = MENU_FORMAT;
  write;
  $ExitNumber = <>;
  if ($ExitNumber == 1) {
    PushData();
  }
  if ($ExitNumber == 2) {
    DeleteById();
  }
  if ($ExitNumber == 3) {
    list_print($head);
  }
  if($ExitNumber == 4){
    print "\tname\t surname\t lastName\t Number\t \t year\t \n";
    print_by_tables($head);
  }
  chomp($ExitNumber);
}

sub DeleteById {
  print "Введите Id зачетки \n";
  my $numberId = <>;
  delete_from_list($head, undef, $numberId);
}

#ne - ключевое слово, позволяюще сделать сравнение  и сразу добавить отрицание -\_/-
sub PushData {
  print "Введите имя ";
  $name = <>;
  print "Введите фамилию ";
  $surname = <>;
  print "Введите Отчество ";
  $lastName = <>;
  print "Введите номер зачетной книжки ";
  $IdNumber = <>;
  print "Введите Год рождения ";
  $birthYear = <>;
  push_list($head, $name, $surname, $lastName, $IdNumber, $birthYear);
}
print "\n";

#Добавление в список
sub push_list {
  my ($item, $name, $surname, $lastName, $IdNumber, $birthYear) = @_;
  my $currentHead = $item;
  unless ($item) {
    $item                = {};
    $item->{ NAME }      = $name;
    $item->{ SURNAME }   = $surname;
    $item->{ LASTNAME }  = $lastName;
    $item->{ IDNUMBER }  = $IdNumber;
    $item->{ BIRTHYEAR } = $birthYear;
    $item->{ NEXT }      = undef;
    $_[0]                = $item;
    return;
  }
  if ($item->{ IDNUMBER } > $IdNumber) {
    $item                = {};
    $item->{ NAME }      = $name;
    $item->{ SURNAME }   = $surname;
    $item->{ LASTNAME }  = $lastName;
    $item->{ IDNUMBER }  = $IdNumber;
    $item->{ BIRTHYEAR } = $birthYear;
    $item->{ NEXT }      = $currentHead;
    $_[0]                = $item;
    return;
  }
  if ($item->{ IDNUMBER } == $IdNumber) {
    warn "Такое значение уже есть в списке!\n";
  }
  else {
    push_list($item->{ NEXT }, $name, $surname, $lastName, $IdNumber, $birthYear);
  }
}



#Печать списка
sub list_print () {
  my $item = shift @_;
  unless ($item) {
    print "конец списка\n";
    return;
  }
  else {
    $name      = $item->{ NAME };
    $surname   = $item->{ SURNAME };
    $lastName  = $item->{ LASTNAME };
    $IdNumber  = $item->{ IDNUMBER };
    $birthYear = $item->{ BIRTHYEAR };
    $~         = SALUT_FORMAT;
    write;
    print("\n");
    list_print ($item->{NEXT});
  }
}
sub print_by_tables{
  my $item = shift @_;
  unless ($item) {
    print "конец списка\n";
    return;
  }
  else {
    $name     = $item->{ NAME };
    chomp($name);
    $name  ="\t".$name."\t";
    #print $name;
   

    $surname   = $item->{ SURNAME };
    chomp($surname);
    $surname   = $surname."\t \t";
    #print $surname;
    
    
    $lastName  = $item->{ LASTNAME };
    chomp( $lastName );
    $lastName = $lastName."\t  \t";
   # print $lastName ;
    #print "\t";

    $IdNumber  = $item->{ IDNUMBER };
    chomp( $IdNumber );
    $IdNumber = $IdNumber."\t  \t";

    
    $birthYear = $item->{ BIRTHYEAR };
    chomp( $birthYear );
    $birthYear = $birthYear."\t  \t";

    $result  = $name.$surname.$lastName.$IdNumber.$birthYear;
    print($result);   
    print("\n");
    print_by_tables($item->{NEXT});
  }
}

sub delete_from_list {
  $item = $_[0];
  my $previousHead
      = $_[1];    #Передача по ссылке, чтобы сработало, нужно обращать напрямик к $_[n]
  my $numberToDellete = $_[2];
  unless ($item) {
    print "такого эллемента не существует\n";
    return;
  }
  if ($item->{ IDNUMBER } == $numberToDellete) {
    if ($previousHead == undef) {
      $_[0] = $item->{ NEXT };
      return;
    }

    if ($_[0]->{ NEXT } == undef) {
      undef $_[1]->{ NEXT };
      undef $_[0];
      return;
    }

    $_[1]->{ NEXT } = $_[0]->{ NEXT };
    return;
  }
  else {
    delete_from_list($_[0]->{ NEXT }, $_[0], $numberToDellete);
  }
}

format SALUT_FORMAT=	
Имя:^|||||||||||||||||
$name
Фамилию:^|||||||||||||||||
$surname
Отчество:^|||||||||||||||||
$lastName
Номер зачетной книжки:^|||||||||||||||||
$IdNumber
Дата рождения:^|||||||||||||||||
$birthYear
.

format MENU_FORMAT  = 
1: Ввод данынх
2: Удалить данные по ID зачеток
3: Вывести даныне
4: Печать по столбцам
5: Выйти
.