function [u] = advection_upwind(a,b,dx,dt,max_t,c)
    space = (a:dx:b);
    time = (0:dt:max_t);
    nu = (c*dt)/dx;
    
    %smooth initial conditions
    u_0 = @(x)(exp(-100*(0.3-x)^2));

    uprev = arrayfun(u_0, space);
    u = 0*uprev;
    
    for n=1:length(time)  
        for j=2:length(u)
            u(j) = uprev(j)-nu*(uprev(j)-uprev(j-1));
            u(1) = u(end); %periodic bc
        end 
        uprev = u;
    end
end
