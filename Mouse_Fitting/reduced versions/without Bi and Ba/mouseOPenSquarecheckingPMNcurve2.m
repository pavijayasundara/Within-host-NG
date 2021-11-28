function f= mouseOPenSquarecheckingPMNcurve2()
% close all
% clear


thours=(1:9)'.*24' ; 
initial=[   0.000001852718676
   0.000000195282893
   0.000000180976446
   0.050262129043770
   0.039010702862636
];
 

data=[4.336798337;3.827442827;0.029106029;0;0;0.029106029;0.014553015;0;0.014553015];%in log

% lb=[10^-5,10^-5,10^-13,0,10^-8];
% ub=[10^-1,10^-1,10^-5,1,10^-3];
lb=[10^-8,10^-8,10^-13,0.05,10^-5];
ub=[10^-3,0.005,10^-5,2,10^-1];

n0=0.01*0.44681061*42083/(1-(0.01*0.44681061));
b0=[10^4.336798337,0,n0];
b02=[10^4.336798337,0,n0,0,0,0,0,0,0]';
x=[thours,data,b02];
tic
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=1000;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%   'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
% [xmulti,errormulti]=run(ms,problem,nruns);

fprintf('\n')
fprintf('\n')
disp('mouse OPen Square')


% toc
%getting PMN output
fittedValuesPMN=model2(xmulti',1:9,b0);
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
 
fittedValues=model(xmulti',thours,b0);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
xmulti
errormulti
f=[fittedValues(1:9),fittedValuesPMN];

end
