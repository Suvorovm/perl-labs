#!/usr/bin/perl  
    use warnings;
    use Cwd;
    my $dir =getcwd();
    opendir (DIR, $dir ) or die $!;
     while (my $file = readdir(DIR)) {

        my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
        $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($file);

           print "fileName =$file  Size = $size";
           print "\n";

    }
    closedir DIR;
    