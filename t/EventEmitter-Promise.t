# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl EventEmitter-Promise.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More;
BEGIN { plan tests => 3 };
use EventEmitter::Promise;
ok(1); # If we made it this far, we're ok.

{
my $promise = EventEmitter::Promise->new;

my $ok;

$promise->then(sub { $ok = $_[0] });
$promise->resolve('ok');

is($ok, 'ok', 'resolve->then');
}

{
my $promise = EventEmitter::Promise->new;

my $ok;

$promise->then(sub {}, sub { $ok = $_[0] });
$promise->reject('ok');

is($ok, 'ok', 'reject->then');
}

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

