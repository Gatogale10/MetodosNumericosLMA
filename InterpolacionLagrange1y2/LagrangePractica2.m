%F = @(x) 1./(1 + x.^2);
F = @(x) log(x+1);
%x = linspace(-5,5);
x = [0,0.6,0.9];
y = F(x);

plot(x,y)
grid on;
hold on;





dx = linspace(-5,5);


for N = 2:2:8
    x1 = [];

    for i = 0:N

        x1(i+1) = -5 + 10*(i/N);
        %Tambien puede ser asi, este el append en matlab 
        % x1 = [x1,-5 + 10*(i/N)]

    end 

    y1 = F(x1);


    auxG = 0;

    for s = 1:length(x1)
        %Vamos a generar a los L 
        % Si s = 1 entonces L0 = L1  
        aux = 1;
        aux3 = 1;

        for f = 1:length(x1)
            
            if f ~= s
                %Esta es la parte de arriba de los li
                poly(x1(f));
                aux = conv(aux, poly(x1(f))) ;
                bar = x1(s)-x1(f);
                aux3 = aux3*bar;
             
            end 


        end
        

        %aux2(s,:) = aux/aux3;
        auxG = auxG + y1(s)*(aux/aux3);
      
    end

    auxG
    
    plot(dx,polyval(auxG,dx))


end 

fprintf("Podemos observar que con cada iteracion incrementamos el grado del polinomio \n" + ...
    "y nos aproximamos a la funcion original cada vez mas pero aun asi la aproximación no es exacta con el polinomio de grado 8  \n")
    