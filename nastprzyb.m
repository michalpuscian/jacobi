function [np] = nastprzyb(A, b , pp)
%funkcja znajduje następne przybliżenie biorąc pod uwagę poprzednie
%przybliżenie
n = size(b,2);
np= ones(n,1);
%wyznaczanie następnego przybliżenia i-tego elementu z kolumny
for i = 1:n
    sumaax = 0;
    %teraz tworzymy indeksy po których ma przechodzić sumaax
    if i == 1 
        w1 = 2:n;
        w2 = [];
    elseif i==n
        w1 = 1:(n-1);
        w2 = [];
    else
        w1 = 1:(i-1);
        w2 = (i+1):n;
    end
    %sumowanie w celu obliczenia np(i)
    for j = cat(2,w1,w2)
        sumaax = sumaax + (A(i,j)*pp(j));
    end
    
    %na końcu możemy obliczyć np
    np(i) = (b(i)- sumaax)/A(i,i);
end

end

