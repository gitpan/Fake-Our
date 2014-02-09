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

our %var1;
ok((scalar(keys %var1) == 0), q{our %var1});

our %var2 = ('A'=>1,'B'=>2,'C'=>3);
ok((scalar(keys %var2) == 3), q{our %var2 = ('A'=>1,'B'=>2,'C'=>3)});

our(%var3);
ok((scalar(keys %var3) == 0), q{our(%var3)});

our(%var4,%var5);
ok(((scalar(keys %var4) == 0) and (scalar(keys %var5) == 0)), q{our(%var4,%var5)});

__END__
