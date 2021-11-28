function f=mouseClsoedSquarecheckingPMNcurve2()
% close all
% clear

  initial=[  
    0.000588816788283
   0.000389156591531
   0.000000073985170
   0.122309915016479
   1.300353050887042

];

thours=(1:9)'.*24;
 
data=[3.128898129;4.22037422;3.128898129;
2.444906445;4.089397089;5.326403326;6.024948025;6.527027027;6.716216216];

lb=[10^-6,10^-6,1*10^-13,8*10^-2,1];
ub=[10^-3,0.01,1*10^-4,0.2,1.5];

n0=0.01*0.232166297*10001/(1-(0.01*0.232166297));
b0=[10^3.13,0,0,n0];
b02=[10^3.13,0,0,n0,0,0,0,0,0]';

x=[thours,data,b02];

%[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
nruns=100;
tic
options=optimset('MaxIter',10000);

problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
    'lb',lb,'ub',ub,'options',options);

ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
[xmulti,errormulti]=run(ms,problem,nruns);
 toc
xmulti
errormulti

%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+10001))*100);

figure
scatter(thours/24,data,20,'sr')
hold on
 

 fittedValues=model(xmulti',thours,b0);
plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
% disp('mouse closed Square')

f=[fittedValues,fittedValuesPMN];
 

end



