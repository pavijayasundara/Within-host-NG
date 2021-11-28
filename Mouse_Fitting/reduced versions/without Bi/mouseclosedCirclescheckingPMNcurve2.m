function f=mouseclosedCirclescheckingPMNcurve2()
% close all
% clear


%   initial= [   0.005000000017092
%    0.011191074877795
%    0.000000000046920
%    0.102175003812119
%    0.050051390110177
%   ];
initial=[     0.000154770965098
   0.000014343767008
   0.000000000565521
   0.118624983546830
   0.000100040810523
];
thours=(1:9)'.*24';
 
data=[5.53014553;5.617463617;3.318087318;1.440748441;2.823284823;3.507276507;...
    3.812889813;5.108108108;6.417879418];


lb=[10^-6,10^-6,10^-11,0.001,10^-4];
ub=[0.01,0.03,10^-5,0.5,0.5];
% lb=[0.01,0.01,10^-14,0,0.3];
% ub=[0.1,0.1,10^-4,1,2];

n0=0.01*8.438520438*50010/(1-(0.01*8.438520438));
b0=[10^5.53014553,0,0,n0];
b02=[10^5.53014553,0,0,n0,0,0,0,0,0]';
x=[thours,data,b02];
[xmulti,errormulti]=fmincon(@(parameters)ssq2(parameters,x),initial,[],[],[],[],lb,ub,[])
% tic
%  
% nruns=500;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq2(parameters,x),'x0',initial,....
%     'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',2500);
% [xmulti,errormulti]=run(ms,problem,nruns);
% toc
fprintf('\n')
fprintf('\n')
 disp('mouse closed Circles')
 xmulti
errormulti



%getting PMN output
fittedValuesPMN=model2(xmulti',thours,b0);
fittedValuesPMN=log10((fittedValuesPMN./(fittedValuesPMN+50010))*100);
% figure
% scatter(1:9,PMNdata,20,'ob','MarkerFaceColor','b')
% hold on
% plot(1:9,fittedValuesPMN,'m')
% legend('data','fit')
% ylabel('log PMN')
% xlabel('time(days)')
% 
figure
scatter(thours/24,data,20,'or','MarkerFaceColor','r')
hold on
 
fittedValues=model(xmulti',thours,b0);
plot(thours/24,fittedValues,'g')
legend('data','fit')
ylabel('log NG')
xlabel('time(days)')

f=[fittedValues,fittedValuesPMN];
end

