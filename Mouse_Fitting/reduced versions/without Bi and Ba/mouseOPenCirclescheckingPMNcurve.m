function f= mouseOPenCirclescheckingPMNcurve()
%fitting only to NG data. But checking the PMN curve as well. Using the
%first point as initial condition and the total cell count is changed.
% close all
% clear

initial=[    0.000362133817987
   0.000999375798451
   0.000000003189781
   0.210558544646982
   0.062296559400640
];

thours=(1:9)'.*24;
 
data=[0.90062855;1.892188654;2.674794694;3.170108331;3.574043432;3.194323059;2.109402156;0.972223302;...
    0.866794005];%NG data in log

lb=[10^-5,10^-5,1*10^-12,10^-3,0.001];
ub=[10^-3,10^-3,1*10^-6,0.8,0.1];
% lb=[1.0037,0.7,10^-12,10^-8,1.07];
% ub=[1.004,0.95,10^-3,10^-6,1.075];
 
n0=(0.01*0.01617414*41667)/(1-(0.01*0.01617414));
b0=[10^0.9,0,n0];
b02=[10^0.9,0,n0,0,0,0,0,0,0]';
    
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=1000;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
% [xmulti,errormulti]=run(ms,problem,nruns);
% 
% toc

disp('open circles results')

xmulti
errormulti

%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+41667))*100);
fittedValues=model(xmulti',thours,b0);
f=[fittedValues,fittedValuesPMN];
 
% figure
% scatter(1:9,PMNdata,20,'ob')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
%  
% figure
% scatter(thours/24,data,20,'or')
% hold on
 
plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
end
