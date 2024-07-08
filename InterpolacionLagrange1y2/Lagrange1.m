
% La funcion a interpolar
f = @(x) 1.0678*exp(-1.0375*x)-0.13176*exp((-(x-1).^2)/(0.5)^2)+exp(-(x-2).^2/(1));


Y = input("Deseas ingresar puntos introduce 1: ");
a = [];
b = [];
if Y ==1
    n = input("Cuantos puntos deseas ingresar: ");
    for m = 1:n
        a(m) = input("Introduce la coordenada x ");
        b(m) = input("Introduce la coordenada y ");

    end


%PUNTO 1:  DONDE RECIBIMOS LOS F(Xi) y los Xi.


else
    %Los puntos del ejercicio de tarea
    a = [0.2300, 1.3000,2.4800, 4.0000, 6.3100 ,7.0000];
    b = [0.8724,0.7979,0.8757,0.0351,0.0015,0.0007];
end     

% PUNTO 2: RESPONDIENDO A LA PREGUNTA : CONSIDERA QUE EL POLINOMIO OBTENIDO APROXIMA 
% ADECUADAMENTE LA FUNCION DADA.

% La funcion a interpolar

f = @(x) 1.0678*exp(-1.0375*x)-0.13176*exp((-(x-1).^2)/(0.5)^2)+exp(-(x-2).^2/(1));
x = linspace(0,8.5);
y = f(x);
plot(x,y)
grid on;
hold on;
auxG = stat2(a,b);
plot(x,polyval(auxG,x))
scatter(8.5,f(8.5));

fprintf("\n Nosotros podemos notar que si graficamos que la funcion en un intervalo de -12 a 12  \n ");
fprintf("\n Parece que tiene el comportamiento de una funcion exponencial inversa o sea de la forma\n" + ...
    "     \n f(x) = 1/e^x, lo cual es dificil aproximar ya que esta función no tiene ninguna expresion polinomial\n" + ...
    "pero en nuestra funcion original podemos ver existen dos exponentes elevandos a expresiones polinomiales\n" + ...
    " ademas de esto en el intervalo dado el cual es (0,7) la funcion parece tener un comportamiento \n" + ...
    "de un polinomio de grado 3 , por lo que en ese intervalo especifico en cual tomamos los puntos para determinar una aproximación polinomica de grado 5.\n" + ...
    "mediante el metodo de interpolación de lagrange podemos decir que aproxima mediamente bien a la funcion.")
%PUNTO 2 
% C)
%Estime pn(8.5), ¿Es una buena aproximación en t ́erminos del error?.

fprintf("Calcularemos el error absoluto  y relativo, por lo visto en la clase es mejor calcular ambos")
v = f(8.5);
fprintf("Obtenemos que el error absoluto es ")
EA = (abs(v-polyval(auxG,8.5)))/ v;
EA
ER = EA / v;
fprintf("Obtenemos que el error relativo es")
ER
fprintf("Podemos ver que ambos valores son altos por lo tanto no es una buena aproximación")
scatter(8.5,polyval(auxG,8.5))


%PUNTO 2 
% D)
%Trate de mejorar esa aproximación (trabajar  ́unicamente con los datos dados).

fprintf("Podemos mejorar la aproximacion mediante una polinomío de grado 1 ,ya que\n" + ...
    "apartir del punto 6.3100 al punto 7 podemos ver un comportamiento lineal , por\n" + ...
    "lo tanto sera una mejor una aproximación al punto 8.5, y podemos ver esto al graficar")
a = [ 6.3100 ,7.0000];
b = [0.0015,0.0007];
auxG = stat2(a,b);

x1 = linspace(6,8.5);
plot(x1,polyval(auxG,x1))
scatter(8.5,polyval(auxG,8.5));

fprintf("Veamos ahora el error absoluto y relativo respecto a esta nueva aproximación")
E1 = (abs(v-polyval(auxG,8.5))) ;
E1
ER1 = E1 / v 

fprintf("Al graficar y al ver que el error absoluto es bajo, podemos decir que la aproximación es buena")
fprintf("El error relativo es alto ya que el valor de f(8.5)= 1.5796e-04 por lo tanto al dividir el  \n" + ...
    "error absoluto entre f(8.5) obtenemos el error relativo el cual es un valor mas alto que el error absoluto \n")


%¿Que sucede si realiza la interpolaci ́on con los nodos xi no ordenados?


fprintf("\n Si realizamos la interpolación con los nodos no ordenados obtendremos el mismo polinomio\n" + ...
    "ya que mediante el metodo de interpolacion de lagrange pasaremos por todos los nodos y por el teorema fundamental\n" + ...
    "del algebra solo existe un polinimio de grado n que pase por n+1 nodos. ")


a = [7.0000, 6.3100,4.0000,2.4800, 1.3000 ,0.2300];
b = [0.0007,0.0015,0.0351,0.8757,0.7979,0.8724];
auxG = stat2(a,b);



function [auxG] = stat2(a,b)
    auxG = 0;

    for s = 1:length(a)
        %Vamos a generar a los L 
        % Si s = 1 entonces L0 = L1  
        aux = 1;
        aux3 = 1;

        for f = 1:length(a)
            
            if f ~= s
                %Esta es la parte de arriba de los li
                
                
                aux = conv(aux, poly(a(f))) ;
                bar = a(s)-a(f);
                aux3 = aux3*bar;
             
            end 


        end
        

        %aux2(s,:) = aux/aux3;
        auxG = auxG + b(s)*(aux/aux3);
     
    end

    %PUNTO 2: LOS COEFICIENTES DEL POLINOMIO INTERPOLANTE
    % a)
    auxG
end
