function [yint, b] = newtint(x, y, xx)
n = length(x);
b = zeros(n,n);

% atribui as variáveis dependentes à primeira coluna de b.
b(:,1) = y(:); % o (:) garante que o y é um vetor coluna.

for j = 2:n
    for i = 1:n-j+1
        b(i,j) = ( b(i+1,j-1) - b(i,j-1) ) / ( x(i+j-1) - x(i) );
    end
end

% usa a tabela de diferenças divididas para interpolar
xt = 1;
yint = b(1, 1);

for j = 1:n-1
    xt = xt * (xx - x(j));
    yint = yint + b(1, j+1) * xt;
end