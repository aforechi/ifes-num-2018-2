function [raiz,ea,iter]=newtraph(func,dfunc,xr,es,maxit,varargin)
% newtraph: localização de raizes pelo metodo de Newton-Raphson
%   [raiz,ea,iter]=newtraph(func,dfunc,xr,es,maxit,p1,p2,...):
%       usa o metodo de Newton-Raphson para encontrar a raiz de func
% entrada:
%   func = nome da função
%   dfunc = nome da derivada da função
%   xr = aproximação inicial
%   es = erro relativo desejado (padrão = 0.0001%) 
%   maxit = numero maximo de iterações permitidas (padrão = 50) 
%   p1,p2,... = parametros adicionais usados por func
% saída:
%   raiz = raiz real
%   ea = erro relativo aproximado (%) 
%   iter = numero de iterações

if nargin<3,error('são necessários pelo menos 3 parametros'),end 
if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit=50;end 

iter = 0;
while (1)
    xr_antigo = xr;
    xr = xr - func(xr)/dfunc(xr);
    iter = iter + 1;
    if xr ~= 0,ea = abs((xr - xr_antigo)/xr) * 100;end 
    if ea <= es | iter >= maxit,break,end 
end
raiz = xr;