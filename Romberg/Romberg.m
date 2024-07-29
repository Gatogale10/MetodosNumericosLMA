%Practica 2 Romberg
%Jorge Gael Lopez Figueras
% Nivel 
clear all
clc

%Funciones a calcular el Romberg 
% 
F1 = @(x) x.^2.*log(x);
F2 = @(x) x.^3 + 2* (x.^2);
F3 = @(x) ( exp(x)-1 ) ./ sin(x);
F4 = @(x) x.*(cos(x.^2));

F = {F1,F2,F3,F4};

IntervA = [1,-1,0.1,0];
IntervB = [4,1,pi/2, pi ];

Level = [3,4,5,3];





for i = 1:4

    h = zeros(Level(i),Level(i));

    for  r=1:Level(i)
        %Primero obtengamos los valores inciales
        h(r,1) = TrapecioSimple(F{i},2^r,IntervA(i),IntervB(i));
    end

    for k = 2:Level(i)
       for j = 1:Level(i)+1-k
          h(j,k) = (4^(k-1)*h(j+1,k-1) - h(j,k-1) ) / (4^(k-1)-1);
       end 
    end  
    
    ErrorA = abs ( integral( F{i},IntervA(i),IntervB(i)) - h(1,Level(i)) );
    ErrorRelativo = ErrorA / abs(integral( F{i}  ,IntervA(i),IntervB(i)));
    fprintf(strcat("\n El valor aproximado de la integral ",num2str(i), " con romberg en el nivel " ,num2str(Level(i)), " Es ", num2str(h(1,Level(i)))));
    fprintf(strcat("\n El error absoluto y relativo de la funcion ",num2str(i), " con Romberg en el nivel ",num2str(Level(i)) , " es ", num2str(ErrorA ), " y " ,num2str(ErrorRelativo),"\n" ));
    
    

    end 

    fprintf("\n")



function [Result] = TrapecioSimple(fun,n,a,b)
    h = (b-a)/n;
    
    Result = 0;
    if n == 1
        Result = (h/2)*(fun(b)+fun(a));
    else
         Result = (h/2)*(fun(b)+fun(a));
        for i = 1:n-1
            Result = Result + h*fun(a+i*h);
         end      
    end 
end