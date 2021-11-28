close all
clear

%initial conditions for ODE
b=1000;%initial size of the unattached bacteria
b_n=0;%initial size of NG within PMN
b_i=0;% %initial size of NG within epithelial
b_a=0;%initial size of the attached bacteria to epithelial
n=10^-8;%initial neutrophils

time=2500;%time in hours
options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
[t,y]=ode45(@(t,y)Equations(t,y),0:time,[b,b_n,b_i,n,b_a],options);

