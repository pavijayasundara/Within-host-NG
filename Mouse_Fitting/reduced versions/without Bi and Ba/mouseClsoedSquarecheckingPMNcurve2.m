function f=mouseClsoedSquarecheckingPMNcurve2()
% close all
% clear

  initial=[  
   0.000447871384171
   0.000646655531902
   0.000000017678465
   0.499961270640398
   0.126248000832526
];

thours=(1:9)'.*24;
 
data=[3.128898129;4.22037422;3.128898129;
2.444906445;4.089397089;5.326403326;6.024948025;6.527027027;6.716216216];

lb=[10^-5,10^-5,1*10^-13,8*10^-3,0.05];
ub=[10^-1,0.1,1*10^-4,0.5,1.8];

n0=0.01*0.232166297*10001/(1-(0.01*0.232166297));
b0=[10^3.13,0,n0];
b02=[10^3.13,0,n0,0,0,0,0,0,0]';

x=[thours,data,b02];

[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=1000;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',2500);
% [xmulti,errormulti]=run(ms,problem,nruns);
%  toc
xmulti
errormulti

%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+10001))*100);

% figure
% scatter(thours/24,data,20,'sr')
% hold on

fittedValues=model(xmulti',thours,b0);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
% disp('mouse closed Square')

f=[fittedValues,fittedValuesPMN];
 

end



