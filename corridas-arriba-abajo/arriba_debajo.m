function h = arriba_debajo
    z = @(p) -sqrt(2) * erfcinv(p*2);
    zcalc = corridas;
    h = ~((zcalc <= z(0.975)));
end


function z = corridas
    % Prueba de la mediana para numeros aleatorios
    load datos.txt;u=datos;
    m = median(u);
    % Se calcula el numero de valores por encima y por debajo de la media
    % se eliminan los elementos iguales a ella
    n1 = 0;% Corridas encima de la media
    n0 = 0;% Corridas debajo de la media
    k = 1;

    for i = 1:length(u)
        if u(i) ~= m, v(k) = u(i); k = k + 1; end
        if u(i) > m, n1 = n1 + 1; end
        if u(i) < m, n0 = n0 + 1; end
    end
    % Se rehace el vector sin los elementos iguales a la media
    for i = 1:length(v), v(i) = v(i) - m;end
    % Se calcula el numero de corridas en la variable C
    C = 1;
    for i = 1:length(v) - 1
        if sign(v(i)) ~= sign(v(i + 1));C = C + 1;end
    end
    % Se calcula la media y la desviacion estandar de las corridas
    n = n1 + n0;
    media = ((2 * n1 * n0) / n) + 0.5;
    desv1 = (2 * n1 * n0) * ((2 * n1 * n0) - n);
    desv2 = (n ^ 2) * (n - 1);
    desv = desv1 / desv2;
    % Calculo del estadistico
    z = (C - media) / desv;
end