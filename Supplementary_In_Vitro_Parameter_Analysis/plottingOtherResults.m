markersize=50;
fontSize=16;
lfs = 16;
lfn = 'Arial';
%   figure('Name','cleared outcomes')
%   group2=[clearedOutcomes(:,3),clearedOutcomes(:,2)];
%   boxplot(group2,1:2,'Labels',{'peakTime','clearenceTime'})
%    
%   figure('Name','cleared peak load')
%   boxplot(clearedOutcomes(:,4),'Labels',{'peak NG load'});
%   
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
% % figure('Name','paras above 60 r2,eta,e')
% % subplot(1,2,1)
% % boxplot(paraValuesabove60(:,[1 3]),1:2,...
% %     'Labels',{'r2','e'})
% % subplot(1,2,2)
% % boxplot(paraValuesabove60(:,2),'Labels',{'eta'})
% 
% % figure('Name','cleared Para r2,eta,e')
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
boxplot(clearedParameterValues(:,1),'Labels',{'$$r_2$$'})
bp = gca;
bp.XAxis.TickLabelInterpreter = 'latex';
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
%plotting the point estimate of r2 and e and the uncertainity ranges
hold on
h1=scatter(1,0.533,'r','filled');
hold on
yneg = 0.533-0.51;
ypos = 0.65-0.533;
h2=errorbar(1,0.533,yneg,ypos);
h2.Color='r';
ratio=[1 1 1];
pbaspect(ratio)
ylim([0.01 0.75])
set(gca,'box','off')
xlabel('parameter','FontSize', fontSize,'FontName',lfn)
ylabel('parameter range','FontSize', fontSize,'FontName',lfn)
annotation('textbox',...
    [0.0992592592592593 0.853333333333333 0.0422222222222222 0.0488888888888888],...
    'String',{'(a)'},...
    'LineStyle','none',...
    'FontSize',16,...
    'FontName','Arial',...
    'FitBoxToText','off');
hold off

subplot(1,2,2)

boxplot(clearedParameterValues(:,[2 3]),1:2,'Labels',{'e','$$\eta$$'})
bp = gca;
bp.XAxis.TickLabelInterpreter = 'latex';
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
hold on
scatter(1,0.65,'r','filled');
hold on
yneg = 0.65-0.44;
ypos = 1.26-0.65;
h3=errorbar(1,0.65,yneg,ypos);
h3.Color='r';

h1=scatter(2,0.28,'r','filled');
hold on
yneg = 0.28-0.27;
ypos = 0.36-0.28;
h4=errorbar(2,0.28,yneg,ypos);
h4.Color='r';
hold on

ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')
annotation('textbox',...
    [0.545185185185184 0.842962962962962 0.0422222222222223 0.0488888888888888],...
    'String','(b)',...
    'LineStyle','none',...
    'FontSize',16,...
    'FontName','Arial',...
    'FitBoxToText','off');

