
clc
clear all
close all


ng = [2,3,4,5,6];
nr = [1,2,3,4,5];
F1 = @(x) 2*x.*cos(2*x) - (x-2).^2;
F = @(x) log(x);


w2 = [1.0, 1.0];
w3 = [0.5555555, 0.555555555,0.88888888];
w4 = [0.34785484,0.34785484, 0.6521451549, 0.6521451549];
w5 = [0.2369268851 , 0.2369268851 , 0.4786286705 , 0.4786286705 , 0.5688888889];
w6 = [0.1713244924 , 0.1713244924 , 0.3607615730, 0.3607615730 , 0.4679139346, 0.4679139346];

z2 = [0.5773502692, -0.5773502692];
z3 = [0.7745966692, -0.7745966692, 0];
z4 = [0.8611363116,-0.86113631160, 0.3399810436,- 0.3399810436];
z5 = [0.9061798459, -0.9061798459, 0.5384693101,-0.5384693101,0];
z6 = [0.9324695142,-0.9324695142,0.6612093865,-0.6612093865,0.2386191861,-0.2386191861];

z = {z2,z3,z4,z5,z6};
w = {w2,w3,w4,w5,w6};


ValorR = -1.948650363744113;

a = 1;
b = 2;
p1 = (b-a)/2;
p2 = (a+b)/2;

valoresAproximacionCuad = zeros(1,5);
valoresAproximacionTrape = zeros(1,5);
valoresAproximacionRomb = zeros(1,5);
valoresErrorCuad = zeros(1,5);
valoresErrorTrapecio = zeros(1,5);
valoresErrorRomberg = zeros(1,5);

%Aproximacion mediante Cuadratura de Gauss y Trapecio compuesto


%Metodo de cuadratura
for i = 1:5

    Result = 0;

    x1 = z{i};
    w1 = w{i};
    n = ng(i);

    

    for k = 1:length(x1)

        x1(k) = p1*x1(k)+p2;
    end 

    for j =1:length(x1)

        Result = Result + F(x1(j))*w1(j);
    end     

    Result = Result*p1;

    valoresAproximacionCuad(i) = Result;

    %Aproximacion del Trapecio
    valoresAproximacionTrape(i) = TrapecioSimple(F,n,a,b);
    
    
    ErrorR = abs(Result - ValorR) / abs(ValorR);

    %Error del Trapecio
    ErrorRt = abs(valoresAproximacionTrape(i) - ValorR) / abs(ValorR);
    


    valoresErrorCuad(i) = ErrorR;
    valoresErrorTrapecio(i) = ErrorRt;
     
    fprintf(strcat("\n El valor de la aproximacion con cuadratura de Gauss para n= ", num2str(n) ," es: ", num2str(Result) ))
    fprintf(strcat("\n Con un error relativo de ", num2str(ErrorR),"\n "));


end     

%Imprimimos los valores de la aproximacion y el error para Cuadratura y trapecio
%compuesto para n= 2,3,4,5 y 6

fprintf("\n El valor con la aproximacion con cuadratura de Gauss es: \n");
valoresAproximacionCuad

fprintf("\n El valor de los errores es: \n");
valoresErrorCuad

fprintf("\n El valor con la aproximacion con trapecio compuesto: \n");
valoresAproximacionTrape

fprintf("\n El valor de los errores es: \n");
valoresErrorTrapecio


% Ahora hacemos la aproximacimacion con trapecio Romberg para el nivel 1,
% 2, 3 ,4 y 5 

Level = [5];

for i = 1:1

    h = zeros(Level(i),Level(i));

    for  r=1:Level(i)
        %Primero obtengamos los valores inciales
        h(r,1) = TrapecioSimple(F,2^r,a,b);
    end

    for k = 2:Level(i)
       for j = 1:Level(i)+1-k
          h(j,k) = (4^(k-1)*h(j+1,k-1) - h(j,k-1) ) / (4^(k-1)-1);
       end 
    end  
   

end



for k= 1:5

    valoresAproximacionRomb(k)=  h(1,k);
    valoresErrorRomberg(k) = abs(valoresAproximacionRomb(k)- ValorR ) / abs(ValorR);

end     

%Imprimimos la aproximacion de Romberg para el nivel 1, 2, 3 , 4 y 5

fprintf("\n El valor con la aproximacion con Romberg para el nivel 1, 2 ,3 ,4 y 5 es : \n");
valoresAproximacionRomb

fprintf("\n El valor de los errores es: \n");
valoresErrorRomberg



% Graficamos los errores

%Grafica para el error del metodo Cuadratura de Gauss para n = 2, 3 ,4 y 5 
plot(ng,valoresErrorCuad);

grid on;
hold on;

%Grafica para el error del metodo de trapecio compuesto para n = 2, 3 ,4 y 5
plot(ng,valoresErrorTrapecio);


%Grafica para el error del metodo de Romberg para el nivel 1,2,3,4 y 5 
plot(nr,valoresErrorRomberg);
hold off
legend("Error para cuadratura de Gauss","Error para Trapecio compuesto ", "Error para Romberg" )









%Funcion para trapecio Compuesto

function [Result] = TrapecioSimple(fun,n,a,b)
  h = (b-a)/n;
  Result = 0;

  if n == 1

      Result = (h/2)*(fun(b)+fun(a));
  else 

      Result = (h/2)*(fun(a)+fun(b));


      for i = 1:n-1

          Result = Result + h*fun(a+i*h) ;
      end     
  end     

end 



