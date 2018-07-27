 function [u_lf]=lf(a,b,M,u_init,u_true)
        dx=(b-a)/M; dt=dx/2; T=0.5; nu=(dt/dx)
        x=(a:dx:b); tsteps=(0:dt:T);
        %{
        %smooth case
        uprev=u_init(x); uexact=u_true(x);
        u_lf=0*uprev;
        
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=2:M
                u_lf(j) = 0.5*(uprev(j+1)+uprev(j-1))-0.5*nu*(uprev(j+1)-uprev(j-1));
                u_lf(1)=uprev(end);
                u_lf(M+1)=u_lf(1);
            end
            uprev=u_lf;
        end
        axis([0 1 0 1.5]);
        plot(x,u_lf);plot(x,uexact,'-+');title('Lax-Friedrichs');hold on;
        legend('Initial True Solution','Lax-Friedrichs','Final True Solution');
        errinf=norm(u_lf-uexact,inf)
        err2=((dt*dx)^(1/2))*norm(u_lf-uexact,2)
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
        u_lf=0*uprev;
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=2:M
                u_lf(j) = 0.5*(uprev(j+1)+uprev(j-1))-0.5*nu*(uprev(j+1)-uprev(j-1));
                u_lf(1)=1;
                u_lf(M+1)=0;
            end
            uprev=u_lf;
        end
        axis([-0.5 1 0 1.5]);
        plot(x,u_lf);plot(x,uexact,'-+');title('Lax-Friedrichs');hold on;
        legend('Initial True Solution','Lax-Friedrichs','Final True Solution');
        err2=((dt*dx)^(1/2))*norm(u_lf-uexact,2)
        err1=(dt*dx)*norm(u_lf-uexact,1)

        %}
    end