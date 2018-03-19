function h = gaptest
    load datos.txt;
    x = datos;
    
    vector = unique(x);
    
    N = length(x) - length(vector);
    g = [];
    for i = 1:length(vector)
        v{i} = mygap(vector(i), x);
        g = horzcat(g, v{i});
    end
    f = F(sort(g));   % frecuencia observada
    xs = Xs(sort(g));
    fr = f / N;       % frecuencia relativa
    sn = SN(abs(fr));
    fx = Fx(abs(xs));
    Dmax = max(abs(fx - sn));
    D = 1.36 / sqrt(N);
    h = ~(Dmax <= D);
end

% longitud de brecha
function gap = mygap(n, x)
    count = 0;
    band = false;
    j = 1;
    gaps = [];
    for i = 1:length(x)
        if (x(i) == n && band == true)
       	    gaps(j) = count;
       	    count = 0;
            j = j + 1;
   	    elseif (x(i) == n && band == false)
       	    band = true;
        end
   	    if (x(i) ~= n && band == true)
       	    count = count + 1;
        end
    end
    gap = gaps;
end

% frecuencia relativa
function f = F(rs)    
    i = 1;
    j = 1;
    k = 1;

    res = unique(rs);
    
    while i <= length(res)
        if i + 1 <= length(res)
            j = i + 1;
        else
            j = i;
        end
        fs(k) = sum(histc(rs(find(rs == res(i), 1, 'first'):find(rs == res(j), 1, 'last')), res));
        k = k + 1;
        i = i + 2;
    end
    f = fs;
end

% limite de brechas
function xs = Xs(rs)    
    i = 1;
    j = 1;
    k = 1;

    res = unique(rs);
    
    while i <= length(res)
        if i + 1 <= length(res)
            j = i + 1;
        else
            j = i;
            break;
        end
        temp(k) = res(j);
        k = k + 1;
        i = i + 2;
    end
    temp(k - 1) = temp(k - 1) + 1;
    xs = temp;
end

% sn
function sn = SN(fr)
    xi = 0;
    for i=1: length(fr)
        temp(i) = xi + fr(i);
        xi = temp(i);
    end
    sn = temp;
end

% fx
function fx = Fx(s)
    for i=1: length(s)
       temp(i) = 1 - ((0.9) ^ (s(i) + 1));
    end
    fx = temp;
end