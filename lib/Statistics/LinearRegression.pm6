use v6;
unit class Statistics::LinearRegression;

sub calc-slope(@x, @y) {
  my $n = +@x * [+](@x Z* @y) - [+](@x)*[+](@y);
  my $d = +@x * [+](@x >>**>> 2) - [+](@x)**2;
  $n/$d;
}

sub calc-intercept(@x, @y, $slope) {
  ([+](@y) - $slope * [+](@x)) / @x;
}

sub get-parameters(@x, @y) is export {
  my $slope = calc-slope(@x,@y);
  my $intercept = calc-intercept(@x,@y,$slope);
  return ($slope, $intercept);
}

sub value-at($x, $slope, $intercept) is export {
  $x*$slope + $intercept;
}

class LR is export {
  has $.slope;
  has $.intercept;

  multi method new( @x, @y) {
    my ($slope, $intercept) = get-parameters(@x,@y);
    self.bless(:$slope, :$intercept);
  }

  multi method new($slope, $intercept) {
    self.bless(:$slope, :$intercept);
  }

  method at($x) {
    value-at($x, $.slope, $.intercept);
  }

}
=begin pod

=head1 NAME

Statistics::LinearRegression - simple linear regression

=head1 SYNOPSIS

  use Statistics::LinearRegression;
  my @arguments = 1,2,3;
  my @values = 3,2,1;

Build model and predict value for some x

  my ($slope, $intercept) = get-parameters(@arguments, @values);
  my $x = 15;
  my $y = value-at($x, $slope, $intercept);

Or use dummy OO

  my $x = 15;
  my $y = my LR.new(@arguments, @values).at($x);

=head1 AUTHOR

Paweł Szulc <pawel_szulc@onet.pl>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 Paweł Szulc

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
