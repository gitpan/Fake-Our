use 5.00503;
use strict;
# use warnings;
use Test::Simple tests => 4;
# use Strict::Perl 2014.04; $::VERSION = 0.01;
use Fake::Our;
# use Strict::Perl 2014.04; $::VERSION = 0.01;

# avoid: Use of reserved word "our" is deprecated
BEGIN {
    $SIG{__WARN__} = sub {
        if ($_[0] =~ /^Use of reserved word "our" is deprecated at/) {
            # ignore message
        }
        else {
            warn @_;
        }
    }
}

our $var1;
ok((not defined $var1), q{our $var1});

our $var2 = 1;
ok(($var2 == 1), q{our $var2=1});

our($var3);
ok((not defined $var3), q{our($var3)});

our($var4,$var5);
ok(((not defined $var4) and (not defined $var5)), q{our($var4,$var5)});

__END__
