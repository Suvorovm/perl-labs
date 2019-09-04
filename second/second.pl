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

