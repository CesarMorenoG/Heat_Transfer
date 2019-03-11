function [ Kpar ] = K( N,kx,ky,i,j,nx,ny,Lcx,Lcy )

syms x y 

Kpar=int(int(kx*diff(N(i),x)*diff(N(j),x)+ky*diff(N(i),y)*diff(N(j),y),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));

end

