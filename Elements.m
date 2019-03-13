function [ T,K,Q ] = Elements( Coord,Order,Ex,Ey,Lx,Ly,Lcx,Lcy,Q_gen,kx,ky )

syms x y

if Order == 1 
T = sym('T',[(Ex+1)*(Ey+1) 1]);
K=zeros(4,4,Ex*Ey);
Q=zeros(4,1,Ex*Ey);
for ny=1:Ey 
for nx=1:Ex 

    N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);
    
    for j=1:1:4
        for i=1:1:4
            K(i,j,(ny-1)*Ex+nx)=K_coeff(Coord,N,kx,ky,i,j,nx,ny,Lcx,Lcy);
        end
    end
    
    for i=1:1:4
        Q(i,1,(ny-1)*Ex+nx)=Q_coeff(Coord,N,Q_gen,j,nx,ny,Lcx,Lcy);
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

if Order == 2
T = sym('T',[(2*Ex+1)*(2*Ey+1) 1]);
K=zeros(9,9,Ex*Ey);
Q=zeros(9,1,Ex*Ey);
for ny=1:Ey 
for nx=1:Ex 
    
    N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

    for j=1:1:9
        for i=1:1:9
            K(i,j,(ny-1)*Ex+nx)=K_coeff(Coord,N,kx,ky,i,j,nx,ny,Lcx,Lcy);
        end
    end
    
    for i=1:1:9
        Q(i,1,(ny-1)*Ex+nx)=Q_coeff(Coord,N,Q_gen,j,nx,ny,Lcx,Lcy);
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

