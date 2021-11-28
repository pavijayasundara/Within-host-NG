 shade = 0.2;
 fontSize=16;
lfs = 16;
lfn = 'Arial';
linewidth=1.5;
markersize=20;
initial= [0.2;0.28]; % initial guesses
 
t=[6.12278276;8.081632653;10.24489796;12.04081633];%since intracellular NG was visible only after 6 hours
thours=[0;2;4;6]; 
data=[53687.80366;230805.4977;636476.4681;902285.7143];
 
data=log10(data);
lb=[0;0];
ub=[inf;inf];
 
[fit,error]=lsqcurvefit(@model,initial,thours,data,lb,ub)
subplot(1,3,2)
RGB=[255,140,0]./255;
h1=scatter(t,data,markersize,RGB,'filled');
hold on
 
fittedValues=model(fit',thours);
h2=plot(t,fittedValues,'b','LineWidth',linewidth);
hold on

fittedValues3=model([0.51,0.273],thours);
fittedValues4=model([0.65,0.36],thours);

h3=ciplot(fittedValues3,fittedValues4,t,'b',shade);
% changedParaValues=model([0.54,0.32],thours);
% plot(thours,changedParaValues,'k')
ratio=[1 1 1];
pbaspect(ratio)
legend([h1,h2,h3],{'data',' fit','uncertainty range'},'FontSize',lfs,'FontName',lfn,'Box','off','Location','southeast')
xl = [6 13];
yl = [4.5 6.01];
xlim(xl);
ylim(yl);

xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')
xo = 0.12;
yo = 0.12;
text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(b)'},'FontName','Arial','FontSize',fontSize); 
 %text(0.03,1.18,'(b)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontName','Arial','FontSize',fontSize)
xlabel('time (hours)','FontSize', fontSize,'FontName',lfn)%     afn = 'Arial';

ylabel('log NG','FontSize', fontSize,'FontName',lfn)
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)

 %print('Figure_2','-djpeg','-r600');
 %print('Figure_2','-dtiff','-r600');

function output= model(parameters,thours)
    b0=[0;53687.80366];
    options = odeset('AbsTol',1e-15,'RelTol',1e-13);
    [time,values] = ode45(@Equations,thours,b0,options);
 
function s=Equations(t,y)
    s= zeros(2,1);
    k=1*10^7;%carrying capacity 
    a2=1/11;
    k2=k/a2;%carrying capacity of epithelial cell
   
     s(1)=-parameters(2)*y(1);%rate of change of unattached bacteria
   s(2)=(1-(y(2)/k2))*(parameters(2)*y(1)+parameters(1)*y(2));%NG within epithelial
    
end
output=values(:,2);
output=log10(output);
end