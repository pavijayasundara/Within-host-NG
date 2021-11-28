function f=mouseOPenTrianglecheckingPMNcurve2()
% close all
% clear
initial=[   0.000075652818928
   0.000010000066911
   0.000000003594423
   0.129983023605955
   0.108747122217724
];

thours=(1:9)'.*24';
 
data=[3.288981289;4.875259875;4.613305613;5.675675676;5.995841996;6.607068607;4.88981289;5;5.180873181];


lb=[10^-5,5*10^-6,1*10^-12,0.01,0.05];
ub=[10^-3,10^-3,1*10^-6,0.3,0.8];
n0=0.01*0.21857498*42500/(1-(0.01*0.21857498));
b0=[10^3.288981289,0,n0];
b02=[10^3.288981289,0,n0,0,0,0,0,0,0]';
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=500;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%    'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',1500);
% [xmulti,errormulti]=run(ms,problem,nruns);
%  toc
 
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+41665))*100);

% figure
% scatter(thours/24,data,20,'^r')
% hold on
 
 fittedValues=model(xmulti',thours,b0);
% plot(thours/24,fittedValues,'g')
% legend('data','fit')
% ylabel('log NG')
% xlabel('time(days)')

disp('Open Triangles')
 xmulti
 errormulti
f=[fittedValues,fittedValuesPMN];

end

