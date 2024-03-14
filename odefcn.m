function dydt = odefcn(t,y,GM,r)
dydt = zeros(2,1);
dydt(1) = y(2);
dydt(2) = (GM/r^2)*t.*y(1);
%y''=(GM/r^2)*(r_v/r)