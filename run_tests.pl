#!/usr/bin/env perl
use strict;
use warnings;
use POSIX qw( strftime );
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use File::Tee qw( tee );

# Change working directory.
my $cwd = dirname(abs_path($0));
chdir $cwd;

system( "mkdir -p log/archive" ) if ( ! -d "log/archive" );

# Log file.
my $dt = strftime("%Y%m%d", localtime);
my $logfile = "log/$dt-success.log";
tee STDOUT, '>>', $logfile;

system("xcodebuild test -project DataTestApp.xcodeproj/ -scheme DataTestApp -destination 'platform=iOS Simulator,name=iPhone 7 Plus,OS=10.1'");
exit $? >> 8;
