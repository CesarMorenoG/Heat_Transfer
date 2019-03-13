function [ Q ] = Q_coeff( Coord,N,Q_gen,j,nx,ny,Lcx,Lcy )

syms x y 

if Coord==1
    Q=int(int(Q_gen*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
elseif Coord==2
    Q=2*pi*int(int(Q_gen*N(j)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
end

end

