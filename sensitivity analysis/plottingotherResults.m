markersize=50;
fontSize=16;
lfs = 16;
lfn = 'Arial';
close all
%    figure('Name','cleared d,c,p')
%    subplot(1,2,1)
%    boxplot(clearedParameterValues(:,[9 10]),1:2,'Labels',{'d','c'})
%    subplot(1,2,2)
%    boxplot(clearedParameterValues(:,11),'Labels',{'p'})
%   
%   figure('Name','cleared outcomes')
%   group2=[clearedOutcomes(:,3),clearedOutcomes(:,2)];
%   boxplot(group2,1:2,'Labels',{'peakTime','clearenceTime'})
%    
%   figure('Name','cleared peak load')
%   boxplot(clearedOutcomes(:,4),'Labels',{'peak NG load'});
%   
% %    figure('Name','para vals above 60')
% %    boxplot(paraValuesabove60(:,[1 2 3 4 5 6 8 9 10 11 12 13 16]),1:13,...
% %        'Labels',{'r1','r2','r3','a1','a2','e','eta','d1','c','p','d2','d3','k2'})
% %    figure('Name','Nmax,k -paras above 60')
% %    boxplot(paraValuesabove60(:,[14 15]),1:2,...
% %        'Labels',{'Nmax','k'})
% %    figure('Name','mu- paras above 60')
% %    boxplot(paraValuesabove60(:,7),...
% %        'Labels',{'mu'})
%    
% figure('Name','paras above 60 d,c,p')
% subplot(1,2,1)
% boxplot(paraValuesabove60(:,[9 10]),1:2,...
%     'Labels',{'d','c'})
% subplot(1,2,2)
% boxplot(paraValuesabove60(:,11),'Labels',{'p'})
%    
% to get d1,c and p of the cleared and cleared but not met features and
% uncleared infection


%%%histograms of the parameter values
LowerrangeOftheParameters=[0.374,0.27,0.31,0.3,6,0.685,2.82*10^-13,0.14,1.295,0.001,0.01,5*10^-4,0.02,4];
UpperrangeOftheParameters=[0.53,1.06,0.41,0.43,12,1.3,8.756*10^-13,0.353,3.61,6.272,0.5,2*10^-3,0.042,16];
   %labels=['r1','r2','r3','a1','a2','e','mu','eta'];
labels=["r1","r2","r3","a1","a2","e","mu","eta","d","c","p","d2","d3","k2"];
   figure('Name','Hist 1 cleared para')
   lengthSubplot=6;
   for j=1:lengthSubplot
       subplot(3,2,j)
       hist(clearedParameterValues(:,j))
%        nticks=5;
        range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
      
%        diff=range(2)-range(1);
%        increment=diff/nticks;
       xlim(range)
       xlabel(labels(j));
   end
   
   figure('Name','Hist 2 cleared para')
   lengthSubplot=14;
   for j=7:lengthSubplot
       subplot(4,2,j-6)
       hist(clearedParameterValues(:,j))
%        nticks=5;
        range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
      
%        diff=range(2)-range(1);
%        increment=diff/nticks;
       xlim(range)
       xlabel(labels(j));
   end

%scatter d,p and c for all that met features
figure('units','normalized','outerposition',[0 0 1 1],'Name','scatter d,p c cleared all para')
axes('Position',[0.3 0.187086092715232 0.368421052631579 0.695364238410596]);
subplot(2,2,1)
h1=scatter(clearedParameterValues(:,10),clearedParameterValues(:,9),'b');
% hold on
% h2=scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled');
hold on 
% RGB=[255,140,0]./255;
% scatter(4.86,6.505,markersize,RGB,'filled','s')
hold on
%fitting a regression line
d1=clearedParameterValues(:,9);%clearedParameterValues engulfment rate
c1=clearedParameterValues(:,10);%clearedParameterValues ratio dependent constant
X = [ones(length(c1),1) c1];
b = X\d1
yCalc = X*b;
%[b,bint,r,rint,stats]  = regress(d1,X,0.01);
h3=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
% hold on 
% b2= c1\d1%plotting without the intercept, y=mx type function
% yCalc2= b2*c1;
% h4=plot(c1,yCalc2,'k','linewidth',2);
% legend([h2],{'regression line of the form d=c*b'})
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
xlabel('c','FontSize', fontSize,'FontName',lfn)
ylabel('d','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')
% legend([h1,h2,h3],{'LHS samples','uncertanity range around optimal estimates',...
%     'regression line of the form d=b\timesc+a'},'Box','off',...
% 'Position',[0.380295002924749 0.201775050507122 0.310370362246478 0.132718890301093])
subplot(2,2,2)
scatter(clearedParameterValues(:,9),clearedParameterValues(:,11),'b')
hold on
% scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% hold on 
RGB=[255,140,0]./255;
scatter(6.505,0.064,markersize,RGB,'filled','s')
xlabel('d')
ylabel('p')

