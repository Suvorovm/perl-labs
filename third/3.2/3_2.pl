#! /bin/usr/perl
$END_INPUT = 'Y';
if (defined $head) { undef $head; }

$value      = "";


while ($ExitNumber !=5) {
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
  if($ExitNumber==4){
      pirnt_tree($head)
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
  print "Введите значение ";
  $value = <>; 
  push_data($head, $value);
}
print "\n";

#Добавление в список
sub push_data() {
   my ($item, $value) = @_;
   unless ($item){
       $_[0]       = {};
       $_[0]->{VALUE} = $value;
       return;
   }
    if($item->{VALUE}>$value){
        push_data($item->{LEFT},$value)
    }else{
        push_data($item->{RIGHT},$value)
    }
}


sub pirnt_tree(){
    my ($item) = @_;
    unless ($item){
        return;
    }
    pirnt_tree( $item->{LEFT} );
    $val = $item->{VALUE};
    print "Значение = " + $val;
    print"\n";
    pirnt_tree($item->{RIGHT});
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
1: Ввод занчений
2: Удалить данный эллемент
3: Сгенерировать дерево
4: Напечатать все
5: Выйти
.