function dy = rigid(t,y)
dy = zeros(6,1);

GM=398600.44;
%Position
xx=y(1);
yy=y(2);
zz=y(3);
%Radius
r=(xx.^2+yy.^2+zz.^2).^0.5;


%dX/dt
dy(1)=y(4); %vx
dy(4)=-GM.*xx.*r.^-3; %ax

%dY/dt
dy(2)=y(5); %vy
dy(5)=-GM.*yy.*r.^-3; %ay

%dZ/dt
dy(3)=y(6); %vz
dy(6)=-GM.*zz.*r.^-3; %az