function [u_beam]=beam(a,b,M,u_init,u_true)
        dx=(b-a)/M; dt=dx; T=0.5; nu=(dt/dx);
        %nu=nu+(1-nu)
        x=(a:dx:b); tsteps=(0:dt:T);
        nu
        %{
        %smooth case
        uprev=u_init(x); uexact=u_true(x);
        u_beam=0*uprev;
        
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=3:M
                u_beam(j) = uprev(j)-0.5*nu*(3*uprev(j)-4*uprev(j-1)+uprev(j-2))+0.5*nu*nu*(uprev(j)-2*uprev(j-1)+uprev(j-2));
                u_beam(1)=uprev(end);
                u_beam(M+1)=u_beam(1);
                u_beam(2) = uprev(2)-0.5*nu*(3*uprev(2)-4*uprev(1)+uprev(end))+0.5*nu*nu*(uprev(2)-2*uprev(1)+uprev(end));
            end
            uprev=u_beam;
        end
        axis([0 1 0 1.5]);
        plot(x,u_beam);plot(x,uexact,'-+');title('Beam-Warming');hold on;
        legend('Initial True Solution','Beam-Warming','Final True Solution');
        errinf=norm(u_beam-uexact,inf)
        err2=((dt*dx)^(1/2))*norm(u_beam-uexact,2)
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
        u_beam=0*uprev;
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=3:M
                u_beam(1)=1;
                u_beam(M+1)=0;
                u_beam(2) = uprev(2)-0.5*nu*(3*uprev(2)-4*uprev(1)+1)+0.5*nu*nu*(uprev(2)-2*uprev(1)+1);
                u_beam(j) = uprev(j)-0.5*nu*(3*uprev(j)-4*uprev(j-1)+uprev(j-2))+0.5*nu*nu*(uprev(j)-2*uprev(j-1)+uprev(j-2));
                
            end
            uprev=u_beam;
        end
        axis([-0.5 1 -0.5 1.5]);
        plot(x,u_beam);plot(x,uexact,'-+');title('Beam-Warming');hold on;
        legend('Initial True Solution','Beam-Warming','Final True Solution');
        err2=((dt*dx)^(1/2))*norm(u_beam-uexact,2)
        err1=(dt*dx)*norm(u_beam-uexact,1)
        %}
    end