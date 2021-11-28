function f=mousePluscheckingPMNcurve2()
% close all
% clear
initial=[ 
   0.000015695793438
   0.000031352071264
   0.000000024103210
   0.106314543343397
   0.109817308934406
];

thours=(1:9)'.*24';
 
data=[4.38045738;3.929313929;5.108108108;2.925155925;2.343035343;3.856548857;6.316008316;5.413721414;4.831600832];
PMNdata=[0.232166297;0.263245696;0.29008853;0.109263115;0.145014228;1.281501718;27.80351444;28.05707916;10^-1];%adjusted PMN data per 100 cells
PMNdata=log10(PMNdata);

% lb=[0,0.08,1*10^-12,01*10^-11,10^-8,0.09,10^-3];
% ub=[0.5,0.8,1*10^-5,1*10^-3,10^-4,0.4,0.1];
 
lb=[10^-8,10^-8,1*10^-13,1*10^-4,0.05];
ub=[10^-3,0.5,1*10^-4,0.5,0.8];
%options=optimset('MaxIter',10000);

    n0=0.01*0.232166297*41665/(1-(0.01*0.232166297));
    b0=[10^4.38045738,0,n0];
    b02=[10^4.38045738,0,n0,0,0,0,0,0,0]';
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
toc
% nruns=50;
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

%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
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
 
 fittedValues=model(xmulti',thours,b0);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')
disp('mouse Plus')

f=[fittedValues,fittedValuesPMN];
 

end
