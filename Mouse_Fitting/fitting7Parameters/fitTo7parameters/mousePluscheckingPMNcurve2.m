function f=mousePluscheckingPMNcurve2()
% close all
% clear


initial=[   0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000005225426946
   0.109601660260155
   0.196163153971005
];

thours=(1:9)'.*24';
 
data=[4.38045738;3.929313929;5.108108108;2.925155925;2.343035343;3.856548857;6.316008316;5.413721414;4.831600832];
PMNdata=[0.232166297;0.263245696;0.29008853;0.109263115;0.145014228;1.281501718;27.80351444;28.05707916;10^-1];%adjusted PMN data per 100 cells
PMNdata=log10(PMNdata);

% lb=[0,0.08,1*10^-12,01*10^-11,10^-8,0.09,10^-3];
% ub=[0.5,0.8,1*10^-5,1*10^-3,10^-4,0.4,0.1];
 
lb=[10^-5,10^-5,1*10^-13,1*10^-7,0,1*10^-3,0.1];
ub=[10^-3,0.1,1*10^-4,1*10^-3,1*10^-3,0.5,0.8];
%options=optimset('MaxIter',10000);


x=[thours,data];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=500;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
% [xmulti,errormulti]=run(ms,problem,nruns);
%  toc
xmulti
errormulti
function SSE=ssq(parameters,x)
    time=x(:,1);
    data1=x(:,2);
    
       
    fitted=model(parameters,time);
    error1=fitted(:,1)-data1;
    SSE=sum(error1.^2);
  
         
end
%getting PMN output
fittedValuesPMN=model2(xmulti',thours);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+41665))*100);
% figure
% scatter(1:9,PMNdata,20,'+b')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
% 
% figure
% scatter(thours/24,data,20,'+r')
% hold on
%  
 fittedValues=model(xmulti',thours);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
% % disp('mouse Plus')

f=[fittedValues,fittedValuesPMN];
 

end
function output= model(x,thours)
    n0=0.01*0.232166297*41665/(1-(0.01*0.232166297));
    b0=[10^4.38045738,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [time,values] = ode45(@Equations,thours,b0,options);
 
    function s=Equations(t,y)
     
    r1=x(7);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=x(4);%proportion surving within PMN
    d1=x(1);%rate that NG are engulfed by PMN
    d4=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=x(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=x(2);%ratio dependent constant
    d5=0.65;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.53289;%replication rate of internalized NG within epithelial cells
    r3=x(6);%replication of survinvg NG within PMN
    q=x(5);%proportion of NG internalized

   
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


function output= model2(x,thours)
    n0=0.01*0.232166297*41667/(1-(0.01*0.232166297));
    b0=[10^4.38045738,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [time,values] = ode45(@Equations,thours,b0,options);
 
    function s=Equations(t,y)
        r1=x(7);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=x(4);%proportion surving within PMN
    d1=x(1);%rate that NG are engulfed by PMN
    d4=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=x(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=x(2);%ratio dependent constant
    d5=0.65;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.53289;%replication rate of internalized NG within epithelial cells
    r3=x(6);%replication of survinvg NG within PMN
    q=x(5);%proportion of NG internalized

   
    s=zeros(5,1);
 
    s(1)=(r1*y(1))*(1-((y(1)+y(5))/k))-a1*y(1)*(1-(y(5)/k2))-d1*y(4)*y(1)/(c*y(4)+y(1))-d4*y(1)...
        +d5*y(3)+d3*y(2);%rate of change of unattached bacteria
    s(2)=p*d1*y(4)*y(1)/(c*y(4)+y(1))-d3*y(2)+r3*y(2)*(1-(y(2)/(y(4)*k3)))+...
        p*d1*y(4)*y(5)/(c*y(4)+y(5));%NG surviving within PMN
    s(3)=q*y(5)-d5*y(3)+r2*y(3)*(1-(y(3)/k2));%NG within epithlial
    s(4)=mu*(N_max-y(4))*(y(1)+y(5))-d3*y(4);%activated neutrophil
    s(5)=(r1*y(5))*(1-((y(1)+y(5))/k))-d1*y(4)*y(5)/(c*y(4)+y(5))-q*y(5)+a1*y(1)*(1-(y(5)/k2));
 
 
    end
 
output=values(:,4);

 
end