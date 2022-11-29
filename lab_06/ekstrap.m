function [Wynik,Delta,Wsp]=ekstrap(v,q,p)
% EKSTRAP - wykonuje ekstrapolacjê Richardsona
%
% ekstrap(v,q,p)  jest funkcj¹ wykonuj¹c¹ ekstrapolacjê Richardsona 
%                 wyników zawartych w wektorze v, przy kroku (parametrze) 
%                 zmniejszaj¹cym siê "q" krotnie, dla potêg w rozwiniêciu
%                 asymptotycznym w wektorze p.
%
% Jako wynik zwracane s¹ dwie macierze i wektor wspó³czynników:
%     Wynik       jest macierz¹ zawieraj¹c¹ wartoœci kolejnych obliczonych 
%                 przybli¿eñ u³o¿onych kolumnami - ka¿da kolejna kolumna
%                 to nastepny etap ekstrapolacji (czêœæ elementów tablicy, 
%                 które nie s¹ wynikami ekstrapolacji jest wype³niona NaN
%                 - te których numer kolumny jest wiêkszy od numeru wiersza)
%     Delta       jest macierz¹ zawieraj¹c¹ wartoœci kolejnych ró¿nic
%                 wartoœci przybli¿onych, podzielonych przez wartoœci
%                 kolejnych wspó³czynników ekstrapolacji Richardsona
%     Wsp         jest wektorem zawieraj¹cym wartoœci kolejnych
%                 wspó³czynników ekstrapolacji Richardsona

narginchk(1,3);
n=length(v);
if nargin<3, p=2:2:(2*n-2); end
if nargin<2, q=2; end
if numel(q)>1, error('ekstrap: drugi argument musi byæ skalarem'); end
if q<=1, error('ekstrap: drugi argument to wspó³czynnik REDUKCJI parametru - musi byæ wiêkszy ni¿ 1'); end

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
