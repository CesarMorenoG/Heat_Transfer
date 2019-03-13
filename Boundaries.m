function [ T,K,Q ] = Boundaries( Coord,Order,Ex,Ey,Lx,Ly,Lcx,Lcy,A_geo,Front_x1,Front_x2,Front_y1,Front_y2,T_x1,Q_x1,beta_x1,Tinf_x1,T_x2,Q_x2,beta_x2,Tinf_x2,T_y1,Q_y1,beta_y1,Tinf_y1,T_y2,Q_y2,beta_y2,Tinf_y2,T,K,Q )

syms x y

if Coord==1
    if Order == 1;
    if Front_x1==1 
        for n=1:Ey+1
            T(A_geo(n,1)) = T_x1(Lcy(n));
        end
    elseif Front_x1==2
        for ny=1:Ey
            nx=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_x1*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end
    elseif Front_x1==3
        for ny=1:Ey
            nx=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_x1*N(i)*N(j),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_x1*Tinf_x1*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end   
    end

    if Front_x2==1 
        for n=1:Ey+1
            T(A_geo(n,end)) = T_x2(Lcy(n));
        end
    elseif Front_x2==2
        for ny=1:Ey
            nx=Ex;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_x2*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end
    elseif Front_x2==3
        for ny=1:Ey
            nx=Ex;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_x2*N(i)*N(j),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_x2*Tinf_x2*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end    
    end

    if Front_y1==1 
        for n=1:Ex+1
            T(A_geo(1,n)) = T_y1(Lcx(n));
        end
    elseif Front_y1==2
        for nx=1:Ex
            ny=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_y1*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end
    elseif Front_y1==3
        for nx=1:Ex
            ny=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_y1*N(i)*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_y1*Tinf_y1*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end    
    end

    if Front_y2==1 
        for n=1:Ex+1
            T(A_geo(end,n)) = T_y2(Lcx(n));
        end
    elseif Front_y2==2
        for nx=1:Ex
            ny=Ey;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_y2*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end
    elseif Front_y2==3
        for nx=1:Ex
            ny=Ey;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_y2*N(i)*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_y2*Tinf_y2*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end    
    end
    end

    if Order == 2;
    if Front_x1==1 
        for n=1:Ey
            T(A_geo(2*n-1,1)) = T_x1(Lcy(n));
            T(A_geo(2*n,1)) = T_x1((Lcy(n)+Lcy(n+1))/2);
            T(A_geo(2*n+1,1)) = T_x1(Lcy(n+1));
        end
    elseif Front_x1==2
        for ny=1:Ey
            nx=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_x1*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end
    elseif Front_x1==3
        for ny=1:Ey
            nx=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_x1*N(i)*N(j),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_x1*Tinf_x1*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end   
    end

    if Front_x2==1 
        for n=1:Ey
            T(A_geo(2*n-1,end)) = T_x2(Lcy(n));
            T(A_geo(2*n,end)) = T_x2((Lcy(n)+Lcy(n+1))/2);
            T(A_geo(2*n+1,end)) = T_x2(Lcy(n+1));
        end
    elseif Front_x2==2
        for ny=1:Ey
            nx=Ex;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_x2*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end
    elseif Front_x2==3
        for ny=1:Ey
            nx=Ex;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_x2*N(i)*N(j),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_x2*Tinf_x2*N(i),y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end    
    end

    if Front_y1==1 
        for n=1:Ex
            T(A_geo(1,2*n-1)) = T_y1(Lcx(n));
            T(A_geo(1,2*n)) = T_y1((Lcx(n)+Lcx(n+1))/2);
            T(A_geo(1,2*n+1)) = T_y1(Lcx(n+1));
        end
    elseif Front_y1==2
        for nx=1:Ex
            ny=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_y1*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end
    elseif Front_y1==3
        for nx=1:Ex
            ny=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_y1*N(i)*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_y1*Tinf_y1*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end    
    end

    if Front_y2==1 
        for n=1:Ex
            T(A_geo(end,2*n-1)) = T_y2(Lcx(n));
            T(A_geo(end,2*n)) = T_y2((Lcx(n)+Lcx(n+1))/2);
            T(A_geo(end,2*n+1)) = T_y2(Lcx(n+1));
        end
    elseif Front_y2==2
        for nx=1:Ex
            ny=Ey;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(Q_y2*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end
    elseif Front_y2==3
        for nx=1:Ex
            ny=Ey;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(int(beta_y2*N(i)*N(j),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(int(beta_y2*Tinf_y2*N(i),x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end    
    end
    end
end

if Coord==2
    if Order == 1;
    if Front_x1==1 
        for n=1:Ey+1
            T(A_geo(n,1)) = T_x1(Lcy(n));
        end
    elseif Front_x1==2
        for ny=1:Ey
            nx=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_x1*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end
    elseif Front_x1==3
        for ny=1:Ey
            nx=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x1*N(i)*N(j)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x1*Tinf_x1*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end   
    end

    if Front_x2==1 
        for n=1:Ey+1
            T(A_geo(n,end)) = T_x2(Lcy(n));
        end
    elseif Front_x2==2
        for ny=1:Ey
            nx=Ex;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_x2*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end
    elseif Front_x2==3
        for ny=1:Ey
            nx=Ex;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x2*N(i)*N(j)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x2*Tinf_x2*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end    
    end

    if Front_y1==1 
        for n=1:Ex+1
            T(A_geo(1,n)) = T_y1(Lcx(n));
        end
    elseif Front_y1==2
        for nx=1:Ex
            ny=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_y1*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end
    elseif Front_y1==3
        for nx=1:Ex
            ny=1;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y1*N(i)*N(j)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y1*Tinf_y1*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end    
    end

    if Front_y2==1 
        for n=1:Ex+1
            T(A_geo(end,n)) = T_y2(Lcx(n));
        end
    elseif Front_y2==2
        for nx=1:Ex
            ny=Ey;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_y2*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end
    elseif Front_y2==3
        for nx=1:Ex
            ny=Ey;

            N = Lin_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:4
            for i=1:1:4
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y2*N(i)*N(j)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
            end

            for i=1:4
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y2*Tinf_y2*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end    
    end
    end

    if Order == 2;
    if Front_x1==1 
        for n=1:Ey
            T(A_geo(2*n-1,1)) = T_x1(Lcy(n));
            T(A_geo(2*n,1)) = T_x1((Lcy(n)+Lcy(n+1))/2);
            T(A_geo(2*n+1,1)) = T_x1(Lcy(n+1));
        end
    elseif Front_x1==2
        for ny=1:Ey
            nx=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_x1*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end
    elseif Front_x1==3
        for ny=1:Ey
            nx=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x1*N(i)*N(j)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x1*Tinf_x1*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx));
            end
        end   
    end

    if Front_x2==1 
        for n=1:Ey
            T(A_geo(2*n-1,end)) = T_x2(Lcy(n));
            T(A_geo(2*n,end)) = T_x2((Lcy(n)+Lcy(n+1))/2);
            T(A_geo(2*n+1,end)) = T_x2(Lcy(n+1));
        end
    elseif Front_x2==2
        for ny=1:Ey
            nx=Ex;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_x2*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end
    elseif Front_x2==3
        for ny=1:Ey
            nx=Ex;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x2*N(i)*N(j)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_x2*Tinf_x2*N(i)*x,y,Lcy(ny),Lcy(ny+1)),x,Lcx(nx+1));
            end
        end    
    end

    if Front_y1==1 
        for n=1:Ex
            T(A_geo(1,2*n-1)) = T_y1(Lcx(n));
            T(A_geo(1,2*n)) = T_y1((Lcx(n)+Lcx(n+1))/2);
            T(A_geo(1,2*n+1)) = T_y1(Lcx(n+1));
        end
    elseif Front_y1==2
        for nx=1:Ex
            ny=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_y1*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end
    elseif Front_y1==3
        for nx=1:Ex
            ny=1;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y1*N(i)*N(j)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y1*Tinf_y1*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny));
            end
        end    
    end

    if Front_y2==1 
        for n=1:Ex
            T(A_geo(end,2*n-1)) = T_y2(Lcx(n));
            T(A_geo(end,2*n)) = T_y2((Lcx(n)+Lcx(n+1))/2);
            T(A_geo(end,2*n+1)) = T_y2(Lcx(n+1));
        end
    elseif Front_y2==2
        for nx=1:Ex
            ny=Ey;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(Q_y2*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end
    elseif Front_y2==3
        for nx=1:Ex
            ny=Ey;

            N = Cuad_int_fun(Lx,Ly,Lcx,Lcy,nx,ny);

            for j=1:1:9
            for i=1:1:9
                K(i,j,(ny-1)*Ex+nx) = K(i,j,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y2*N(i)*N(j)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
            end

            for i=1:9
                Q(i,1,(ny-1)*Ex+nx) = Q(i,1,(ny-1)*Ex+nx) + subs(2*pi*int(beta_y2*Tinf_y2*N(i)*x,x,Lcx(nx),Lcx(nx+1)),y,Lcy(ny+1));
            end
        end    
    end
    end
end
end

