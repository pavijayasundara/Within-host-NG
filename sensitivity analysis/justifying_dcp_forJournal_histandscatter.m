close all
markersize=50;
fontSize=16;
lfs = 16;
lfn = 'Arial';
% %scatter d,p and c for all that met features
figure('units','normalized','outerposition',[0 0 1 1],'Name','scatter d,p c cleared all para')
axes('Position',[0.3 0.187086092715232 0.368421052631579 0.695364238410596]);
subplot(2,2,4)
h1=scatter(paraValuesabove60(:,10),paraValuesabove60(:,9),'b');
hold on
h2=scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled');
hold on 
RGB=[255,140,0]./255;
h4=scatter(3.135,2.186,markersize,RGB,'filled','s')
hold on
%fitting a regression line
d1=paraValuesabove60(:,9);%clearedParameterValues engulfment rate
 c1=paraValuesabove60(:,10);%clearedParameterValues ratio dependent constant
X = [ones(length(c1),1) c1];
b = X\d1
yCalc = X*b;
%[b,bint,r,rint,stats]  = regress(d1,X,0.01)
h3=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
hold on 
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
hold on
% d_99_CI_lower=0.5877*c1+1.5462;
% d_99_CI_upper=0.7511*c1+2.5205;
% plot(c1,d_99_CI_lower,'-.k');%plotting the 95%Ci bounds
% hold on
% plot(c1,d_99_CI_upper,'-.k');

c2=0:0.01:6.1;
a_99_CI_lower2=0.3054*c2+1.168;
a_99_CI_upper2=0.3548*c2+1.379;
ciplot(a_99_CI_lower2,a_99_CI_upper2,c2,'k',0.4)  



xlabel('c','FontSize', fontSize,'FontName',lfn)
ylabel('d','FontSize', fontSize,'FontName',lfn)
ratio=[2 1 1];
pbaspect(ratio)
set(gca,'box','off')
legend([h1,h2,h3,h4],{'LHS samples','d,c values of optimal estimate',...
    'regression line','point estimate'},'Box','off',...
'Position',[0.575815853204018 0.35780338342197 0.310370362246477 0.162058367157861])


LowerrangeOftheParameters=[1,0,0.01];
UpperrangeOftheParameters=[4.5,6.5,0.5];
labels=["d","c","p"];
parcols=[9,10,11];
lengthSubplot=3;
for j=1:lengthSubplot
       subplot(2,2,j)
       hist(paraValuesabove60(:,parcols(j)))
       range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
       xlim(range)
       set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    ratio=[2 1 1];
pbaspect(ratio)
       xlabel(labels(j),'FontSize', fontSize,'FontName',lfn);
       ylabel('frequency','FontSize', fontSize,'FontName',lfn);
 end
   
annotation('textbox',...
    [0.069814055636896 0.900153609831029 0.0348711566617862 0.0506912442396313],...
    'String','(a)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.522229868228404 0.898617511520737 0.0348711566617862 0.0506912442396313],...
    'String','(b)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.0829912152269407 0.436251920122888 0.0348711566617862 0.0506912442396314],...
    'String','(c)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.524426061493412 0.440860215053764 0.0348711566617862 0.0506912442396314],...
    'String','(d)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');


