function h = mediantest
    load datos.txt;

    x = datos;

    z = @(p) -sqrt(2) * erfcinv(p*2);

    r = (sum(x)) * (1/length(x));

    llr = 0.5 - (z(0.975)*(1/sqrt(12 * length(x))));

    lsr = 0.5 + (z(0.975)*(1/sqrt(12 * length(x))));

    h = ~((llr <= r) & (lsr >= r));
end