xlabel('parameter','FontSize', fontSize,'FontName',lfn)
ylabel('parameter range','FontSize', fontSize,'FontName',lfn)
legend([h1,h2],{'point estimate','uncertainity ranges'},'Box','off','Position',[0.726172843104527 0.751604940479185 0.158518514920164 0.0807407385331614])
ylim([0.01 1.5])
% subplot(2,2,3)
% boxplot(clearedParameterValues(:,[4 5]),1:2,...
%     'Labels',{'d','c'})
% subplot(2,2,4)
% boxplot(clearedParameterValues(:,6),'Labels',{'p'})
% %    
% % % to get d1,c and p of the cleared and cleared but not met features and
% % % uncleared infection
% % 
% % 
% % %histograms of the parameter values
% LowerrangeOftheParameters=[0.03,0.04,0.1,1.9,0.61,0.02];
% UpperrangeOftheParameters=[2,1.3,1,3,0.86,0.03];
% labels=['r2','e',"eta","d","c","p"];
% 
% figure('Name','Hist 1 cleared para')
% lengthSubplot=6;
% for j=1:lengthSubplot
%        subplot(2,3,j)
%        hist(clearedParameterValues(:,j))
% %        nticks=5;
%         range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
%       
% %        diff=range(2)-range(1);
% %        increment=diff/nticks;
%        xlim(range)
%        xlabel(labels(j));
%  end
%    
% %  
% %scatter r2,eta and e for all that met features
% figure('Name','scatter r2,eta e cleared all para')
% subplot(2,2,1)
% scatter(clearedParameterValues(:,1),clearedParameterValues(:,3),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled')
% % hold on 
% RGB=[255,140,0]./255;
%  scatter(0.533,0.4,markersize,RGB,'filled','s')
% xlabel('r2')
% ylabel('eta')
% 
% subplot(2,2,2)
% scatter(clearedParameterValues(:,2),clearedParameterValues(:,1),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% % hold on 
%  RGB=[255,140,0]./255;
% scatter(0.65,0.533,markersize,RGB,'filled','s')
% hold on
% %fitting a regression line between r2 and e
% r2=clearedParameterValues(:,1);%clearedParameterValues engulfment rate
% e=clearedParameterValues(:,2);%clearedParameterValues ratio dependent constant
% % X = [ones(length(r2),1) r2];
% % b = X\e
% % yCalc = X*b;
% % %[b,bint,r,rint,stats]  = regress(d1,X,0.01);
% % h4=plot(r2,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
% hold on 
% b2= e\r2%plotting without the intercept, y=mx type function
% yCalc2= b2*e;
% h4=plot(e,yCalc2,'k','linewidth',2);
% %legend([h2],{'regression line of the form d=c*b'})
% xlabel('e')
% ylabel('r2')
% 
% subplot(2,2,3)
% h1=scatter(clearedParameterValues(:,3),clearedParameterValues(:,2),'b');
% hold on 
% RGB=[255,140,0]./255;
% h3=scatter(0.4,0.65,markersize,RGB,'filled','s');
% legend([h1,h3,h4],{'samples',...
%     'current model value','regrssion line of the form e=b*r2'},'Box','off')
% xlabel('eta')
% ylabel('e')





% % %scatter d,c and p for above 60
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


%histogram for the clearence time above 60
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

%%%--------------------------------------------------------------------------
%%%analysig the parametrs that cleared but did not meet the features
% markersize=50;
% 
%   figure('Name','cleared outcomesNotmetFeatures')
%   group2=[clearedOutcomesNotmetFeatures(:,3),clearedOutcomesNotmetFeatures(:,2)];
%   boxplot(group2,1:2,'Labels',{'peakTime','clearenceTime'})
%    
%   figure('Name','cleared outcomesNotmetFeatures peak load')
%   boxplot(clearedOutcomesNotmetFeatures(:,4),'Labels',{'peak NG load'});
  
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
% % figure('Name','paras above 60 r2,eta,e')
% % subplot(1,2,1)
% % boxplot(paraValuesabove60(:,[1 3]),1:2,...
% %     'Labels',{'r2','e'})
% % subplot(1,2,2)
% % boxplot(paraValuesabove60(:,2),'Labels',{'eta'})
% 
% figure('Name','cleared but did not meet features Para r2,eta,e')
% subplot(1,2,1)
% boxplot(clearedButNotmetFeatures(:,[1 3]),1:2,...
%     'Labels',{'r2','e'})
% subplot(1,2,2)
% boxplot(clearedButNotmetFeatures(:,2),'Labels',{'eta'})
%    
% 
% %histograms of the parameter values
% LowerrangeOftheParameters=[0.05,0.1,0.04];
% UpperrangeOftheParameters=[2,1,1.3];
% labels=['r2','eta',"e"];
% 
% figure('Name','Hist cleared but not met features')
% lengthSubplot=3;
% for j=1:lengthSubplot
%        subplot(2,2,j)
%        hist(clearedButNotmetFeatures(:,j))
% %        nticks=5;
%         range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
%       
% %        diff=range(2)-range(1);
% %        increment=diff/nticks;
%        xlim(range)
%        xlabel(labels(j));
%  end
%    
%  
% %scatter r2,eta and e for all that met features
% figure('Name','scatter r2,eta e cleared but not met features para')
% subplot(2,2,1)
% scatter(clearedButNotmetFeatures(:,1),clearedButNotmetFeatures(:,2),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled')
% % hold on 
% RGB=[255,140,0]./255;
%  scatter(0.533,0.4,markersize,RGB,'filled','s')
% % hold on
% % %fitting a regression line
% % d1=clearedParameterValues(:,9);%clearedParameterValues engulfment rate
% % c1=clearedParameterValues(:,10);%clearedParameterValues ratio dependent constant
% % X = [ones(length(c1),1) c1];
% % b = X\d1
% % yCalc = X*b;
% % %[b,bint,r,rint,stats]  = regress(d1,X,0.01);
% % h4=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
% % hold on 
% % b2= c1\d1%plotting without the intercept, y=mx type function
% % yCalc2= b2*c1;
% % h4=plot(c1,yCalc2,'k','linewidth',2);
% % legend([h2],{'regression line of the form d=c*b'})
% 
% xlabel('r2')
% ylabel('eta')
% 
% subplot(2,2,2)
% scatter(clearedButNotmetFeatures(:,1),clearedButNotmetFeatures(:,3),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% % hold on 
%  RGB=[255,140,0]./255;
% scatter(0.533,0.65,markersize,RGB,'filled','s')
% xlabel('r2')
% ylabel('e')
% 
% subplot(2,2,3)
% h1=scatter(clearedButNotmetFeatures(:,2),clearedButNotmetFeatures(:,3),'b');
% hold on 
% RGB=[255,140,0]./255;
% h3=scatter(0.4,0.65,markersize,RGB,'filled','s');
% legend([h1,h3],{'samples',...
%     'current model value'},'Box','off')
% xlabel('eta')
% ylabel('e')
% 
% 
% %scatter r2,eta and e for all that met features
% figure('Name','scatter r2,eta e cleared all para')
% subplot(2,2,1)
% scatter(clearedButNotmetFeatures(:,1),clearedButNotmetFeatures(:,2),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled')
% % hold on 
% RGB=[255,140,0]./255;
%  scatter(0.533,0.4,markersize,RGB,'filled','s')
% % hold on
% % %fitting a regression line
% % d1=clearedParameterValues(:,9);%clearedParameterValues engulfment rate
% % c1=clearedParameterValues(:,10);%clearedParameterValues ratio dependent constant
% % X = [ones(length(c1),1) c1];
% % b = X\d1
% % yCalc = X*b;
% % %[b,bint,r,rint,stats]  = regress(d1,X,0.01);
% % h4=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
% % hold on 
% % b2= c1\d1%plotting without the intercept, y=mx type function
% % yCalc2= b2*c1;
% % h4=plot(c1,yCalc2,'k','linewidth',2);
% % legend([h2],{'regression line of the form d=c*b'})
% 
% xlabel('r2')
% ylabel('eta')
% 
% subplot(2,2,2)
% scatter(clearedButNotmetFeatures(:,1),clearedButNotmetFeatures(:,3),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% % hold on 
%  RGB=[255,140,0]./255;
% scatter(0.533,0.65,markersize,RGB,'filled','s')
% xlabel('r2')
% ylabel('e')
% 
% subplot(2,2,3)
% h1=scatter(clearedButNotmetFeatures(:,2),clearedButNotmetFeatures(:,3),'b');
% hold on 
% RGB=[255,140,0]./255;
% h3=scatter(0.4,0.65,markersize,RGB,'filled','s');
% legend([h1,h3],{'samples',...
%     'current model value'},'Box','off')
% xlabel('eta')
% ylabel('e')

%%%----------------------
%%%%samples that did not clear infection
%   figure('Name','cleared outcomes')
%   group2=[clearedOutcomes(:,3),clearedOutcomes(:,2)];
%   boxplot(group2,1:2,'Labels',{'peakTime','clearenceTime'})
%    
%   figure('Name','cleared peak load')
%   boxplot(clearedOutcomes(:,4),'Labels',{'peak NG load'});
%   
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
% % figure('Name','paras above 60 r2,eta,e')
% % subplot(1,2,1)
% % boxplot(paraValuesabove60(:,[1 3]),1:2,...
% %     'Labels',{'r2','e'})
% % subplot(1,2,2)
% % boxplot(paraValuesabove60(:,2),'Labels',{'eta'})
% 
% figure('Name','cleared Para r2,eta,e')
% subplot(1,2,1)
% boxplot(UnclearedParameterValues(:,[1 3]),1:2,...
%     'Labels',{'r2','e'})
% subplot(1,2,2)
% boxplot(UnclearedParameterValues(:,2),'Labels',{'eta'})
%    
% % to get d1,c and p of the cleared and cleared but not met features and
% % uncleared infection
% 
% 
% %histograms of the parameter values
% LowerrangeOftheParameters=[0.05,0.1,0.04];
% UpperrangeOftheParameters=[2,1,1.3];
% labels=['r2','eta',"e"];
% 
% figure('Name','Hist 1 cleared para')
% lengthSubplot=3;
% for j=1:lengthSubplot
%        subplot(2,2,j)
%        hist(UnclearedParameterValues(:,j))
% %        nticks=5;
%         range=[LowerrangeOftheParameters(j) UpperrangeOftheParameters(j)];
%       
% %        diff=range(2)-range(1);
% %        increment=diff/nticks;
%        xlim(range)
%        xlabel(labels(j));
%  end
%    
%  
% %scatter r2,eta and e for all that met features
% figure('Name','scatter r2,eta e cleared all para')
% subplot(2,2,1)
% scatter(UnclearedParameterValues(:,1),UnclearedParameterValues(:,2),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,2),paraEstimates_dpcfrom_invitro(:,1),'r^','filled')
% % hold on 
% RGB=[255,140,0]./255;
%  scatter(0.533,0.4,markersize,RGB,'filled','s')
% % hold on
% % %fitting a regression line
% % d1=clearedParameterValues(:,9);%clearedParameterValues engulfment rate
% % c1=clearedParameterValues(:,10);%clearedParameterValues ratio dependent constant
% % X = [ones(length(c1),1) c1];
% % b = X\d1
% % yCalc = X*b;
% % %[b,bint,r,rint,stats]  = regress(d1,X,0.01);
% % h4=plot(c1,yCalc,'k','linewidth',2);%plotting with the intercept, y=mx+c type function
% % hold on 
% % b2= c1\d1%plotting without the intercept, y=mx type function
% % yCalc2= b2*c1;
% % h4=plot(c1,yCalc2,'k','linewidth',2);
% % legend([h2],{'regression line of the form d=c*b'})
% 
% xlabel('r2')
% ylabel('eta')
% 
% subplot(2,2,2)
% scatter(UnclearedParameterValues(:,1),UnclearedParameterValues(:,3),'b')
% hold on
% % scatter(paraEstimates_dpcfrom_invitro(:,1),paraEstimates_dpcfrom_invitro(:,3),'r^','filled')
% % hold on 
%  RGB=[255,140,0]./255;
% scatter(0.533,0.65,markersize,RGB,'filled','s')
% xlabel('r2')
% ylabel('e')
% 
% subplot(2,2,3)
% h1=scatter(UnclearedParameterValues(:,2),UnclearedParameterValues(:,3),'b');
% hold on 
% RGB=[255,140,0]./255;
% h3=scatter(0.4,0.65,markersize,RGB,'filled','s');
% legend([h1,h3],{'samples',...
%     'current model value'},'Box','off')
% xlabel('eta')
% ylabel('e')
% 
