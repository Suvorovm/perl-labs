#! /bin/usr/perl
if (defined $head) { undef $head; }

$value     = "";
$countSpace = 10;

while ($ExitNumber !=5) {
  $~ = MENU_FORMAT;
  write;
  $ExitNumber = <>;
  if ($ExitNumber == 1) {
    PushData();
  }
  if ($ExitNumber == 2) {
    DeleteFromTree()
  }
  if ($ExitNumber == 3) {
    GenerateTree($head);
  }
  if($ExitNumber==4){
      print "\n";
      pirnt_tree($head,0);
  }
  chomp($ExitNumber);
  print "\n";
}

sub DeleteFromTree(){
    unless($head){
        print"Невохможено удалить пустое дерево !";
        return;
    }
    print "Введите значение для удаления";
    $itemToDellete = <>;
    Delete(undef,$head,$itemToDellete)
}

sub Delete(){
    my ($previusElement,$item,$itemToDellete) = @_;
    unless ($item){
        return;
    }
    if($itemToDellete == $item -> {VALUE}){
        unless ($previusElement){#readd
            $head = {};
            CheckSubBranch($head,$item->{LEFT});
            CheckSubBranch($head,$item->{RIGHT});
            return;

        }
        if($previusElement -> {VALUE} > $itemToDellete){
            $leftBranch = $item ->  {LEFT};
            $rightBranch = $item -> {RIGHT};
            unless($rightBranch){
                $_[0] -> {LEFT} =  $item -> {LEFT}; 
            }else{
            $_[0] -> {LEFT} =  $item -> {RIGHT};            
            CheckSubBranch($_[1] , $leftBranch);
            }
        }else{
            $leftBranch =  $_[1] -> {LEFT};
            $rightBranch = $item -> {RIGHT};
            unless($rightBranch){
                $_[0] -> {RIGHT} =  $item -> {LEFT}; 
            }else{
            $_[0] -> {RIGHT} =  $item -> {RIGHT}; 
            CheckSubBranch($_[1] ,$leftBranch);
            }
          
        }


        print "\n Элелемент ", $itemToDellete,"  удален";
        return;
    }#глушить ошибку если эллемента нет
    Delete($_[1],$_[1]->{LEFT},$itemToDellete);
    Delete($_[1],$_[1]->{RIGHT},$itemToDellete); 
}

sub CheckSubBranch(){
    my ($item,$SubBranch) = @_;
    unless ($item){
        return;
    }
    ReAddSubBranch($_[0],$_[1])  
} 

sub ReAddSubBranch(){

    my ($item,$SubBranch) = @_;
    unless ($SubBranch){
        return;
    }
    ReAddSubBranch( undef,$SubBranch->{LEFT} );
    $val = $SubBranch->{VALUE};
    push_data($head,$val);
    ReAddSubBranch(undef,$SubBranch->{RIGHT});
}

sub GenerateTree(){
    $head = undef;
    print "Какое кол-во эллементов хотите сгенерировать";
    $countOfElements = <>;
    StartGenerate($head,$countOfElements)
}

sub StartGenerate(){
    my ($item, $countOfElements) = @_;
    $element = 0;
    while ($countOfElements != 0){
            $element = int(rand(100));
            push_data($head,$element);
            $countOfElements = $countOfElements -1;
    }
    print "\n Успешно сгенерированно! \n"
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
    my ($item,$level) = @_;
    unless ($item){
        return;
    }
    $level = $level+$countSpace;
    pirnt_tree( $item->{RIGHT}, $level );
    $val = $item->{VALUE};
    print "\n";
    for (my $i=$countSpace; $i <= $level; $i++) {
     print " ";
    }
    print $val; 
    print "\n";
    pirnt_tree($item->{LEFT},$level);
}




format MENU_FORMAT  = 
1: Ввод занчений
2: Удалить данный эллемент
3: Сгенерировать дерево
4: Напечатать все
5: Выйти
.