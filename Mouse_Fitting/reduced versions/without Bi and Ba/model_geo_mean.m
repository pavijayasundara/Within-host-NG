function output= model_geo_mean(x,thours,initialCond)
    
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,initialCond,options);
 
    function s=Equations(t,y)
     
    r1=x(5);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=3.35*10^-6;%proportion surving within PMN
    d1=x(1);%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=x(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=x(2);%ratio dependent constant
    k3=8;%carrying capacity of PMN
    r3=x(4);%replication of survinvg NG within PMN
   
   
    s=zeros(3,1);
 
    s(1)=(r1*y(1)+d3*y(2))*(1-(y(1)/k))-d1*y(3)*y(1)/(c*y(3)+y(1))-d2*y(1);%rate of change of unattached bacteria
    s(2)=(p*d1*y(3)*y(1)/(c*y(3)+y(1))+r3*y(2))*(1-(y(2)/(y(3)*k2)))-d3*y(2);%NG within PMN
    s(3)=mu*(N_max-y(3))*y(1)-d3*y(3);%activated neutrophil
    end
 
output=values(:,1)+values(:,2);
output=log10(output);
 end