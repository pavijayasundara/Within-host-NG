function output= model2(x,thours,initialCond)

    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,initialCond,options);
 
    function s=Equations(~,y)
     
r1=x(4);%replication rate  of unattached bacteria
    d1=x(1);%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=x(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    c=x(2);%ratio dependent constant
    k=8.32*10^6;  
    s=zeros(2,1);
 
    s(1)=(r1*y(1))*(1-(y(1)/k))-d1*y(2)*y(1)/(c*y(2)+y(1))-d2*y(1);%rate of change of unattached bacteria
    s(2)=mu*(N_max-y(2))*y(1)-d3*y(2);%activated neutrophil
    
 
    end
 
output=values(:,2);

 
end