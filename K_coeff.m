function [ K ] = K_coeff( Coord,N,kx,ky,i,j,nx,ny,Lcx,Lcy )

syms x y 

if Coord==1
    K=int(int(kx*diff(N(i),x)*diff(N(j),x)+ky*diff(N(i),y)*diff(N(j),y),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
elseif Coord==2
    K=2*pi*int(int((kx*diff(N(i),x)*diff(N(j),x)+ky*diff(N(i),y)*diff(N(j),y))*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
end

end

