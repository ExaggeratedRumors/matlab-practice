function [Wynik,Delta,Wsp]=ekstrap(v,q,p)
% EKSTRAP - wykonuje ekstrapolacjê Richardsona
%
% ekstrap(v,q,p)    jest funkcj¹ wykonuj¹c¹ ekstrapolacjê Richardsona wyników
%                   zawartych w wektorze v, przy kroku zmniejszaj¹cym siê "q"
%                   krotnie, dla potêg w rozwiniêciu asymptotycznym w wektorze p.
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

n=length(v);

Wynik=zeros(n,min(n,length(p)))+nan;
Delta=zeros(n-1,min(n,length(p)));
W(1)=0;

Wynik(:,1)=v(:);
%for m=2:n, W(m)=(W(m-1)+1)*q*q-1;Wsp(m-1)=W(m);end
Wsp=q.^p-1;
for j=2:min(n,length(p))
	for k=j:n
		Delta(k-1,j-1)=(Wynik(k,j-1)-Wynik(k-1,j-1))/Wsp(j-1);
		Wynik(k,j)=Wynik(k,j-1)+Delta(k-1,j-1);
    end
end
