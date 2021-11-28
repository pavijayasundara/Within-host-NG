function output= model(x,thours,initialCond)
    
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [time,values] = ode45(@Equations,thours,initialCond,options);
 
    function s=Equations(t,y)
     
    r1=x(5);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=5.4*10^-5;%proportion surving within PMN
    d1=x(1);%rate that NG are engulfed by PMN
    d4=10^-3;%washout rate of unattached bacteria
    N_max=8.32*10^6;%maximum number of neutrophils in the body
    mu=x(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=3*10^6;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=x(2);%ratio dependent constant
    d5=0.65;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.53289;%replication rate of internalized NG within epithelial cells
    r3=x(4);%replication of survinvg NG within PMN
    q=5*10^-6;%proportion of NG internalized

   
    s=zeros(5,1);
 
  s(1)=(1-((y(1)+y(5))/k))*(r1*y(1)+d3*y(2)+d5*y(3))-(d1*y(1)*y(4)/(c*y(4))+y(1))-d4*y(1)...
        -a1*y(1)*(1-(y(5)/(k2)));%rate of change of unattached bacteria
    s(2)=(1-(y(2)/(y(4)*k3)))*((p*d1*y(4)*y(1)/(c*y(4)+y(1)))+(p*d1*y(4)*y(5)/(c*y(4)+y(5)))+r3*y(2))...
        -d3*y(2);%NG within PMN 
    s(3)=(1-(y(3)/k2))*(q*y(5)+r2*y(3))-d5*y(3);%NG within epithelial
    s(4)=mu*(N_max-y(4))*(y(1)+y(5))-d3*y(4);%activated neutrophil
    s(5)=(r1*y(5))*(1-((y(1)+y(5))/k))-(d1*y(4)*y(5)/(c*y(4)+y(5)))-...
        q*y(5)+a1*y(1)*(1-(y(5)/k2));%attached bacteria  
    end
 
output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
output=log10(output);
 end