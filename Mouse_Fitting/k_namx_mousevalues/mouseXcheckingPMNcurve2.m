function f=mouseXcheckingPMNcurve2()
% close all
% clear

initial=[     0.009453474416640
   0.013457489620363
   0.000000000015097
   0.045862919994484
   0.000961654862874

];
%log bacteria data
data=[4.303948332;3.724314865;0.011636498;0.010606525;-0.004492433;...
   0.008590409;-0.006530464;-0.007538522;0.005588149];

thours=(1:9)'.*24';


lb=[10^-4,0.01,10^-13,0.02,10^-6];
ub=[10^-2,0.05,10^-5,0.06,10^-3];

n0=0.01*9.085822988*65861/(1-(0.01*9.085822988));
b0=[10^4.303948332,0,0,n0,0];
b02=[10^4.303948332,0,0,n0,0,0,0,0,0]';

x=[thours,data,b02];

[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
%  nruns=1000;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%   'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',3500);
% [xmulti,errormulti]=run(ms,problem,nruns);
%  toc
%  
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+65861))*100);
% figure
% scatter(1:9,PMNdata,20,'xb')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
% 
figure
scatter(thours/24,data,20,'xr')
hold on
 
fittedValues=model(xmulti',thours,b0);
plot(thours/24,fittedValues,'g')
legend('data','fit')
ylabel('log NG')
xlabel('time(days)')
% fprintf('\n')
% fprintf('\n')
 disp('mouse X')

  xmulti
  errormulti

f=[fittedValues,fittedValuesPMN];




end




