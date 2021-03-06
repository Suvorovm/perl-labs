#!/usr/bin/perl -w
use warnings;
use strict;
use POE;
use POE::Component::Server::TCP;
use Sys::Hostname;
use Net::Address::IP::Local;
use File::Slurp;
use autodie qw(:all);
use Cwd;
use Try::Tiny;
use File::Basename;


# Create the server on port 7999, and start it running.
my $port = 7998;

#Needs dir change for user


#-f-s%_%/home/suvorov/Uni/4_1/Perl/perl-labs/NetworkTechnology/ApplicationLayerProtocol/Client/Content/fileClient.txt%_%fileTest




POE::Component::Server::TCP->new(
    Alias              => "suvorov_server",
    Port               => $port,
    InlineStates       => { send => \&handle_send },
    ClientConnected    => \&client_connected,
    ClientError        => \&client_error,
    ClientDisconnected => \&client_disconnected,
    ClientInput        => \&client_input
);
$poe_kernel->run();
exit 0;

# This is a plain Perl function (not a POE event handler) that
# broadcasts a message to all the users.  The %users
# hash is used to track connected people.
my %users;


sub compute_comand {
  my ($comand, $user) = @_;

  my $resultString = "";
  if ($comand eq "-a"){
    my($addr)=  Net::Address::IP::Local->public;

    $resultString= "Ip:".  $addr . " port: $port";
    return $resultString;
  }
  if ($comand eq "-t"){
    my $date = localtime();
    return $date;
  }
  if($comand eq "-c"){
    return "-c-s"
  }
  if (index($comand, "-f-s") != -1) {
      my $cwd = getcwd();
      my @partsCommand = split('%_%', $comand);
      open my $file, '>', $cwd . "/Content/" . $partsCommand[2];
      print {$file} $partsCommand[3];
      close $file;
      return "-f-s-s";
  }
  if (index($comand, "-f-g") != -1){
    my $cwd = getcwd();
    my @partsCommand = split('%_%', $comand);
    my $file_content = "";
    my $path = $cwd . "/" . $partsCommand[1];
    try {
      $file_content =  do{local(@ARGV,$/)=$path;<>};
    } catch {
        print STDERR $_;
        return "-f-g-f%_%$_"
        };
    my $nameOfFile = basename($path);
    return "-f-g-s%_%" . $nameOfFile . "%_%" . $file_content;

  }

  return "";
}

sub broadcast {
  my ($sender, $message) = @_;
  print STDERR  "\nclient is $sender message is :" . "$message\n";
  foreach my $user (keys %users) {
    if ($user == $sender) {
      my $result = compute_comand($message, $user);
      $poe_kernel->post($user => send => "$result");
    }
    else {
      $poe_kernel->post($user => send => "$sender $message");
    }
  }
}

# Handle an outgoing message by sending it to the client.
sub handle_send {
  my ($heap, $message) = @_[HEAP, ARG0];
  $heap->{client}->put($message);
}

# Handle a connection.  Register the new user, and broadcast a message
# to whoever is already connected.
sub client_connected {
  my $session_id = $_[SESSION]->ID;
  $users{$session_id} = 1;
  broadcast($session_id, "-c");
}

# The client disconnected.
# broadcast a message to whoever is left.
sub client_disconnected {
  my $session_id = $_[SESSION]->ID;
  delete $users{$session_id};
  broadcast($session_id, "disconnected.");
}

# The client socket has had an error.  Remove them from the users
# and broadcast a message to whoever is left.
sub client_error {
  my $session_id = $_[SESSION]->ID;
  delete $users{$session_id};
  broadcast($session_id, "disconnected.");
  $_[KERNEL]->yield("shutdown");
}

# Broadcast client input to everyone in seance
sub client_input {
  my ($kernel, $session, $input) = @_[KERNEL, SESSION, ARG0];
  my $session_id = $session->ID;
  broadcast($session_id, $input);
}











# Вот это должно использоваться для чтения файлов.
# ClientFlushed => sub {
#   my $data_source = $_[HEAP]{file_handle};
#   my $read_count = sysread($data_source, my $buffer = "", 65536);
#   if ($read_count) {
#     $_[HEAP]{client}->put($buffer);
#   }
#   else {
#     $_[KERNEL]->yield("shutdown");
#   }
# },