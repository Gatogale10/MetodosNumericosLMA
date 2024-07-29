%Pratica 7 

% Jorge Gael Lopez Figueras 
%Louders Fabiola Uribe Richaud

%PUNTO NUMERO 1 
%Extraemos los puntos 
y = 1:47;
x = [0.022,0.019,0.008,0.01, 0.004 , 0.002 , 0.004,0.008, 0.017, 0.03 , 0.048, 0.067, 0.069,0.064, 0.066, 0.068, 0.068, 0.061, 0.037, 0.027, 0.029, 0.024, 0.015, 0.012,0.008, 0.006, 0.004, 0.005, 0.017, 0.012, 0.002, 0.006, 0.019, 0.031,0.044 , 0.059, 0.062, 0.064, 0.07 , 0.074, 0.05, 0.039, 0.036, 0.033, 0.025, 0.013, 0.025];
length(x)

%PUNTO NUMERO 2 
% Graficamos los puntos
plot(y,x);
c = linspace(1,47,1000);

%PUNTO NUMERO 3 
%Realizamos interpolacion polinomial 
Pol = InterpolacionAjuste(x,y);


plot(y, polyval(Pol,y))

%Comparamos con la medicion real 

E = abs(polyval(Pol,10)-x(10));

fprintf("Vemos que el error absoluto es de ")
E




%%
y = 1:47;
x = [0.022,0.019,0.008,0.01, 0.004 , 0.002 , 0.004,0.008, 0.017, 0.03 , 0.048, 0.067, 0.069,0.064, 0.066, 0.068, 0.068, 0.061, 0.037, 0.027, 0.029, 0.024, 0.015, 0.012,0.008, 0.006, 0.004, 0.005, 0.017, 0.012, 0.002, 0.006, 0.019, 0.031,0.044 , 0.059, 0.062, 0.064, 0.07 , 0.074, 0.05, 0.039, 0.036, 0.033, 0.025, 0.013, 0.025];
% Ahora con polyfit hacemos el metodo de minimos cuadrados

a = polyfit(y,x,5);

plot(y, polyval(a,y));
%%
x = 1:47;
length(y)
y = [0.022,0.019,0.008,0.01, 0.004 , 0.002 , 0.004,0.008, 0.017, 0.03 , 0.048, 0.067, 0.069,0.064, 0.066, 0.068, 0.068, 0.061, 0.037, 0.027, 0.029, 0.024, 0.015, 0.012,0.008, 0.006, 0.004, 0.005, 0.017, 0.012, 0.002, 0.006, 0.019, 0.031,0.044 , 0.059, 0.062, 0.064, 0.07 , 0.074, 0.05, 0.039, 0.036, 0.033, 0.025, 0.013, 0.025];
% Ahora vamos hacer con el campo de trigonometrico
n=9;
AjusT = InterpolacionAjusteT(x,n,y);

c1 = linspace(1,47,1000);

plot(x, polyval(AjusT,y));





function [Sol] = InterpolacionAjusteT(x1,b,y1)
%Esta matriz regresa el polinimio con el metodo de diferencias divididas
  A = zeros(length(x1),2*b+1);
  for j = 1:b*2+1
      for i = 1:length(x1)
          if j <= b
               A(i,j) = cos((j-1)*x1(i));
          else 
              A(i,j) = sin((j-b-1)*x1(i));
          end      
      end 

  end 
  
  
  Sol = A\y1';
  Sol
  
end 





function [Sol] = InterpolacionAjuste(x1,b)
%Esta matriz regresa el polinimio con el metodo de diferencias divididas
  A = zeros(length(x1));
  for i = 1:length(x1)
      for j = 1:length(x1)
          A(i,j) = (x1(i))^(j-1);
      end 

  end 

  Sol = A\b';
  
  
end 



