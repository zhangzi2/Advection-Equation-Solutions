  function [u_lw]=lw(a,b,M,u_init,u_true)
        dx=(b-a)/M; dt=dx; T=0.5; nu=(dt/dx);
        x=(a:dx:b); tsteps=(0:dt:T);
        nu
        %{
        %smooth case
        uprev=u_init(x);uexact=u_true(x);
        u_lw=0*uprev;
        
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=2:M
                u_lw(j) = uprev(j)-0.5*nu*(uprev(j+1)-uprev(j-1))+0.5*nu*nu*(uprev(j-1)-2*uprev(j)+uprev(j+1));
                u_lw(1)=uprev(end);
                u_lw(M+1)=u_lw(1);
            end
            uprev=u_lw;
        end
        axis([0 1 -1 1.5]);
        plot(x,u_lw);plot(x,uexact,'-+');title('Lax-Wendroff');hold on;
        legend('Initial True Solution','Lax-Wendroff','Final True Solution');
        errinf=norm(u_lw-uexact,inf)
        err2=((dt*dx)^(1/2))*norm(u_lw-uexact,2)
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
        u_lw=0*uprev;
        plot(x,uprev,'-*');hold on;
        for n=1:length(tsteps)
            for j=2:M
                u_lw(j) = uprev(j)-0.5*nu*(uprev(j+1)-uprev(j-1))+0.5*nu*nu*(uprev(j-1)-2*uprev(j)+uprev(j+1));
                u_lw(1)=1;
                u_lw(M+1)=0;
            end
            uprev=u_lw;
        end
        axis([-0.5 1 0 1.5]);
        plot(x,u_lw);plot(x,uexact,'-+');title('Lax-Wendroff');hold on;
        legend('Initial True Solution','Lax-Wendroff','Final True Solution');
        err2=((dt*dx)^(1/2))*norm(u_lw-uexact,2)
        err1=(dt*dx)*norm(u_lw-uexact,1)
        %}
    end