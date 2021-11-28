function s= Natural_infection_model_sensitivity_14paras(~,y,para)
  

    r1=para(1);%replication rate  of unattached bacteria
    a1=para(4);%bacterial attachment rate to epithelial
    p=para(11);%proportion surving within PMN
    d=para(9);%rate that NG are engulfed by PMN
    d2=para(12);%washout rate of unattached bacteria
    N_max=2.5*10^10;%maximum number of neutrophils in the body
    mu=para(7);%neutrophil activation rate
    d3=para(13);%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/para(5);%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=para(10);%ratio dependent constant
    e=para(6);%rate of exit from epithelial cells
    k3=para(14);%carrying capacity of PMN
    r2=para(2);%replication rate of internalized NG within epithelial cells
    r3=para(3);%replication of survinvg NG within PMN
    eta=para(8);%proportion of NG internalized

   
    s=zeros(5,1);
 
    s(1)=(1-((y(1)+y(5))/k))*(r1*y(1)+d3*y(2)+e*y(3))-(d*y(1)*y(4)/(c*y(4))+y(1))-d2*y(1)...
        -a1*y(1)*(1-(y(5)/(k2)));%rate of change of unattached bacteria
    s(2)=(1-(y(2)/(y(4)*k3)))*((p*d*y(4)*y(1)/(c*y(4)+y(1)))+(p*d*y(4)*y(5)/(c*y(4)+y(5)))+r3*y(2))...
        -d3*y(2);%NG within PMN 
    s(3)=(1-(y(3)/k2))*(eta*y(5)+r2*y(3))-e*y(3);%NG within epithelial
    s(4)=mu*(N_max-y(4))*(y(1)+y(5))-d3*y(4);%activated neutrophil
    s(5)=(r1*y(5))*(1-((y(1)+y(5))/k))-(d*y(4)*y(5)/(c*y(4)+y(5)))-...
        eta*y(5)+a1*y(1)*(1-(y(5)/k2));%attached bacteria
 
   end