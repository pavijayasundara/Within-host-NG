function f=mouseOPenTrianglecheckingPMNcurve2()
% close all
% clear


 initial=[   0.000335681879928
   0.000758132655038
   0.000000001944845
   0.101992167755589
   0.190610570711178

];


% initial=[0.0002950072145447
%    0.000513912598109
%    0.000000001463476
%    0.105715549731527
%    0.14441105609968818];

thours=(1:9)'.*24';
 
data=[3.288981289;4.875259875;4.613305613;5.675675676;5.995841996;6.607068607;4.88981289;5;5.180873181];


lb=[10^-5,10^-5,1*10^-12,0.05,0.05];
ub=[10^-3,10^-3,1*10^-6,0.3,0.8];
n0=0.01*0.21857498*42500/(1-(0.01*0.21857498));
b0=[10^3.288981289,0,0,n0,0];
b02=[10^3.288981289,0,0,n0,0,0,0,0,0]';
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
%   nruns=1000;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%    'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',2600);
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

