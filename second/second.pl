#! /bin/usr/perl
@FerstArray ;
@SecondArray;
print "Enter first arry\n";
while ($line = <STDIN> and $line!="") {
push(@FerstArray,$line);
}

print "Enter second arry\n";
while ($line = <STDIN> and $line!="") {
push(@SecondArray,$line);
}
if (@FerstArray!=@SecondArray){

print "You enter different count of ellements\n";
     exit;
}
@summoFTwoArray = (@FerstArray, @SecondArray);

print" the Union of sets\n @summoFTwoArray";

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
 
 
 
 
