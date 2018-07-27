  function[u_up]=up(a,b,M,u_init,u_true)
        dx=(b-a)/M; dt=dx/2; T=0.5; nu=-1*(dt/dx)
        x=(a:dx:b); tsteps=(0:dt:T);
        %{
        %smooth case
        uprev=u_init(x);uexact=u_true(x);
        u_up=0*uprev;
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)  
            for j=2:length(u_up)
                u_up(j)=uprev(j)-nu*(uprev(j)-uprev(j-1));
                u_up(1)=uprev(end);
            end 
            uprev=u_up;
        end
        axis([0 1 0 1.5]);
        plot(x,u_up);plot(x,uexact,'-+');title('Upwind');hold on;
        legend('Initial True Solution','Upwind','Final True Solution');
        errinf=norm(u_up-uexact,inf);
        err2=((dt*dx)^(1/2))*norm(u_up-uexact,2);
        
        for j=1:5
            h(j)=10^(-j);
        
        %}
        %{
        %bump case
        for j=1:length(x)
            if x(j) < 0
                uprev(j) = 1;
            elseif x(j) == 0
                uprev(j) = 0.5;
            elseif x(j) > 0
                uprev(j) = 0;
            end
        end
        for j=1:length(x)
            if (x(j)-0.5) < 0
                uexact(j) = 1;
            elseif (x(j)-0.5) == 0
                uexact(j) = 0.5;
            elseif (x(j)-0.5) > 0
                uexact(j) = 0;
            end
        end
        u_up=0*uprev;
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)  
            for j=2:length(u_up)
                u_up(j)=uprev(j)-nu*(uprev(j)-uprev(j-1));
            end
            u_up(1)=1;
            uprev=u_up;
        end
        axis([-0.5 1 0 1.5]);
        plot(x,u_up);plot(x,uexact,'-+');
        title('Upwind');hold on;
        legend('Initial True Solution','Upwind','Final True Solution');
        err2=((dt*dx)^(1/2))*norm(u_up-uexact,2)
        err1=(dt*dx)*norm(u_up-uexact,1)
        %}

    end