#!/usr/bin/perl -w
use strict;
use warnings FATAL => 'all';
use POE;
use POE::Component::Client::TCP;
use POE::Filter::Reference;
use Cwd;

my $host = "localhost"; # The host to test.
my $port = 7999;

#-f-s%_%/home/suvorov/Uni/4_1/Perl/perl-labs/NetworkTechnology/ApplicationLayerProtocol/Client/Content/fileClient2.txt%_%fileTest

sub compute_client_command {
    my ($command) = @_;
    if (index($command, "-f-s") != -1) {
        my @partsCommand = split('%_%', $command);
        my $path = $partsCommand[1];
        my $file_content = do {
            local (@ARGV, $/) = $path;
            <>
        }; #read all file
        return "-f-s%_%" . $path . "%_%" . $partsCommand[2] . "%_%" . $file_content . "%_%";
    }

    if (index($command, "-f-g") != -1) {
        return $command;
    }
    if ($command eq "-a") {
        return $command;
    }
    if ($command eq "-t") {
        return $command;
    }
}



sub compute_server_command {
    my ($inputServerCommand) = @_;
    if(index($inputServerCommand, "-f-s-s") != -1){
        print "\nFile success saved in server \n"
    }

    if(index($inputServerCommand, "f-s-f") != -1){
         print "\nSaved file to server finish with error\n"
    }

    if(index($inputServerCommand, "-f-g-s") != -1){
      my $cwd = getcwd();
      my @partsCommand = split('%_%', $inputServerCommand);
      open my $file, '>', $cwd . "/" . $partsCommand[1];
      print {$file} $partsCommand[2];
      close $file;
    }

    if ($inputServerCommand eq "-c-s") {
        print "\n Now you can work with server \n"
    }
    else {
        print $inputServerCommand . " ";
    }
}


POE::Component::Client::TCP->new(
    RemoteAddress => $host,
    RemotePort    => $port,
    # Filter        => "POE::Filter::Reference",
    Connected     => sub {

        print " The Seanse connected to $host:$port ...";
        #$_[HEAP]->{server}->put(\@values);
    },
    ConnectError  => sub {
        print "could not connect to $host:$port ...";
    },
    ServerInput   => sub {

        my ($kernel, $heap, $input) = @_[KERNEL, HEAP, ARG0];

        compute_server_command($input);
        print "Input the command\n";
        my $comand = <STDIN>;
        chomp $comand;
        my $clientCommand = compute_client_command($comand);
        $_[HEAP]->{server}->put($clientCommand);
    },


);
# Broadcast client input to everyone in the chat room.
#/home/suvorov/Uni/4_1/Perl/perl-labs/NetworkTechnology/ApplicationLayerProtocol/Client/Content/fileClient.txt
$poe_kernel->run();

exit 0;