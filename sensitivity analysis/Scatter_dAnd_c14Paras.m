%%%plots the initialy found relationship between d and c. 
%load data from C:\Users\pavi9\OneDrive - UNSW\PhD\gonororheaModel\model\sensitivity\Correct Para ranges\withRest_dcp\14Paras\100000samples
%this shows there is a relationship between d and c described by d ~ b × c + a was fitted, 
%the estimated slope with 95% confidence bounds was b = 0.6624 (0.6461, 0.6787) 
%and the intercept with 95% confidence bounds was a = 2.027 (1.939, 2.114). 
%relationship is plotted between 'clearedparaValues' d and c

close all
markersize=50;
fontSize=16;
lfs = 16;
lfn = 'Arial';

figure
set(gcf, 'Position',  [200, 200, 700, 400])

%axes('Position',[0.3 0.187086092715232 0.368421052631579 0.695364238410596]);

h1=scatter(paraValuesabove60(:,10),paraValuesabove60(:,9),'b');
hold on
h2=scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled');
hold on 
RGB=[255,140,0]./255;
h4=scatter(3.136,2.589,markersize,RGB,'filled','s');
hold on
d1=clearedParameterValues(:,9);%clearedParameterValues engulfment rate
c1=clearedParameterValues(:,10);%clearedParameterValues ratio dependent constant
X = [ones(length(c1),1) c1];
b = X\d1
yCalc = X*b;
%[b,stats]  = regress(d1,X,0.01)
h3=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
hold on 
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
hold on
c2=0:0.01:6.3;
% a_99_CI_lower2=0.3104*c2+1.224;
% a_99_CI_upper2=0.3314*c2+1.3;
a_99_CI_lower2=0.207*c2+0.816;
a_99_CI_upper2=0.4971*c2+1.95;
h4=ciplot(a_99_CI_lower2,a_99_CI_upper2,c2,'k',0.4)  ;

xlabel('c','FontSize', fontSize,'FontName',lfn)
ylabel('d','FontSize', fontSize,'FontName',lfn)

ratio=[2 1 1];
pbaspect(ratio)
set(gca,'box','off')
legend([h1,h2,h3,h4],{'LHS samples','c,d values of {\itin vitro} uncertanity range',...
    'regression line of the form d=b\timesc+a','95% CI around regression fit'},'Box','off','Interpreter','tex',...
'Position',[0.575815853204018 0.35780338342197 0.310370362246477 0.162058367157861])