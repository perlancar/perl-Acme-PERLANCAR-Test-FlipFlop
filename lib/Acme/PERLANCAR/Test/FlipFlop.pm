package Acme::PERLANCAR::Test::FlipFlop;

# DATE
# DIST
# VERSION

use 5.010001;
use strict 'vars', 'subs';
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(one_in_odd die_in_odd);

sub _version_is_odd {
    my $v = version->parse(${__PACKAGE__."::VERSION"} // 0)->normal;
    $v =~ /\Av\d+\.(\d+)/ or die "Invalid normalized version '$v'";
    $1 % 2 ? 1:0;
}

sub one_in_odd {
    _version_is_odd() ? 1:2;
}

sub die_in_odd {
    die "Die-ing because we are in odd releases" if _version_is_odd();
}

1;
# ABSTRACT: Incompatibilities between releases

=head1 DESCRIPTION

This distribution is created for testing. It has several functions which behave
differently between releases (I'll call versions X.Y where Y is an odd number as
odd releases and where Y is an even number as even releases.)


=head1 FUNCTIONS

=head2 one_in_odd() => int

Return odd number 1 in odd releases, and even number 2 in even releases.

=head2 die_in_odd()

Will die in odd releases, and do nothing in even releases.
