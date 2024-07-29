% Metodos Numericos 
% Practica 1 
% Jorge Gael Lopez Figueras
% Louders Fabiola Uribe Richaud

clear all
clc

%Integracion para un trapecio 
% 
F1 = @(x) x.^2.*log(x);
F2 = @(x) x.^3 + 2* (x.^2);
F3 = @(x) ( exp(x)-1 ) ./ sin(x);
F4 = @(x) x.*(cos(x.^2));

F = {F1,F2,F3,F4};

IntervA = [1,-1,0.1,0];
IntervB = [4,1,pi/2, pi ];
% a) Aplicando trapecio simple a las integrales 

%for i =1:4
%    IR(i) =integral(F{i},IntervA(i),IntervB(i))
%end


for i = 1:4
   
    ErrorA = abs ( integral( F{i},IntervA(i),IntervB(i)) - TrapecioSimple( F{i} ,1, IntervA(i),IntervB(i)) );
    ErrorRelativo = ErrorA / abs(integral( F{i}  ,IntervA(i),IntervB(i)));
    fprintf(strcat("\n El error absoluto y relativo de la funcion ",num2str(i), " con Trapecio simple con n = 1", " es ", num2str(ErrorA ), " y " ,num2str(ErrorRelativo) ))
    
    

    end 

    fprintf("\n")


for j = 2:2:6

    for i = 1:4
   
    ErrorA = abs ( integral( F{i},IntervA(i),IntervB(i)) - TrapecioSimple( F{i} ,j, IntervA(i),IntervB(i)) );
    ErrorRelativo = ErrorA / abs(integral( F{i}  ,IntervA(i),IntervB(i)));
    fprintf(strcat("\n El error absoluto y relativo de la funcion  ",num2str(i), " con Trapecio compuesto  con n = ",num2str(j), " es ", num2str(ErrorA) , " y " , num2str(ErrorRelativo) ))
    

    end 

    fprintf("\n")


end 

for j = 2:2:6

    for i = 1:4
   
    ErrorA = abs ( integral( F{i},IntervA(i),IntervB(i)) - SimpsonCom( F{i} ,j, IntervA(i),IntervB(i)) );
    ErrorRelativo = ErrorA / abs(integral( F{i}  ,IntervA(i),IntervB(i)));
    fprintf(strcat("\n El error relativo y absoluto de la funcion ",num2str(i), " con Simpson Compuesto  con n = ",num2str(j), " es ", num2str(ErrorA), " y " , num2str(ErrorRelativo) ))
    

    end 

    fprintf("\n")


end 



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



function [Res] = SimpsonCom(fun,n, a,b)
  h = (b-a)/n;
  Result = 0;

  if n == 2

      Res = (h/3)*(fun(b)+4*fun(a+h)+fun(a));


  else 

      Res = fun(b)+fun(a);

      for i = 1:n/2

          Res = Res + (h/3)*4*fun(a+h*(2i-1));
         
      end 

      for j = 1:(n/2-1)

          Res = Res + (h/3)*4* fun(a+h*(2i));
      end     


  end 


end 

