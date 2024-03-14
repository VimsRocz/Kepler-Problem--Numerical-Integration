function [rb,vb]=prog2(a,e,i,Omega,omega,t,error,n)
M=n*t;
E=iter(M,e,error);
r=a*(1-e*cos(E));

rb=[a*(cos(E)-e);a*sqrt(1-e^2)*sin(E);0];
vb=[-a*n*sin(E)*a/r;a*n*sqrt(1-e^2)*cos(E)*a/r;0];