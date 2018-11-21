function [x,y] = euler(f, a, b, m, y0)
% entrada :
%   f = f(x,y)
%   a = limite inferior da variável independente
%   b = limite superior da variável independente
%   m = numero de subintervalos
%   y0 = valor inicial da variável dependente


if ~(b>a), error('o limite superior deve ser maior que o limite inferior'), end

if ~(m>0), error('o numero de segmentos dever ser positivo'), end

h = (b - a)/m; 
x = (a:h:b)';
n = length(x);

%inclui um valor adicional em x de mo que o intervalo termine em b, inclusive.
if x(n) < b
    x(n+1) = b;
    n = n+1;
end

%pré-aloca y para melhorar a eficiência
y = y0 * ones(n,1);

%implementa o método de Euler
for i = 1:n-1
    y(i+1) = y(i) + f( x(i) , y(i) ) * (x(i+1) - x(i));
end