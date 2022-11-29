function funder = derivative(fun)
%DERIVATIVE Oblicza pochodną funkcji anonimowej
%   Oblicza pochodną funkcji anonimowej jednej zmiennej przez jej
%   zastosowanie do zmiennej symbolicznej, a potem symboliczne
%   różniczkowenie i przetworzenie wyniku na matlabFunction, czyli nową
%   funkcję anonimową.
%   UWAGA! nie zadziała fla M-funkcji i funkcji używających
%   nieróżniczkowalnych operatotów/funkcji wbudowanych

if class(fun)~='function_handle'
    error([mfilename,': ta funkcja działa tylko dla niektórych funkcji anonimowych']);
end
zs=sym('x');
fun2S(zs)=fun(zs);
dfun2S=diff(fun2S,zs);
funder=matlabFunction(dfun2S);
end

