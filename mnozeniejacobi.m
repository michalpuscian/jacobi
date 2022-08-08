function [WMX] = mnozeniejacobi(A,B,ktorastrona,p,MPP)
if ktorastrona == 1
    %Wtedy mamy równanie XA=B. Dzięki matematyce wiemy że jeśli rozwiążemy
    %równanie transpose(A)*X = transpose(B) to transpose(X) jest rozwiązaniem równania 
    %XA= B
    A = transpose(A);
    B = transpose(B);
end
    

%pobieramy wymiary macierzy
n = size(A,1);
m = size(B,2);
%sprawdzamy czy metoda jacobiego jest zbieżna dla A
BJ = zeros(size(A,1),size(A,2));
for i = 1:size(A,1)
    for j = 1:size(A,2)
        
        BJ(i,j)=(A(i,j)/A(i,i));
    end
    BJ(i,i)= 0;
end
promien = max(abs(eig(BJ)));
if promien>=1
    error('Dla takiej macierzy A metoda nie jest zbiezna')
end
%tworzymy macierz wyniku
WMX = zeros(n,m);
ile_k=0;
% wyznaczanie u-tej kolumny WMX
for u = 1:m
    pp = MPP(:,u);
    np = pp;
    b = B(:,u);
    
    for k=1:p
            pp = np;
            %obliczamy następne przybliżenie(np) u-tej kolumny X na
            %podstawie poprzedniego przybliżenia(pp)
            np = nastprzyb(A,transpose(b),transpose(pp));
            %if norm(np-pp)<1.e-10
                %jeśli osiągniemy wystarczającą dokładność to kończymy
                %przybliżanie
                %break
            %end
    end
    ile_k = ile_k+k;
    %gdy skończymy przybliżanie jednej kolumny to zapisujemy i przechodzimy do kolejnej
    %(jeśli następna istnieje)
    WMX(:,u) = np(:);
end

if ktorastrona == 1
    WMX = transpose(WMX);
end
ile_k = ile_k/m;

end

