%Practica 11
%Jorge Gael Lopez Figueras


f = @(x) sin(x);

%%%Punto inicial y tamaño de paso fijo %%%
x = [0;1];

alp = 0.25;

%Creamos la matriz 

h = zeros(10,5);
h(:,5) = 1;

r = (0.01)/(0.25^2);


%Obtengamos los valores iniciales de la matriz


for k = 1:4
    h(1,k) = f(alp*(k-1));
    
end



for j = 2:10
    
    for i = 2:4

        h(j,i) = r*h(j-1,i+1) + (1-2*r)*h(j-1,i)+r*h(j-1,i-1);


    end    
end     


h