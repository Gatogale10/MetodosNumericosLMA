%Practica 6
% Jorge Gael Lopez Figueras 
% Louders Fabiola Uribe Richaud

clear all
clc

xg = [];
xg1 = [];
n = 8;
c = linspace(-5,5);
F = @(x) 1./(1.+(x.^2));
y = F(c);
plot(c,y);
hold on

for i = 2:2:n
    xg = [];
    Fg = [];
    Ma = [];
    M1 = [];


    for j = 1:i
        xg = [xg,5*cos( ((2*j-1)*pi)/(2*i) )];
    end

    xg2 = unique(xg);
    

    xg1 = [xg1,xg];
    Fg = F(xg);

    Ma = zeros(i,i);
    Ma(1:i,1) = Fg(:);
    M1 = Newton(Ma,xg2);
    plot(c,polyval(M1,c));
    hold on
end








%% Seccion 2

clear all
clc

c1 = linspace(-1,1,100);
%F2 = @(x) exp(1).^abs(x);
F2 = @(x) exp(abs(x));


y = F2(c1);

y1 = unique(y);



plot(c1,y);
hold on
m = 20;


for i = 10:10:m
    xg = [];
    Fg = [];
    Ma = [];
    M1 = [];
    

    for j = 1:i
        
        xg = [xg,(10/2)*cos( ((2*j-1)*pi)/(2*i) )];
    end
    
    xg1 = unique(xg);
    
    

    
    Fg = F2(xg1);
    
    L = length(Fg);
    
    


    Ma = zeros(L,L);
    Ma(1:L,1) = Fg(:);
    M1 = Newton(Ma,xg1);
    
    plot(c1,polyval(M1,c1));
    
end


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








