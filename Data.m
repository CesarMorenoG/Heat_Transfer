function [ orden,Ex,Ey,Lx,Ly,Lcx,Lcy,A_e,A_geo,Q_gen,kx,ky ] = Data()

%Solicita el orden de las funciones de interpolacion
orden=input('Ingrese el orden de las funciones de interpolacion (1,2): ');

%Solicita la longitud de la geometria
Longitud_x=input('Longitud en x de la geometria en metros: ');
Longitud_y=input('Longitud en y de la geometria en metros: ');

%Solicita el numero de elementos
Ex=input('Ingrese el numero de elementos en x: ');
Ey=input('Ingrese el numero de elementos en y: ');

control=input('Los elementos son de tamaño uniforme?(Si:1,No:0) ');

if orden == 1
    A_e=[1 2;3 4];

    A_geo=zeros(Ey+1,Ex+1);
    for ny=1:Ey+1 
    for nx=1:Ex+1
        A_geo(ny,nx)=(ny-1)*(Ex+1)+nx;
    end
    end
end

if orden == 2
    A_e=[1 2 3;4 5 6;7 8 9];

    A_geo=zeros(2*Ey+1,2*Ex+1);
    for ny=1:2*Ey+1 
    for nx=1:2*Ex+1
        A_geo(ny,nx)=(ny-1)*(2*Ex+1)+nx;
    end
    end
end

Lx=zeros(1,Ex+1);
Ly=zeros(1,Ey+1);
Lx(1)=0;
Ly(1)=0;

if control==1;
    for nx=2:Ex+1
        Lx(nx)=Longitud_x/Ex; 
    end
    for ny=2:Ey+1
        Ly(ny)=Longitud_y/Ey; 
    end
end

if control==0;
    for nx=2:Ex
        fprintf('Ingrese la longitud del elemento %d en x: ',nx-1);
        Lx(nx)=input('');  
    end
    for ny=2:Ey
        fprintf('Ingrese la longitud del elemento %d en y: ',ny-1);
        Ly(ny)=input('');  
    end
    Lx(Ex+1)=Longitud_x-sum(Lx);
    Ly(Ey+1)=Longitud_y-sum(Ly);
end

Lcx=cumsum(Lx);
Lcy=cumsum(Ly);

%Solicita el calor generado
Q_gen=input('Calor generado: ');

%Solicita las conductividades
kx=input('Ingrese la conductividad termica del material a lo largo del eje x '); 
ky=input('Ingrese la conductividad termica del material a lo largo del eje y '); 

end

