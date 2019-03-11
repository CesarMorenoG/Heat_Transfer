function [ Heat ] = Solve( orden,Ex,Ey,A_geo,Front_x1,Front_x2,Front_y1,Front_y2,T,MK,VQ )

if orden == 1
    T_front=zeros((Ex+1)*(Ey+1),1);
    T_not_front=zeros((Ex+1)*(Ey+1),1);
end

if orden == 2
    T_front=zeros((2*Ex+1)*(2*Ey+1),1);
    T_not_front=zeros((2*Ex+1)*(2*Ey+1),1);
end

if orden == 1
if Front_x1==1 
    for n=1:Ey+1
        T_front(A_geo(n,1)) = 1;
    end    
end
if Front_x2==1 
    for n=1:Ey+1
        T_front(A_geo(n,end)) = 1;
    end    
end
if Front_y1==1 
    for n=1:Ex+1
        T_front(A_geo(1,n)) = 1;
    end    
end
if Front_y2==1
    for n=1:Ex+1
        T_front(A_geo(end,n)) = 1;
    end    
end
end

if orden == 2
if Front_x1==1 
    for n=1:2*Ey+1
        T_front(A_geo(n,1)) = 1;
    end    
end
if Front_x2==1 
    for n=1:2*Ey+1
        T_front(A_geo(n,end)) = 1;
    end    
end
if Front_y1==1 
    for n=1:2*Ex+1
        T_front(A_geo(1,n)) = 1;
    end    
end
if Front_y2==1
    for n=1:2*Ex+1
        T_front(A_geo(end,n)) = 1;
    end    
end
end

T_front_pos=find(T_front==1);
T_not_front_pos=find(T_front==0);
T_front(T_front_pos)=T(T_front_pos);

%T_not_front(T_front_pos)=[];

MK(T_front_pos,:)=[];
VQ(T_front_pos)=[];

VQ=VQ-(MK*T_front);

MK(:,T_front_pos)=[];
T_int=MK\VQ;

for i=1:size(T_not_front_pos,1)
    T_not_front(T_not_front_pos(i))=T_int(i);
end

Temp=T_front+T_not_front;

if orden == 1
    Heat=zeros(Ey+1,Ex+1);
    for ny=1:Ey+1 
    for nx=1:Ex+1 
        Heat(ny,nx)=Temp((ny-1)*(Ex+1)+nx);
    end
    end
end
 
if orden == 2
    Heat=zeros(Ey+1,Ex+1);
    for ny=1:2*Ey+1 
    for nx=1:2*Ex+1 
        Heat(ny,nx)=Temp((ny-1)*(2*Ex+1)+nx);
    end
    end
end
end

