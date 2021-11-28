function f= mouseOPenSquarecheckingPMNcurve2()
% close all
% clear

%initial=[6.1;1.3;4.72*10^-8;3.92*10^-5;5.221*10^-13;0.0462;0.204]./24;
% initial=[6.05;1.25;4.72*10^-8;3.92*10^-5;5.221*10^-13;0.0462;0.204]./24; 
thours=(1:9)'.*24' ; 
% initial=[   0.033534170843177
%    0.051202341442237
%    0.000000012277239
%    0.000018937017119
%    0.000004916424957
%    0.045621840592073
%    0.000029262199651];  %initial guess
   initial=[  
   0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000001003320103
   0.042372600705623
   0.000999997743138

];
 
data=[4.336798337;3.827442827;0.029106029;0;0;0.029106029;0.014553015;0;0.014553015];%in log
PMNdata=[0.44681061;27.33902868;34.90050083;36.85539291;13.38493324;1.434042899;2.656439671...
    ;0.179787066;10^-5];
PMNdata=log10(PMNdata);

lb=[10^-6,0.007,10^-13,10^-7,10^-6,0,10^-6];
ub=[10^-1,0.05,10^-5,10^-3,10^-3,0.1,10^-3];
 
 x=[thours,data];
 tic
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=100;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%   'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',500);
% [xmulti,errormulti]=run(ms,problem,nruns);
fprintf('\n')
fprintf('\n')
 disp('mouse OPen Square')
function SSE=ssq(parameters,x)
    time=x(:,1);
    data1=x(:,2);
    
       
    fitted=model(parameters,time);
    error1=fitted(:,1)-data1;
    SSE=sum(error1.^2);
  
         
end

% toc
%getting PMN output
fittedValuesPMN=model2(xmulti',1:9);
fittedValuesPMN=log10((fittedValuesPMN(1:9)./(45833+fittedValuesPMN(1:9)))*100);
% figure
% scatter(1:9,PMNdata,20,'sb')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
% 
% figure
% scatter(thours/24,data,20,'sr')
% hold on
%  
fittedValues=model(xmulti',thours);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
xmulti
errormulti
f=[fittedValues(1:9),fittedValuesPMN];

end
function output= model(para,thours)
    n0=0.01*0.44681061*42083/(1-(0.01*0.44681061));
    b0=[10^4.336798337,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [time,values] = ode45(@Equations,thours,b0,options);
 
    function s=Equations(t,y)
    r1=para(7);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=para(4);%proportion surving within PMN
    d1=para(1);%rate that NG are engulfed by PMN
    d4=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=para(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=para(2);%ratio dependent constant
    d5=0.65;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.53289;%replication rate of internalized NG within epithelial cells
    r3=para(6);%replication of survinvg NG within PMN
    q=para(5);%proportion of NG internalized

   
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


function output= model2(para,thours)
    n0=0.01*0.44681061*41667/(1-(0.01*0.44681061));
    b0=[10^4.336798337,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [time,values] = ode45(@Equations,thours,b0,options);
 
    function s=Equations(t,y)
    r1=para(7);%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=para(4);%proportion surving within PMN
    d1=para(1);%rate that NG are engulfed by PMN
    d4=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=para(3);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/11;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=para(2);%ratio dependent constant
    d5=0.65;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.53289;%replication rate of internalized NG within epithelial cells
    r3=para(6);%replication of survinvg NG within PMN
    q=para(5);%proportion of NG internalized

   
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