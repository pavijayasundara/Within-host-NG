%estimating e,d, and p .
%With r3 of changed value of 0.34 and using death data to estimate d1, c and p (Fitting to both B and Bs populations).
%assuming the neutrophil population remains constant
%close all
clear
initial= [0.1;0.1;0.1]; % initial guesses
shade = 0.2;

 
t=[0
45.71202532
91.85126582
135];
 
thours=t/60;
 
data=[5000000
1784869.977
484633.5698
319148.9362
];
data=log10(data)
lb=[0,0,0];
ub=[inf,inf,inf];
 
[fit,erro]=lsqcurvefit(@modelPMN,initial,thours,data,lb,ub)

subplot(1,3,3)
markersize=20;
RGB=[255,140,0]./255;
scatter(thours,data,markersize,RGB,'filled')
hold on
 
fittedValues=modelPMN(fit',thours);
linewidth=1.5;
    
plot(thours,fittedValues,'b','LineWidth',linewidth)
hold on
 
changedParaValues=modelPMN([2.586;3.135;0.25],thours);
plot(thours,changedParaValues,'k--','LineWidth',linewidth)
%%plotting uncertainty Range
uncertaintyLower=modelPMN([2.93;0.61;0.022],thours);
uncertaintyUpper=modelPMN([1.94;0.87;0.0323],thours);
ciplot(uncertaintyLower,uncertaintyUpper,thours,'b',shade)

fontSize=16;
ratio=[1 1 1];
pbaspect(ratio)
xo = 0.12;
yo = 0.12;
xl = [0 2.6];
yl = [5.5 6.73];
xlim(xl);
ylim(yl);

xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(c)'},'FontName','Arial','FontSize',fontSize); %text(0.03,1.18,'(c)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontName','Arial','FontSize',fontSize)
hold on
afn = 'Arial';
lfs = 16;
lfn = 'Arial';
 
legend({'data','least squares fit',['estimates from model' newline 'fit to generated data']},...
    'FontSize',lfs,'FontName',lfn,'Box','off',...
   'Position',[0.789034175326024 0.526161615547005 0.225185179600009 0.155555551140397])
xlabel('time (hours)','FontSize', fontSize,'FontName',lfn)
ylabel('log NG','FontSize', fontSize,'FontName',lfn)
xlim([0 2.26])
%changing the font size of tick labels
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)

resnorm2=sum((changedParaValues-data).^2)


 
function output= modelPMN(parameters,thours)
    b0=[5*10^6;0];
    options = odeset('AbsTol',1e-7,'RelTol',1e-7);
    [time,values] = ode45(@Equations,thours,b0,options);
function s=Equations(t,y)
    s= zeros(2,1);
    r1=0.489;%replication rate  of unattached bacteria
    r3=0.34;%replication rate of NG within PMN
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    k3=8;%carrying capacity of NG within neutrophil 
    N=5*10^6;
       
    s(1)=(r1*y(1))*(1-(y(1)/k))-parameters(1)*N*y(1)/(parameters(2)*N+y(1))...
       ;%rate of change of unattached bacteria
    s(2)=(parameters(3)*parameters(1)*N*y(1)/(parameters(2)*N+y(1)))*(1-(y(2)/(N*k3)))+...
        r3*y(2)*(1-(y(2)/(N*k3)));%NG surviving within PMN
    
end
output=values(:,2)+values(:,1);
output=log10(output);
end
