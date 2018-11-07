function I = trap(func, a, b, m, varargin)

if ~(b>a), error('o limite superior deve ser maior que o limite inferiror'), end

if nargin<4 | isempty(m), m=100; end

x = a; h = (b - a)/m;
s = func(a, varargin{:});

for i = 1 : m-1
    x = x + h;
    s = s + 2 * func(x, varargin{:});
end

s = s + func(b, varargin{:});
I = (b - a) * s / (2 * m);
