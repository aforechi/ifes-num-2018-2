function x = GaussSeidel(A, b, es, maxit) 
% GaussSeidel: Método de Gauss-Seidel
%   x = GaussSeideI(A,b) : Gauss—Seidel sem relaxamento 
% entrada :
%   A = matriz dos coeficientes
%   b = vetor do lado direito   
%   es = critério de parada (padrão	= 0.00001%) 
%   maxit = número máximo de iterações (padrão = 50 )
% output :
%   x = vetor solução 

if nargin<2,error('são necessários pelo menos 2 argumentos de entrada'),end
if nargin<4|isempty(maxit),maxit=50;end 
if nargin<3|isempty(es),es=0.00001;end

[m,n]=size(A) ; 
if m~=n, error('A matriz A deve ser quadrada') ; end

C = A;

for i = 1:n
    C(i,i) = 0 ; 
    x(i) = 0; 
end

x = x';

for i = 1:n
     C(i, 1:n) = C(i, 1:n)/A(i, i);  
end 

for i = 1:n
    d(i) = b(i)/A(i,i) ;
end

iter = 0; 

while ( 1 )
    x_velho = x;
    for i = 1:n
        x(i) = d(i) -  C(i,:) * x;
        if x(i) ~= 0
            ea(i) = abs((x(i) - x_velho(i))/x(i)) * 100;
        end
    end
    iter = iter + 1;
    if max(ea) <= es | iter >= maxit, break, end
end