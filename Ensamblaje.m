function [ MK,VQ ] = Ensamblaje( orden,Ex,Ey,A_e,A_geo,K,Q  )

if orden == 1
MK=zeros((Ex+1)*(Ey+1));
%MM=zeros((elemento_x+1)*(elemento_y+1));
VQ=zeros((Ex+1)*(Ey+1),1);
for ny=1:Ey 
for nx=1:Ex 
    for j=1:2
        for i=1:2   
            MK(A_geo(1+(ny-1),1+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) = MK(A_geo(1+(ny-1),1+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) + K(1,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(1+(ny-1),2+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) = MK(A_geo(1+(ny-1),2+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) + K(2,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(2+(ny-1),1+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) = MK(A_geo(2+(ny-1),1+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) + K(3,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(2+(ny-1),2+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) = MK(A_geo(2+(ny-1),2+(nx-1)),A_geo(j+(ny-1),i+(nx-1))) + K(4,A_e(j,i),(ny-1)*Ex+nx);
        end
    end
    for i=1:2
        VQ(A_geo(ny,i+(nx-1))) = VQ(A_geo(ny,i+(nx-1))) + Q(i,1,(ny-1)*Ex+nx);
        VQ(A_geo(ny+1,i+(nx-1))) = VQ(A_geo(ny+1,i+(nx-1))) + Q(i+2,1,(ny-1)*Ex+nx);
    end    
end
end
end

if orden == 2
MK=zeros((2*Ex+1)*(2*Ey+1));
%MM=zeros((2*elemento_x+1)*(2*elemento_y+1));
VQ=zeros((2*Ex+1)*(2*Ey+1),1);
for ny=1:Ey 
for nx=1:Ex 
    for j=1:3
        for i=1:3   
            MK(A_geo(1+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(1+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(1,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(1+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(1+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(2,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(1+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(1+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(3,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(2+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(2+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(4,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(2+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(2+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(5,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(2+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(2+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(6,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(3+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(3+2*(ny-1),1+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(7,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(3+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(3+2*(ny-1),2+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(8,A_e(j,i),(ny-1)*Ex+nx);
            MK(A_geo(3+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) = MK(A_geo(3+2*(ny-1),3+2*(nx-1)),A_geo(j+2*(ny-1),i+2*(nx-1))) + K(9,A_e(j,i),(ny-1)*Ex+nx);
        end
    end
    for i=1:3
        VQ(A_geo(2*ny-1,i+2*(nx-1))) = VQ(A_geo(2*ny-1,i+2*(nx-1))) + Q(i,1,(ny-1)*Ex+nx);
        VQ(A_geo(2*ny,i+2*(nx-1))) = VQ(A_geo(2*ny,i+2*(nx-1))) + Q(i+3,1,(ny-1)*Ex+nx);
        VQ(A_geo(2*ny+1,i+2*(nx-1))) = VQ(A_geo(2*ny+1,i+2*(nx-1))) + Q(i+6,1,(ny-1)*Ex+nx);
    end    
end
end
end

end

