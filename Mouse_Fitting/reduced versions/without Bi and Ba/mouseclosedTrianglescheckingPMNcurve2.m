function f=mouseclosedTrianglescheckingPMNcurve2()
% close all
% clear   


initial=[     0.000000143055676
   0.000000309388939
   0.000000260334010
   0.083613046831668
   0.000035162718367
];
thours=(1:9)'.*24';
 
data=[3.114345114;2.823284823;2.503118503;2.022869023;2.124740125;0;0;0.014553015;0.014553015];
% % 
lb=[10^-8,1*10^-8,10^-13,10^-3,5*10^-6];
ub=[10^-1,0.05,10^-4,0.1,10^-3];


n0=0.01*0.44681061*83333/(1-0.01*0.44681061);
b0=[10^3.114345114,0,n0];
b02=[10^3.114345114,0,n0,0,0,0,0,0,0]';
    
    
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq2(parameters,x),initial,[],[],[],[],lb,ub,[])

% nruns=1000;
% tic
% options=optimset('MaxIter',1000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq2(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
% [xmulti,errormulti]=run(ms,problem,nruns);
%  toc
fprintf('\n')
fprintf('\n')
 disp('mouse closed Triangles')
xmulti
errormulti

%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+83333))*100);
% scatter(1:9,PMNdata,20,'^b','MarkerFaceColor','b')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
% 
% figure
% scatter(thours/24,data,20,'^r','MarkerFaceColor','r')
% hold on
 
fittedValues=model_geo_mean(xmulti',thours,b0);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
f=[fittedValues,fittedValuesPMN];
end
