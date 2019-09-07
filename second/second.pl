#! /bin/usr/perl
@FerstArray ;
@SecondArray;
print "Enter first arry\n";
while ($line = <STDIN> and $line!="") {
push(@FerstArray,$line);
}

print "Enter second arry\n";
#завершение строки - пустая строчка
while ($line = <STDIN> and $line!="") {
push(@SecondArray,$line);
}
if (@FerstArray!=@SecondArray){

print "You enter different count of ellements\n";
     exit;
}
@summoFTwoArray = (@FerstArray, @SecondArray);
print" the Union of sets\n @summoFTwoArray";
@intersection;
foreach $itemFirst (@FerstArray){
   foreach $itemSecond (@SecondArray){
      if($itemFirst==$itemSecond){
         $temporyVarable = $itemFirst;
         push(@intersection,$temporyVarable)
      }
   }
}
print "The intersection's arrays are: \n @intersection";

@differenceFirstWithOutSecond;
foreach $itemFirst (@FerstArray){
   foreach $itemSecond (@intersection){
      if($itemFirst!=$itemSecond){
         $temporyVarable = $itemFirst;
         push(@differenceFirstWithOutSecond,$temporyVarable);
      }
   }
}

print "\n The difference First array without Second are:\n @differenceFirstWithOutSecond";

@differenceSecondWithOutFirst;
foreach $itemFirst (@SecondArray){
   foreach $itemSecond (@intersection){
      if($itemFirst!=$itemSecond){
         $temporyVarable = $itemFirst;
         push(@differenceSecondWithOutFirst,$temporyVarable);
      }
   }
}

print "\n The difference Second array without First are:\n @differenceSecondWithOutFirst";

@symmetricDifference = (@differenceFirstWithOutSecond,@differenceSecondWithOutFirst);

print "\n The symetric difference are:\n @symmetricDifference";
print"\n";
#---2---------------------------------------------------------

@permutationArray = @FerstArray;
$counter = 0;

# $counter - 2 нормально не работает в цикле поэтому два раза по $counter--
 for ($counter = $#permutationArray; $counter > 0; $counter--){
 
    $buf = $permutationArray[$counter];
    $permutationArray[$counter] = $permutationArray[$counter-1];
    $permutationArray[$counter-1] = $buf;
    $counter--;
    
    # Эта хуйня не работает. ебанная меточика в рот ебал
    # $permutationArray[$counter-1,$counter] = $permutationArray[$counter,$counter-1];
 }

 print "The permutation array :\n @permutationArray";
 
 
#--3----------------------------------------------------------

@evenOddMassive;
$counterEvenOdd = 0;
$counterOdd = 0;
$counterEven = 0;

while($counterEvenOdd < $#FerstArray + $#SecondArray + 2){

   if($counterEvenOdd % 2 == 0){
      $evenOddMassive[$counterEvenOdd] = $FerstArray[$counterEven];
      $counterEven++;
   }

   if($counterEvenOdd % 2 == 1){
      $evenOddMassive[$counterEvenOdd] = $SecondArray[$counterOdd];
      $counterOdd++;
   }

   $counterEvenOdd++;
}
 print "The evenOddMassive array :\n @evenOddMassive";
