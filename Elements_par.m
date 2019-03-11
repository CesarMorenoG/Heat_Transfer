function [ T,Kpar,Qpar ] = Elements_par( orden,Ex,Ey,Lx,Ly,Lcx,Lcy,Q_gen,kx,ky )

syms x y

if orden == 1 
T = sym('T',[(Ex+1)*(Ey+1) 1]);
Kpar=zeros(4,4,Ex*Ey);
Qpar=zeros(4,1,Ex*Ey);

parfor n=1:Ex*Ey*16
    
    if mod(n,4) == 0
        j = 4;
    else 
        j = mod(n,4);
    end
    
    if mod(n,16) == 0
        i = 4;
    elseif mod(n,4) == 0
        i = mod(1+(n-4)/4,4);
    elseif mod(1+(n-mod(n,4))/4,4)==0
        i = 4;
    else 
        i = mod(1+(n-mod(n,4))/4,4);
    end    
    
    if mod(n,16*Ex) == 0
        nx = Ex;
    elseif mod(n,16) == 0
        nx = mod(1+(n-16)/16,Ex);
    elseif mod(1+(n-mod(n,16))/16,Ex)==0
        nx = Ex;
    else 
        nx = mod(1+(n-mod(n,16))/16,Ex);
    end  
    
    if mod(n,16*Ex) == 0
        ny = 1+(n-16*Ex)/(16*Ex);
    else
        ny = 1+(n-mod(n,16*Ex))/(16*Ex);
    end
    
    N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

    Kpar(n) = K( N,kx,ky,i,j,nx,ny,Lcx,Lcy );
    
end

parfor n=1:Ex*Ey*4
    
    if mod(n,4) == 0
        j = 4;
    else 
        j = mod(n,4);
    end
    
    if mod(n,16*Ex) == 0
        nx = Ex;
    elseif mod(n,16) == 0
        nx = mod(1+(n-16)/16,Ex);
    elseif mod(1+(n-mod(n,16))/16,Ex)==0
        nx = Ex;
    else 
        nx = mod(1+(n-mod(n,16))/16,Ex);
    end  
    
    if mod(n,16*Ex) == 0
        ny = 1+(n-16*Ex)/(16*Ex);
    else
        ny = 1+(n-mod(n,16*Ex))/(16*Ex);
    end
    
    N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);
    
    Qpar(n) = Q( N,Q_gen,j,nx,ny,Lcx,Lcy );
    
end
end

if orden == 2
T = sym('T',[(2*Ex+1)*(2*Ey+1) 1]);
Kpar=zeros(9,9,Ex*Ey);
Qpar=zeros(9,1,Ex*Ey);

parfor n=1:Ex*Ey*81
    
    if mod(n,9) == 0
        j = 9;
    else 
        j = mod(n,9);
    end
    
    if mod(n,81) == 0
        i = 9;
    elseif mod(n,9) == 0
        i = mod(1+(n-9)/9,9);
    elseif mod(1+(n-mod(n,9))/9,9)==0
        i = 9;
    else 
        i = mod(1+(n-mod(n,9))/9,9);
    end    
    
    if mod(n,81*Ex) == 0
        nx = Ex;
    elseif mod(n,81) == 0
        nx = mod(1+(n-81)/81,Ex);
    elseif mod(1+(n-mod(n,81))/81,Ex)==0
        nx = Ex;
    else 
        nx = mod(1+(n-mod(n,81))/81,Ex);
    end  
    
    if mod(n,81*Ex) == 0
        ny = 1+(n-81*Ex)/(81*Ex);
    else
        ny = 1+(n-mod(n,81*Ex))/(81*Ex);
    end
    
    N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);
    
    Kpar(n) = K( N,kx,ky,i,j,nx,ny,Lcx,Lcy );
    
end

parfor n=1:Ex*Ey*9
    
    if mod(n,9) == 0
        j = 9;
    else 
        j = mod(n,9);
    end  
    
    if mod(n,81*Ex) == 0
        nx = Ex;
    elseif mod(n,81) == 0
        nx = mod(1+(n-81)/81,Ex);
    elseif mod(1+(n-mod(n,81))/81,Ex)==0
        nx = Ex;
    else 
        nx = mod(1+(n-mod(n,81))/81,Ex);
    end  
    
    if mod(n,81*Ex) == 0
        ny = 1+(n-81*Ex)/(81*Ex);
    else
        ny = 1+(n-mod(n,81*Ex))/(81*Ex);
    end
    
    N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);
    
    Qpar(n) = Q( N,Q_gen,j,nx,ny,Lcx,Lcy );
    
end
end
