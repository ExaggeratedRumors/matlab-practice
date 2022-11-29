function [Wynik,Delta,Wsp]=ekstrap(v,q,p)
% EKSTRAP - wykonuje ekstrapolacj� Richardsona
%
% ekstrap(v,q,p)    jest funkcj� wykonuj�c� ekstrapolacj� Richardsona wynik�w
%                   zawartych w wektorze v, przy kroku zmniejszaj�cym si� "q"
%                   krotnie, dla pot�g w rozwini�ciu asymptotycznym w wektorze p.
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
