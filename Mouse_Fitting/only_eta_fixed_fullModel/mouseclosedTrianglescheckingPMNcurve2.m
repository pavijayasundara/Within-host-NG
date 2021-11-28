function f=mouseclosedTrianglescheckingPMNcurve2()
% close all
% clear   

initial=[  1.005427580387888
   0.955514895775686
   0.000000000048671
   0.00000340001782
   0.089867152149296
   0.982116215532655
   
];
thours=(1:9)'.*24';
 
data=[3.114345114;2.823284823;2.503118503;2.022869023;2.124740125;0;0;0.014553015;0.014553015];

lb=[0.7,0.7,10^-12,3.3*10^-6,0.06,0.7];
ub=[1.2,1.2,10^-3,3.5*10^-6,0.1,1.2];


n0=0.01*0.44681061*83333/(1-0.01*0.44681061);
b0=[10^3.114345114,0,0,n0,0];
b02=[10^3.114345114,0,0,n0,0,0,0,0,0]';
    
    
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])

% nruns=1;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',3500);
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
figure
scatter(thours/24,data,20,'^r','MarkerFaceColor','r')
hold on
 
fittedValues=model(xmulti',thours,b0);
plot(thours/24,fittedValues,'g')
legend('data','fit')
ylabel('log NG')
xlabel('time(days)')
f=[fittedValues,fittedValuesPMN];
end
