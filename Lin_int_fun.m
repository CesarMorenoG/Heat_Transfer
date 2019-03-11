function [ N ] = Lin_int_fun( Lx,Ly,Lcx,Lcy,nx,ny )
    
    %Linear interpolation functions
    syms x y

    N1=(((x-Lcx(nx))-Lx(nx+1))*((y-Lcy(ny))-Ly(ny+1)))/(Lx(nx+1)*Ly(ny+1));
    N2=(x-Lcx(nx))/Lx(nx+1)*(1-(y-Lcy(ny))/Ly(ny+1));
    N3=(y-Lcy(ny))/Ly(ny+1)*(1-(x-Lcx(nx))/Lx(nx+1));
    N4=((x-Lcx(nx))*(y-Lcy(ny)))/(Lx(nx+1)*Ly(ny+1));
    N=[N1,N2,N3,N4];

end

