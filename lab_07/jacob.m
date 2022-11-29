function Jac = jacob(funxy)
%DERIVATIVE Oblicza pochodną funkcji anonimowej
%   Oblicza pochodną funkcji anonimowej jednej zmiennej przez jej
%   zastosowanie do zmiennej symbolicznej, a potem symboliczne
%   różniczkowenie i przetworzenie wyniku na matlabFunction, czyli nową
%   funkcję anonimową.
%   UWAGA! nie zadziała fla M-funkcji i funkcji używających
%   nieróżniczkowalnych operatotów/funkcji wbudowanych

if class(funxy)~='function_handle'
    error([mfilename,': ta funkcja działa tylko dla niektórych funkcji anonimowych']);
end
xs=sym('x');ys=sym('y');
fuS(xs,ys)=funxy(xs,ys);
JS=jacobian(fuS,[xs,ys]);
Jac=matlabFunction(JS,'Vars',{xs,ys});
end

