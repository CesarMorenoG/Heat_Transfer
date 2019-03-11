function [ T,K,Q ] = Matrices( orden,Ex,Ey,Lx,Ly,Lcx,Lcy,Q_gen,kx,ky )

syms x y

if orden == 1 
T = sym('T',[(Ex+1)*(Ey+1) 1]);
K=zeros(4,4,Ex*Ey);
%M=zeros(4,4,elemento_x*elemento_y);
Q=zeros(4,1,Ex*Ey);
for ny=1:Ey 
for nx=1:Ex 

    N = Fun_forma_1(Lx,Ly,Lcx,Lcy,nx,ny);
    
    for j=1:1:4
        for i=1:1:4
            K(i,j,(ny-1)*Ex+nx)=int(int(kx*diff(N(i),x)*diff(N(j),x)+ky*diff(N(i),y)*diff(N(j),y),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
        end
    end
    
    for i=1:1:4
        Q(i,1,(ny-1)*Ex+nx)=int(int(Q_gen*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
    end
        
    if (ny-1)*Ex+nx<Ex*Ey
        fprintf('%d,',(ny-1)*Ex+nx);
    else
        fprintf('%d',(ny-1)*Ex+nx);
    end
end
end
fprintf('\n');
end

if orden == 2
T = sym('T',[(2*Ex+1)*(2*Ey+1) 1]);
K=zeros(9,9,Ex*Ey);
%M=zeros(9,9,elemento_x*elemento_y);
Q=zeros(9,1,Ex*Ey);
for ny=1:Ey 
for nx=1:Ex 
    
    N = Fun_forma_2(Lx,Ly,Lcx,Lcy,nx,ny);

    for j=1:1:9
        for i=1:1:9
            K(i,j,(ny-1)*Ex+nx)=int(int(kx*diff(N(i),x)*diff(N(j),x)+ky*diff(N(i),y)*diff(N(j),y),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
        end
    end
    
    for i=1:1:9
        Q(i,1,(ny-1)*Ex+nx)=int(int(Q_gen*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny),Lcy(ny+1));
    end
        
    if (ny-1)*Ex+nx<Ex*Ey
        fprintf('%d,',(ny-1)*Ex+nx);
    else
        fprintf('%d',(ny-1)*Ex+nx);
    end
end
end
fprintf('\n');
end

end

