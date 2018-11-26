function [VetX,VetY] = rk4(f, a, b, m, y0)
% entrada :
%   f = f(x,y)
%   a = limite inferior da variável independente
%   b = limite superior da variável independente
%   m = numero de subintervalos
%   y0 = valor inicial da variável dependente


if ~(b>a), error('o limite superior deve ser maior que o limite inferior'), end

if ~(m>0), error('o numero de segmentos dever ser positivo'), end

h = (b - a)/m; 
VetX(1) = xt = a; 
VetY(1) = yt = y0;

for i = 1:m
    x = xt; y = yt;
    k1 = f( x, y );
    x = xt + h/2; y = yt + h/2 * k1;
    k2 = f( x, y );
    y = yt + h/2 * k2;
    k3 = f( x, y );
    x = xt + h * k3; y = yt + h * k3;
    k4 = f( x, y );
    xt = a + i*h;
    yt = yt + h/6 * (k1 + 2 * (k2 + k3) + k4);
    VetX(i+1) = xt;
    VetY(i+1) = yt;
end