function [Wynik,Delta,Wsp]=ekstrap(v,q,p)
% EKSTRAP - wykonuje ekstrapolacj� Richardsona
%
% ekstrap(v,q,p)  jest funkcj� wykonuj�c� ekstrapolacj� Richardsona 
%                 wynik�w zawartych w wektorze v, przy kroku (parametrze) 
%                 zmniejszaj�cym si� "q" krotnie, dla pot�g w rozwini�ciu
%                 asymptotycznym w wektorze p.
%
% Jako wynik zwracane s� dwie macierze i wektor wsp�czynnik�w:
%     Wynik       jest macierz� zawieraj�c� warto�ci kolejnych obliczonych 
%                 przybli�e� u�o�onych kolumnami - ka�da kolejna kolumna
%                 to nastepny etap ekstrapolacji (cz�� element�w tablicy, 
%                 kt�re nie s� wynikami ekstrapolacji jest wype�niona NaN
%                 - te kt�rych numer kolumny jest wi�kszy od numeru wiersza)
%     Delta       jest macierz� zawieraj�c� warto�ci kolejnych r�nic
%                 warto�ci przybli�onych, podzielonych przez warto�ci
%                 kolejnych wsp�czynnik�w ekstrapolacji Richardsona
%     Wsp         jest wektorem zawieraj�cym warto�ci kolejnych
%                 wsp�czynnik�w ekstrapolacji Richardsona

narginchk(1,3);
n=length(v);
if nargin<3, p=2:2:(2*n-2); end
if nargin<2, q=2; end
if numel(q)>1, error('ekstrap: drugi argument musi by� skalarem'); end
if q<=1, error('ekstrap: drugi argument to wsp�czynnik REDUKCJI parametru - musi by� wi�kszy ni� 1'); end

Wynik=NaN(n,min(n,length(p)+1));
Delta=NaN(n-1,min(n,length(p)+1));

Wynik(:,1)=v(:);
Wsp=q.^p-1;
for j=2:min(n,length(p)+1)
    for k=j:n
		Delta(k-1,j-1)=(Wynik(k,j-1)-Wynik(k-1,j-1))/Wsp(j-1);
		Wynik(k,j)=Wynik(k,j-1)+Delta(k-1,j-1);
    end
end
