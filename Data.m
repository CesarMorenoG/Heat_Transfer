function [ orden,Ex,Ey,Lx,Ly,Lcx,Lcy,A_e,A_geo,Q_gen,kx,ky ] = Data()

%Solicita el orden de las funciones de interpolacion
orden=input('Select the order of the interpolation functions (1,2): ');

%Solicita la longitud de la geometria
Longitud_x=input('Length of the geometry in the x direction: ');
Longitud_y=input('Length of the geometry in the y direction: ');

%Solicita el numero de elementos
Ex=input('Number of elements in the x direction: ');
Ey=input('Number of elements in the y direction: ');

control=input('Are the elements of uniform size?(Si:1,No:0) ');

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
        fprintf('Lengh of the element %d in x: ',nx-1);
        Lx(nx)=input('');  
    end
    for ny=2:Ey
        fprintf('Lengh of the element %d in y: ',ny-1);
        Ly(ny)=input('');  
    end
    Lx(Ex+1)=Longitud_x-sum(Lx);
    Ly(Ey+1)=Longitud_y-sum(Ly);
end

Lcx=cumsum(Lx);
Lcy=cumsum(Ly);

%Solicita el calor generado
Q_gen=input('Generated heat: ');

%Solicita las conductividades
kx=input('Thermal conductivity along the x axis '); 
ky=input('Thermal conductivity along the y axis '); 

end
