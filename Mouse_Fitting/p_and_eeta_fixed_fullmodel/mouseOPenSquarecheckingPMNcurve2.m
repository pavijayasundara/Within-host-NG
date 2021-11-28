function f= mouseOPenSquarecheckingPMNcurve2()
% close all
% clear


thours=(1:9)'.*24' ; 
initial=[   0.000264152636576
   0.000436604262450
   0.000000000499178
   0.053489377994831
   0.000999350080685
];
 
% initial=[    0.004227494854058
%    0.007044969701125
%    0.000000000031187
%    0.042372600705623
%    0.000999997743138
% ];

data=[4.336798337;3.827442827;0.029106029;0;0;0.029106029;0.014553015;0;0.014553015];%in log

lb=[10^-5,10^-5,10^-13,0,10^-8];
ub=[10^-1,10^-1,10^-5,1,10^-3];
 
n0=0.01*0.44681061*42083/(1-(0.01*0.44681061));
b0=[10^4.336798337,0,0,n0,0];
b02=[10^4.336798337,0,0,n0,0,0,0,0,0]';
x=[thours,data,b02];
tic
[xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[])
% nruns=10;
% tic
% options=optimset('MaxIter',10000);
% 
% problem=createOptimProblem('fmincon','objective',@(parameters)ssq(parameters,x),'x0',initial,....
%   'lb',lb,'ub',ub,'options',options);
% 
% ms=MultiStart('UseParallel',true,'Display','iter','MaxTime',2500);
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
% % plot(thours/24,fittedValues,'g')
% % legend('data','fit')
% % ylabel('log NG')
% % xlabel('time(days)')
% xmulti
% errormulti
f=[fittedValues(1:9),fittedValuesPMN];

end
