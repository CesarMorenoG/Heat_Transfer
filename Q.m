function [ Qpar ] = Q( N,Q_gen,j,nx,ny,Lcx,Lcy )

syms x y 

Qpar=int(int(Q_gen*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));

end

