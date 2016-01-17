#!perl

# this test script actually passes/skips when RELEASE_TESTING, and otherwise
# fails

use 5.010;
use strict;
use warnings;

use Test::More 0.98;

if ($ENV{RELEASE_TESTING}) {
    ok 1;
} else {
    require Acme::UnknownTestModule;
    ok 1;
}

done_testing;
