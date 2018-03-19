function h = prueba_corridas
    z = @(p) -sqrt(2) * erfcinv(p*2); %z de la tabla
    zcalc = corridas;
    h = ~((zcalc <= z(0.975)));
end


function z = corridas
    % Prueba de corridas para numeros aleatorios
    load datos.txt;
    u=datos;

    for i = 1:length(u) - 1
        if u(i) < u(i + 1)
            v(i) = 1;
        else
            v(i) = -1;
        end
    end
    % Se calcula el numero de corridas en la variable a
    a = 1;
    for i = 1:length(v) - 1
        if sign(v(i)) ~= sign(v(i + 1));a = a + 1;end
    end
    % Se calcula la media y la desviacion estandar 
    n = length(u);
    media = ((2 * n) - 1) / 3;
    var = ((16 * n) - 29) / 90;
    
    % Calculo del estadistico
    z = (a - media) / var;
end