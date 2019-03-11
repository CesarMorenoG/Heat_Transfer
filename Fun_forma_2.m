function [ N ] = Fun_forma_2( Lx,Ly,Lcx,Lcy,nx,ny )
    
    syms x y

    N1=((((x-Lcx(nx))-(Lx(nx+1)))*(2*(x-Lcx(nx))-(Lx(nx+1)))*((y-Lcy(ny))-(Ly(ny+1)))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N2=((-4*(x-Lcx(nx))*((x-Lcx(nx))-(Lx(nx+1)))*((y-Lcy(ny))-(Ly(ny+1)))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N3=(((x-Lcx(nx))*(2*(x-Lcx(nx))-(Lx(nx+1)))*((y-Lcy(ny))-(Ly(ny+1)))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N4=((-4*((x-Lcx(nx))-(Lx(nx+1)))*(2*(x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*((y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N5=((16*(x-Lcx(nx))*((x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*((y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N6=((-4*(x-Lcx(nx))*(2*(x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*((y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N7=((((x-Lcx(nx))-(Lx(nx+1)))*(2*(x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N8=((-4*(x-Lcx(nx))*((x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N9=(((x-Lcx(nx))*(2*(x-Lcx(nx))-(Lx(nx+1)))*(y-Lcy(ny))*(2*(y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2)*(Ly(ny+1))^(2)));
    N=[N1,N2,N3,N4,N5,N6,N7,N8,N9];
    
end

