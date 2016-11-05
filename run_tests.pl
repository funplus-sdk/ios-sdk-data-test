#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw( strftime );
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use File::Tee qw( tee );

die('Please set the $simulator_id first!') if (! defined $ENV{'simulator_id'});

my $simulator_id = $ENV{'simulator_id'};
print("SIMULATOR ID: $simulator_id\n");

# Change working directory.
my $cwd = dirname(abs_path($0));
chdir $cwd;

system( "mkdir -p log/archive" ) if ( ! -d "log/archive" );

# Log file.
my $dt = strftime("%Y%m%d", localtime);
my $logfile = "log/$dt-success.log";
tee STDOUT, '>>', $logfile;

system("xcodebuild test -project ../../FunPlusSDK/FunPlusSDK.xcodeproj/ -scheme DataTestApp -destination 'platform=iOS Simulator,id=$simulator_id'");
exit $? >> 8;
