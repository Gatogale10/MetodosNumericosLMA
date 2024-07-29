%Practica 5
% Jorge Gael Lopez Figueras 
% Louders Fabiola Uribe Richaud

%Correr el codigo por secciones
% Sección 1


clear all
clc

F = @(x,n)cos(n.*acos(x));
x = linspace(-1,1);

for n1 = 1:10
    
    subplot(5,2,n1)
    
    y = F(x,n1);
    
    plot(x,y)
    hold on
    title("Grafica de la funcion ",n1)
end    


fprintf(" a) ¿f(x) es un polinomio? Si lo es , podemos observar que para n=1 es un" + ...
    "\n polinomio de grado 1 y asi sucesivamente las demas graficas parecen tener" + ...
    " \n un comportamiento que dependen del n, y parecen ser una polinomio con " + ...
    " \n grado n. \n")

fprintf("\n b) ¿Que sucede en los extremos de la función? Siempre en 1 no importa el " + ...
    "\n n el valor de f(x) va a ser 1, dado que arccos(1) = 0 por lo tanto" + ...
    "\n cos(n*0) = 1 , y ahora veamos que pasa en f(-1), sabemos que" + ...
    "\n arccos(-1)=pi, por lo tanto cos(n*pi)= 1 si n es par y -1 si n es impar \n")

fprintf("\n c) ¿Cuál es el valor máximo de f(x)? Sabemos que cos siempre esta acotado" + ...
    "\n en el eje y entre -1 y 1 , por lo tanto el valor maximo sera 1. \n")


fprintf("\n d) puede realizar una observación respecto a las raíces de f(x)? La" + ...
    "\n observación seria que las raíces dependen del n, entonces tendremos n" + ...
    "\n raíces. \n")



%%

%Nueva sección 
%Sección 2

clear all
clc

xg = [];
n = 7;
c = linspace(-5,5);
F = @(x) 1./(1.+(x.^2));
for i = 1:n
    xg = [xg,(10/2)*cos( ((2*i-1)*pi)/12 )];

end



Fg = F(xg);

y = F(c);


%Creamos la matriz de 7*7 para hallar la aproximación para el polonimio de
%grado 6

Ma = zeros(n,n);

%Ahora en la primera fila colocamos los valores de f(x)

Ma(1:n,1) = Fg(:);


%Finalmente mandamos a llamar la funcion 

M1 = Newton(Ma,xg);


%Graficamos la función original y la función aproximanda
plot(c,polyval(M1,c));
hold on
plot(c,y)


fprintf("Pregunta : ¿Se presenta el fenomeno de runge? No , ya que los puntos" + ...
    "\n dados no son equidistantes y ademas podemos notar graficamente que es una" + ...
    "\n aproximación mediamente buena.")

%Obtendremos la interpolacion por medio del metodo de diferencias divididas

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













