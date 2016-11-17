NAME
====

Statistics::LinearRegression - simple linear regression

SYNOPSIS
========

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

AUTHOR
======

Paweł Szulc <pawel_szulc@onet.pl>

COPYRIGHT AND LICENSE
=====================

Copyright 2016 Paweł Szulc

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
