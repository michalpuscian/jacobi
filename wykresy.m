ktorastrona = 0;
A = [3 -2 0; 4 3 0; -1 1 -1];
B = [1 2 1 4;6 5 2 3; 5 8 7 6];
x = 3:500;
y= 3:500;
wynikmatlabowy=linsolve(A,B);
for i= 3:500
    jacobi = mnozeniejacobi(A,B,ktorastrona,i,zeros(size(B)));
    y(i-2) =norm(jacobi-wynikmatlabowy);
end
semilogy(x,y)
xlabel('ilość przybliżeń')
ylabel('błąd')

a1 = linspace(-100, 0.8824, 1000);
a2 = linspace(-100, 0.8235, 1000);
a3 = linspace(-100, -5.0588, 1000);
b1 = linspace(-100,0.9412,1000);
b2 = linspace(-100,0.4118,1000);
b3 = linspace(-100,-8.5294,1000);
c1 = linspace(-100,0.4118,1000);
c2 = linspace(-100,0.1176,1000);
c3 = linspace(-100,-7.2941,1000);
d1 = linspace(-100,1.0588,1000);
d2 = linspace(-100,-0.4118,1000);
d3 = linspace(-100,-7.4706,1000);

r = zeros(1, 1000);
for i = 1:1000
    e = mnozeniejacobi(A, B, 0,1000 ,[a1(i) b1(i) c1(i) d1(i);a2(i) b2(i) c2(i) d2(i);a3(i) b3(i) c3(i) d3(i)] );
    r(i) = norm(e);
end
    
plot(linspace(0, 1000, 1000), r, 'r--')
xlabel('macierz początkowa')
ylabel('błąd')
grid on
