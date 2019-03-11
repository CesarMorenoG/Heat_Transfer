function [ ] = Graph( orden,Ex,Ey,Lx,Ly,Lcx,Lcy,Heat )

if orden == 1
for ny=1:Ey
for nx=1:Ex
    X=linspace(Lcx(nx),Lcx(nx+1));
    Y=linspace(Lcy(ny),Lcy(ny+1));
    [X,Y] = meshgrid(X,Y);
    
    N1=(((X-Lcx(nx))-Lx(nx+1)).*((Y-Lcy(ny))-Ly(ny+1)))/(Lx(nx+1)*Ly(ny+1));
    N2=(X-Lcx(nx))/Lx(nx+1).*(1-(Y-Lcy(ny))/Ly(ny+1));
    N3=(Y-Lcy(ny))/Ly(ny+1).*(1-(X-Lcx(nx))/Lx(nx+1));
    N4=((X-Lcx(nx)).*(Y-Lcy(ny)))/(Lx(nx+1)*Ly(ny+1));

    Z=Heat(ny,nx)*N1+Heat(ny,nx+1)*N2+Heat(ny+1,nx)*N3+Heat(ny+1,nx+1)*N4;
    
    %[gX,gY]=gradient(-Z);
    
    surf(X,Y,Z);
    %quiver(X,Y,gX,gY);
    hold on
end
end
end

if orden == 2
for ny=1:Ey
for nx=1:Ex
    X=linspace(Lcx(nx),Lcx(nx+1));
    Y=linspace(Lcy(ny),Lcy(ny+1));
    [X,Y] = meshgrid(X,Y);
    
    N1=((((X-Lcx(nx))-(Lx(nx+1))).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*((Y-Lcy(ny))-(Ly(ny+1))).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N2=((-4.*(X-Lcx(nx)).*((X-Lcx(nx))-(Lx(nx+1))).*((Y-Lcy(ny))-(Ly(ny+1))).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N3=(((X-Lcx(nx)).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*((Y-Lcy(ny))-(Ly(ny+1))).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N4=((-4.*((X-Lcx(nx))-(Lx(nx+1))).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*((Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N5=((16.*(X-Lcx(nx)).*((X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*((Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N6=((-4.*(X-Lcx(nx)).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*((Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N7=((((X-Lcx(nx))-(Lx(nx+1))).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N8=((-4.*(X-Lcx(nx)).*((X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));
    N9=(((X-Lcx(nx)).*(2.*(X-Lcx(nx))-(Lx(nx+1))).*(Y-Lcy(ny)).*(2.*(Y-Lcy(ny))-(Ly(ny+1))))/((Lx(nx+1))^(2).*(Ly(ny+1))^(2)));

    Z=Heat(2*ny-1,2*nx-1)*N1+Heat(2*ny-1,2*nx)*N2+Heat(2*ny-1,2*nx+1)*N3+Heat(2*ny,2*nx-1)*N4+Heat(2*ny,2*nx)*N5+Heat(2*ny,2*nx+1)*N6+Heat(2*ny+1,2*nx-1)*N7+Heat(2*ny+1,2*nx)*N8+Heat(2*ny+1,2*nx+1)*N9;
    
    %[gX,gY]=gradient(-Z);
    
    surf(X,Y,Z);
    %quiver(X,Y,gX,gY);
    hold on
end
end
end

end

