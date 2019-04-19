#!/usr/bin/perl -Tw

use strict;
use Test::More;
use IPC::Run3;

%ENV = ( PATH => '/bin:/usr/bin', LANG => 'C');

my @cmd;
my ($in, $out, $err);

subtest 'which apt' => sub {
    @cmd = qw( which apt );
    $in = '';

    ok(run3(\@cmd, \$in, \$out, \$err), 'works');
    is($?, 0, 'exits with code 0');
    is($out, "/usr/bin/apt\n", "tells apt's path");
    is($err, '', 'has no error messages');
};

subtest 'which dmesg' => sub {
    @cmd = qw( which dmesg );
    $in = ''; 

    ok((run3 \@cmd, \$in, \$out, \$err), 'works');
    is($?, 0, 'exits with code 0');
    is($out, "/bin/dmesg\n", "tells dmesg's path");
    is($err, '', 'has no error messages');
};

done_testing;
