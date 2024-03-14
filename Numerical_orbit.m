

e=0;
ii=90;
GM=398600.44;
r0=6838;
a=r0;
Omega=0;
omega=0;


n=sqrt(GM/r0^3);
T=2*pi/n;
r=r0;
v=2*pi*r/T;
%v=0.8%sqrt(r*GM)
r_v=[r,0,0];
r_p_v=[0,0,v];
t_step=0.1;
tspan=0:t_step:3*T;
%ODEs
opts = odeset('RelTol',1e-25,'AbsTol',1e-28);
[T,Y3] = ode113(@rigid,tspan,[r_v r_p_v],opts);

n_step=length(tspan);

error=10^(-15);
R3_Omega=[cosd(-Omega),sind(-Omega),0;-sind(-Omega),cosd(-Omega),0;0,0,1];
R3_omega=[cosd(-omega),sind(-omega),0;-sind(-omega),cosd(-omega),0;0,0,1];
R1_i=[1,0,0;0,cosd(-ii),sind(-ii);0,-sind(-ii),cosd(-ii)];
for j=1:n_step
    [rb(:,j),vb(:,j)]=prog2(a,e,ii,Omega,omega,tspan(j),error,n);
    ri(:,j)=R3_Omega*R1_i*R3_omega*rb(:,j);
end

%Simple integrator
dy_0=r_p_v';
y=r_v';
for j=1:n_step
    [r_si(:,j),dy_0]=simp_integr(t_step,dy_0,y);
    y=r_si(:,j);
end

[X,Y,Z] = sphere;
r0=6400;
X2=X*r0;
Y2=Y*r0;
Z2=Z*r0;

figure
title('Position free-space system')
hold on
plot3(Y3(:,1),Y3(:,2),Y3(:,3))
plot3(ri(1,:),ri(2,:),ri(3,:))
plot3(r_si(1,:),r_si(2,:),r_si(3,:),'green')
surf(X2,Y2,Z2)
legend('CHAMP_{Numerical}','CHAMP_{Analitical}','CHAMP_{Simple numerical}','Earth')
xlabel('X axis,km')
ylabel('Y axis,km')
zlabel('Z axis,km')
axis equal
view(0,0)
hold off


Time=tspan;
figure
hold on

title('Difference in Numerical and analitical orbits in space-fix frame, projections X,Y,Z ')
plot(Time,Y3(:,1)'-ri(1,:))
plot(Time,Y3(:,2)'-ri(2,:))
plot(Time,Y3(:,3)'-ri(3,:))
legend('X projection','Y projection','Z projection')
xlabel('X axis,time(s)')
ylabel('Y axis,km')
hold off

figure
hold on

title('Difference in simple numerical and analitical orbits in space-fix frame, projections X,Y,Z ')
plot(Time,r_si(1,:)-ri(1,:))
plot(Time,r_si(2,:)-ri(2,:))
plot(Time,r_si(3,:)-ri(3,:))
legend('X projection','Y projection','Z projection')
xlabel('X axis,time(s)')
ylabel('Y axis,km')
hold off