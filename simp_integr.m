function [r_ans,dy] = simp_integr(dt,dy_0,y)

GM=398600.44;
%Position
xx=y(1);
yy=y(2);
zz=y(3);
%Radius
r=(xx.^2+yy.^2+zz.^2).^0.5;


%dX/dt
%dy(1)=y(4); %vx
ddy(1)=-GM.*xx.*r.^-3; %ax

%dY/dt
%dy(2)=y(5); %vy
ddy(2)=-GM.*yy.*r.^-3; %ay

%dZ/dt
%dy(3)=y(6); %vz
ddy(3)=-GM.*zz.*r.^-3; %az
dy=zeros(3,1);
dy(1)=ddy(1)*dt+dy_0(1); %dx
dy(2)=ddy(2)*dt+dy_0(2); %dy
dy(3)=ddy(3)*dt+dy_0(3); %dz
r_ans=y+dy*dt;
