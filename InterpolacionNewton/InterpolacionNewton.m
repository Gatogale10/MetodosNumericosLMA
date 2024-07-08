%Practica numero 4
% Jorge Gael Lopez Figueras
% Louders Fabiola Uribe Richaud

clear all
clc


%El programa nos va a regresar un vector con los coeficientes de newton del
%Polinomio resultante

%Tomaremos primero 11 puntos del intervalo [-1,1] y luego tomaremos 21
%puntos de ese mismo intervalo , para formar polinomios de grado 10 y 20
%respectivamente

%Creamos los vectores con los puntos equidistantes

a = linspace(-1,1,11);
b = linspace(-1,1,21);
c = linspace(-1,1);

% Creamos las matrices 11x11 y 21x21 respectivamente 
Ma = zeros(11,11);
Mb = zeros(21,21);

%Creamos la función donde seran evaluados esos puntos
F = @(x)exp(abs(x));

%Generamos los puntos evaluados
af = F(a); 
bf = F(b);
cf = F(c);

%Graficamos la funcion original 

plot(c,cf)
grid on;
hold on;

% Ponemos los valores en la matriz 
Ma(1:11,1) = af(:);
Mb(1:21,1) = bf(:);

%Mandamos a llamar a la funcion
M1 = Newton(Ma,a);
M2 = Newton(Mb,b);

fprintf("Imprimimos los polinomios en forma de vector " + ...
    "para de grado 10 y 20 respectivamente \n")
M1
M2

%Graficamos la aproximación 
plot(c,polyval(M1,c));
plot(c,polyval(M2,c));
ylim([-0.2 2.8])
legend({'Funcion original','Polinomio grado 10','Polinomio grado 20'},'Location','southwest')


fprintf("Podemos observar al graficar que el fenomeno de Runge se presenta \n " + ...
    "ya que mientras aumentamos el grado del polinomio este oscila mas ,podemos ver que \n" + ...
    " la función polinomica de grado 20 oscila mucho mas que la de grado 10 \n  ")


%Creamos la funcion que encuentra los f[x0,x1...xn]

function [pol] = Newton(Mi,v)
%Esta matriz regresa el polinimio con el metodo de diferencias divididas

%Primero obtenemos la matriz con todos los valores
for i = 2:length(v)

    for j = i:length(v)
        g =  v(j)-v(j-i+1);
        Mi(j,i) = ( Mi(j,i-1)-Mi(j-1,i-1) ) / g;

    end
end 

q = [1];
pol = [Mi(1,1)];
for f = 2:length(v)-1
    monomio = [1,-v(f-1)];
    q = conv(q,monomio);
    pol = [0,pol] + Mi(f,f)*q;
end

end 
