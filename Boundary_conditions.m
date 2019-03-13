function [ Front_x1,Front_x2,Front_y1,Front_y2,T_x1,Q_x1,beta_x1,Tinf_x1,T_x2,Q_x2,beta_x2,Tinf_x2,T_y1,Q_y1,beta_y1,Tinf_y1,T_y2,Q_y2,beta_y2,Tinf_y2 ] = Boundary_conditions(Coord)

syms T_x1(y) Q_x1(y) beta_x1(y) Tinf_x1(y) T_x2(y) Q_x2(y) beta_x2(y) Tinf_x2(y) T_y1(x) Q_y1(x) beta_y1(x) Tinf_y1(x) T_y2(x) Q_y2(x) beta_y2(x) Tinf_y2(x)

if Coord==1
    Front_x1=input('Conditions in the left boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_x2=input('Conditions in the right boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_y1=input('Conditions in the bottom boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_y2=input('Conditions in the top boundary (Temperature:1, Heat flux:2, Convection:3) ');
elseif Coord==2
    Front_x1=input('Conditions in the interior boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_x2=input('Conditions in the exterior boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_y1=input('Conditions in the left boundary (Temperature:1, Heat flux:2, Convection:3) ');
    Front_y2=input('Conditions in the right boundary (Temperature:1, Heat flux:2, Convection:3) ');
end

    if Coord==1
        
    elseif Coord==2
        
    end

if Front_x1==1
    if Coord==1
        T_x1(y)=input('Temperature in the left boundary ');
    elseif Coord==2
        T_x1(y)=input('Temperature in the interior boundary ');
    end
    Q_x1(y)=[];
    beta_x1(y)=[];
    Tinf_x1(y)=[];
elseif Front_x1==2
    T_x1(y)=[];
    if Coord==1
        Q_x1(y)=input('Heat flux in the left boundary ');
    elseif Coord==2
        Q_x1(y)=input('Heat flux in the interior boundary ');
    end
    beta_x1(y)=[];
    Tinf_x1(y)=[];
elseif Front_x1==3
    T_x1(y)=[];
    Q_x1(y)=[];
    if Coord==1
        beta_x1(y)=input('Convective coefficient in the left boundary ');
        Tinf_x1(y)=input('Ambient temperature in the left boundary ');    
    elseif Coord==2
        beta_x1(y)=input('Convective coefficient in the interior boundary ');
        Tinf_x1(y)=input('Ambient temperature in the interior boundary ');    
    end
end

if Front_x2==1
    if Coord==1
        T_x2(y)=input('Temperature in the right boundary ');
    elseif Coord==2
        T_x2(y)=input('Temperature in the exterior boundary ');        
    end
    Q_x2(y)=[];
    beta_x2(y)=[];
    Tinf_x2(y)=[];
elseif Front_x2==2
    T_x2(y)=[];
    if Coord==1
        Q_x2(y)=input('Heat flux in the right boundary ');  
    elseif Coord==2
        Q_x2(y)=input('Heat flux in the exterior boundary ');    
    end
    beta_x2(y)=[];
    Tinf_x2(y)=[];
elseif Front_x2==3
    T_x2(y)=[];
    Q_x2(y)=[];
    if Coord==1
        beta_x2(y)=input('Convective coefficient in the right boundary ');
        Tinf_x2(y)=input('Ambient temperature in the right boundary ');    
    elseif Coord==2
        beta_x2(y)=input('Convective coefficient in the exterior boundary ');
        Tinf_x2(y)=input('Ambient temperature in the exterior boundary ');    
    end
end

if Front_y1==1
    if Coord==1
        T_y1(x)=input('Temperature in the bottom boundary ');    
    elseif Coord==2
        T_y1(x)=input('Temperature in the left boundary ');    
    end
    Q_y1(x)=[];
    beta_y1(x)=[];
    Tinf_y1(x)=[];
elseif Front_y1==2
    T_y1(x)=[];
    if Coord==1
        Q_y1(x)=input('Heat flux in the bottom boundary ');    
    elseif Coord==2
        Q_y1(x)=input('Heat flux in the left boundary ');    
    end
    beta_y1(x)=[];
    Tinf_y1(x)=[];
elseif Front_y1==3
    T_y1(x)=[];
    Q_y1(x)=[];
    if Coord==1
        beta_y1(x)=input('Convective coefficient in the bottom boundary ');
        Tinf_y1(x)=input('Ambient temperature in the bottom boundary ');    
    elseif Coord==2
        beta_y1(x)=input('Convective coefficient in the left boundary ');
        Tinf_y1(x)=input('Ambient temperature in the left boundary ');    
    end
end

if Front_y2==1
    if Coord==1
        T_y2(x)=input('Temperature in the top boundary ');
    elseif Coord==2
        T_y2(x)=input('Temperature in the right boundary ');    
    end
    Q_y2(x)=[];
    beta_y2(x)=[];
    Tinf_y2(x)=[];
elseif Front_y2==2
    T_y2(x)=[];
    if Coord==1
        Q_y2(x)=input('Heat flux in the top boundary ');    
    elseif Coord==2
        Q_y2(x)=input('Heat flux in the right boundary ');    
    end
    beta_y2(x)=[];
    Tinf_y2(x)=[];
elseif Front_y2==3
    T_y2(x)=[];
    Q_y2(x)=[];
    if Coord==1
        beta_y2(x)=input('Convective coefficient in the top boundary ');
        Tinf_y2(x)=input('Ambient temperature in the top boundary ');        
    elseif Coord==2
        beta_y2(x)=input('Convective coefficient in the right boundary ');
        Tinf_y2(x)=input('Ambient temperature in the right boundary ');        
    end
end

end