subplot(2,2,3)
h1=scatter(clearedParameterValues(:,11),clearedParameterValues(:,10),'b')
hold on
% h2=scatter(paraEstimates_dpcfrom_invitro(:,3),paraEstimates_dpcfrom_invitro(:,2),'r^','filled')
% hold on 
RGB=[255,140,0]./255;
h3=scatter(0.064,4.86,markersize,RGB,'filled','s')
% legend([h1,h2,h3,h4],{'samples','model fit to in vitro study',...
%     'manually adjusted (current model value)','regression line of the form d=b*c+a'},'Box','off')
xlabel('p')
ylabel('c')





% %scatter d,c and p for above 60
% figure('Name','scatter dpc above 60')
% subplot(2,2,1)
% h1=scatter(paraValuesabove60(:,10),paraValuesabove60(:,9),'b');
% hold on
% h2=scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled');
% hold on 
% RGB=[255,140,0]./255;
% h3=scatter(4.86,6.505,markersize,RGB,'filled','s');
% %fitting a regression line
% d2=paraValuesabove60(:,9);%clearedParameterValues engulfment rate
% c2=paraValuesabove60(:,10);%clearedParameterValues ratio dependent constant
% X = [ones(length(c2),1) c2];
% b = X\d2
% yCalc = X*b;
% h4=plot(c2,yCalc,'y','linewidth',2);%plotting with the intercept, y=mx+c type function
% % hold on 
% % b2= d2\c2%plotting without the intercept, y=mx type function
% % yCalc2= b2*d2;
% % h2=plot(d2,yCalc2,'k','linewidth',2);
% 
% xlabel('c')
% ylabel('d')
% 
% subplot(2,2,2)
% scatter(paraValuesabove60(:,9),paraValuesabove60(:,11),'b')
% hold on
% scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% hold on 
% RGB=[255,140,0]./255;
% scatter(6.505,0.064,markersize,RGB,'filled','s')
% xlabel('d')
% ylabel('p')
% 
% subplot(2,2,3)
% scatter(paraValuesabove60(:,11),paraValuesabove60(:,10),'b')
% hold on
% scatter(paraEstimates_dpcfrom_invitro(:,3),paraEstimates_dpcfrom_invitro(:,2),'r^','filled')
% hold on 
% RGB=[255,140,0]./255;
% scatter(0.064,4.86,markersize,RGB,'filled','s')
% legend([h1,h2,h3,h4],{'samples','model fit to in vitro study',...
%     'manually adjusted (current model value)','regression line of the form d=b*c+a'},'Box','off')
% xlabel('p')
% ylabel('c')
% 
% 
% %histogram for the clearence time above 60
%    figure('Name','Hist 1 above 60')
%    lengthSubplot=6;
%    for j=1:lengthSubplot
%        subplot(3,2,j)
%        hist(paraValuesabove60(:,j))
% 
%        range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
%       
% 
%        xlim(range)
%        xlabel(labels(j));
%    end
%    
%    figure('Name','Hist2 above 60')
%    lengthSubplot=14;
%    for j=7:lengthSubplot
%        subplot(4,2,j-6)
%        hist(paraValuesabove60(:,j))
%        range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
%        xlim(range)
%        xlabel(labels(j));
%    end
%    
%    
%  % correlation plots fr all variables
%    figure('Name','Correlation all cleared 1-7')
%    set1=clearedParameterValues(:,1:7);
%    corrplot(set1,'varNames',labels(1:7),'type','Spearman')
%    figure('Name','Correlation all cleared 7-8')
%    set2=clearedParameterValues(:,8:14);
%    corrplot(set2,'varNames',labels(8:14),'type','Spearman')
% 
%    figure('Name','Correlation all cleared')
%    corrplot(clearedParameterValues,'varNames',labels,'type','Spearman')
% 
%  %correlation plots fr all variables above 60
%    figure('Name','Correlation above 60 1-7')
%    set1=paraValuesabove60(:,1:7);
%    corrplot(set1,'varNames',labels(1:7),'type','Spearman')
%    figure('Name','Correlation above 60 1-7')
%    set2=paraValuesabove60(:,8:14);
%    corrplot(set2,'varNames',labels(8:14),'type','Spearman')
% 
%    figure('Name','Correlation all above 60')
%    corrplot(paraValuesabove60,'varNames',labels,'type','Spearman')
% figure('Name','doverc')
% dovecAll=clearedParameterValues(:,9)./clearedParameterValues(:,10);
% dovercAbove60=paraValuesabove60(:,9)./paraValuesabove60(:,10);
% subplot(1,2,1)
% boxplot(dovecAll,'Labels',{'d/c all samples'},'whisker',2)
% ylim([0 20])
% subplot(1,2,2)
% boxplot(dovercAbove60,'Labels',{'d/c above 60 samples'})
% ylim([0 20])