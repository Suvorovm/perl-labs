
#! /bin/usr/perl
$END_INPUT  = 'Y';
if (defined $head) {undef $head;}
$name = "";
$surname = "";
$lastName = "";
$IdNumber = "";
$birthYear = "";
$IsStoped = 'N';

#ne - ключевое слово, позволяюще сделать сравнение  и сразу добавить отрицание -\_/-
while ($IsStoped ne $END_INPUT )
{ 
  print "Введите имя ";
  $name = <>;
  print "Введите фамилию ";
  $surname = <>;
  print "Введите Отчество ";
  $lastName = <>;
  print "Введите номер зачетной книжки ";
  $IdNumber = <>;
  print "Введите Год рождения ";
  $birthYear =<>;
  print "Закончить ввод ? Y/N ";
  $IsStoped = <>;
  chomp($IsStoped);#обрубаем служебный символ /n
  push_list($head, $name, $surname, $lastName , $IdNumber, $birthYear);
}
print "\n";
list_print($head);
#Добавление в список

sub push_list
{
  my ($item, $name, $surname, $lastName, $IdNumber, $birthYear)=  @_;
  my $currentHead = $item;
  unless ($item)
  { $item ={};                          
    $item->{NAME}= $name;
    $item->{SURNAME}= $surname;
    $item->{LASTNAME}= $lastName;
    $item->{IDNUMBER}=  $IdNumber;
    $item -> {BIRTHYEAR} = $birthYear; 
    $item->{NEXT}=undef;   
    $_[0]=$item;
    return;
  }
  if ($item->{IDNUMBER} > $IdNumber)
  { $item ={};                          
    $item->{NAME}= $name;
    $item->{SURNAME}= $surname;
    $item->{LASTNAME}= $lastName;
    $item->{IDNUMBER}=  $IdNumber;
    $item -> {BIRTHYEAR} = $birthYear; 
    $item->{NEXT}=$currentHead;   
    $_[0]=$item;
    return;
  }
 if ($item->{IDNUMBER} == $IdNumber)
  {
   warn "Такое значение уже есть в списке!\n";
  }
 else
 {
   push_list($item->{NEXT}, $name,$surname,$lastName,$IdNumber,$birthYear);
 }
}
sub insert_item(){
   my ($item, $name, $surname, $lastName, $IdNumber, $birthYear)=  @_;
   $item ={};                          
    $item->{NAME}= $name;
    $item->{SURNAME}= $surname;
    $item->{LASTNAME}= $lastName;
    $item->{IDNUMBER}=  $IdNumber;
    $item -> {BIRTHYEAR} = $birthYear; 
    $item->{NEXT}=undef;   
    $_[0]=$item;
    return;

}
#Печать списка
sub list_print ()
 {  my ($item) = shift @_;
  unless ($item) { return;}
  else
  {
  $name = $item->{NAME};
  $surname = $item->{SURNAME};
  $lastName = $item->{LASTNAME};
  $IdNumber = $item->{IDNUMBER};
  $birthYear = $item->{BIRTHYEAR};
  $~=SALUT_FORMAT;
  write;
  print("\n");    
  list_print ($item->{NEXT});
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