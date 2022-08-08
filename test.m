%ktorastrona == 0 - mnożenie AX = B
%ktorastrona == 1 - mnożenie XA = B
%------------------------------------------------------
%przykładowe macierze dla ktorastrona ==0 czyli AX=B
disp('-------Przyklad_1.1--------')
tic
ktorastrona = 0;
A = [3 -2 0; 4 3 0; -1 1 -1]
B = [1 2 1 4;6 5 2 3; 5 8 7 6]
jacobi = mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(A,B)
czas = toc

jakiblad = norm(jacobi-wynikmatlabowy)
disp('-------Przyklad_1.2--------')
tic
A = [4 1 0;1 4 3;0 -1 4];
B = [6 8 2 4;3 4 5 3; 1 8 3 6];
jacobi =mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(A,B)
czas = toc
jakiblad = norm(jacobi-wynikmatlabowy)
%------------------------------------------------------
%przykładowe macierze dla ktorastrona ==1 czyli XA=B
disp('-------Przyklad_2.1--------')
tic
ktorastrona = 1;
A = [3 -2 0; 4 3 0; -1 1 -1]
B = [1 2 3;4 5 6; 7 8 9]
jacobi =mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(transpose(A),transpose(B));
wynikmatlabowy = transpose(wynikmatlabowy)
czas = toc
jakiblad = norm(jacobi-wynikmatlabowy)
disp('-------Przyklad_2.2--------')
tic
A = [4 1 0;1 4 3;0 -1 4]
B = [4 2 0;5 8 4; 3 3 3]
jacobi =mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(transpose(A),transpose(B));
wynikmatlabowy = transpose(wynikmatlabowy)
czas = toc
jakiblad = norm(jacobi-wynikmatlabowy)
%------------------------------------------------------
%przykładowe macierze dla ktorastrona == 0 oraz 1
disp('-------Przyklad_3.1--------')
tic
ktorastrona = 0;
A = [3 -2 0; 4 3 0; -1 1 -1];
B = [1 0 0;0 1 0; 0 0 1];
jacobi =mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(A,B)
czas = toc
jakiblad = norm(jacobi-wynikmatlabowy)
disp('-------Przyklad_3.2--------')
tic
ktorastrona = 1;
A = [3 -2 0; 4 3 0; -1 1 -1];
B = [1 0 0;0 1 0; 0 0 1];
jacobi =mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(A,B)
czas = toc
jakiblad = norm(jacobi-wynikmatlabowy)
%------------------------------------------------------
%sprawdzenie bledu gdy metoda nie jest zbiezna:
disp('-------Przyklad_BLAD--------')
tic
ktorastrona = 0;
A = [1 0 0 -3;1 -1 0 0;0 0 1 1;0 0 -2 2];
B= [3;-1;-2;1];
mnozeniejacobi(A,B,ktorastrona)
czas= toc
%------------------------------------------------------


tic
ktorastrona = 0;
A = [1 2 3; 4 5 6; 7 8 9]
B = [1 2 1 4;6 5 2 3; 5 8 7 6]
jacobi = mnozeniejacobi(A,B,ktorastrona)
czas= toc
tic
wynikmatlabowy=linsolve(A,B)
czas = toc

