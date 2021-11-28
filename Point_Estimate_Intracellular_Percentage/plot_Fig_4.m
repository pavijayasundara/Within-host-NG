%figure 4 b and c subplots

close all
clear

lfs = 16;
lfn = 'Arial';
linewidth=1.8;
xo = 0.1;
yo = 0.1;

%initial conditions for ODE
b=1000;%initial size of the unattached bacteria
b_e=0;%initial size of the attached bacteria to endothelial
b_n=0;
b_i=0;
b_a=0;
n=10^-8;%initial neutrophils

time=960;%time in hours
options = odeset('AbsTol',1e-13,'RelTol',1e-11);
[t,y]=ode45(@(t,y)Equations(t,y),0:time,[b,b_n,b_i,n,b_a],options);

total_NG=y(:,1)+y(:,2)+y(:,3)+y(:,5);

%total NG 1-6 days
plottingTime=2*24.5;
tot_NGoverTime=y(1:plottingTime,1)+y(1:plottingTime,2)+y(1:plottingTime,3)+y(1:plottingTime,5);

figure('units','normalized','outerposition',[0 0 1 1])

%percentage figure 3 panel

subplot(1,3,3)
percentage2=(y(1:plottingTime,1)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
plot(t(1:plottingTime),percentage2,'color',[255,160,122]./255,'LineWidth',linewidth)
hold on
percentage2=(y(1:plottingTime,5)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
plot(t(1:plottingTime),percentage2,'-.','color',[250,128,114]./255,'LineWidth',linewidth)
hold on
percentage2=(y(1:plottingTime,3)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
plot(t(1:plottingTime),percentage2,'--','color',[205,92,92]./255,'LineWidth',linewidth)
hold on
percentage2=(y(1:plottingTime,2)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
plot(t(1:plottingTime),percentage2,'color',[178,34,34]./255,'LineWidth',linewidth)
xlabel('time(days)')
ylabel('percentage of NG in each state')

set(gca,'box','off')
ratio=[1 1 1];
pbaspect(ratio)

xlabel('time (hours)','FontSize',lfs,'FontName',lfn)
xticks([6 12 24 36 48])
xticklabels({'6','12','24','36','48'})

ylabel('Percentage of NG','FontSize',lfs,'FontName',lfn)
get(gca, 'XTick');
set(gca, 'FontSize', 16)
get(gca, 'YTick');
set(gca, 'FontSize', 16)

xl1 = [0 48.5];
yl1 = [0 100];
xlim(xl1);
ylim(yl1);

text('Position',[min(xl1)-xo*diff(xl1) max(yl1)+yo*diff(yl1)],...
    'String',{'(c)'},'FontName','Arial','FontSize',lfs);
% 
legend({'Unattached NG','Attached NG','NG internalized in epithelial',....
    'NG within PMN'},...
    'FontSize',14,'FontName',lfn,'Box','off',...
     'Position',[0.703950622317231 0.585323460830877 0.206666661633386 0.149599995803833])

%figure 3(b)

    plottingTime=40*24;
    tot_NGoverTime=y(24:plottingTime,1)+y(24:plottingTime,2)+y(24:plottingTime,3)+y(24:plottingTime,5);
   %using total NG population
    %percentage1=((y(24:plottingTime,1)+(y(24:plottingTime,5)))./tot_NGoverTime)*100;
    percentage1=(y(24:plottingTime,1)./tot_NGoverTime)*100;
    percentage2=(y(24:plottingTime,2)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
    percentage3=(y(24:plottingTime,3)./tot_NGoverTime)*100;%as t is in hours. so 2-6 days is 48-144 hours
    percentage4=(y(24:plottingTime,5)./tot_NGoverTime)*100;
    percentages=[percentage1,percentage4,percentage3,percentage2];

    subplot(1,3,2)
    g=area(t(24:plottingTime)./24,percentages);
    g(1).FaceColor = [255,160,122]./255;
    g(2).FaceColor = [250,128,114]./255;
    g(3).FaceColor = [205,92,92]./255;
    g(4).FaceColor=[178,34,34]./255;
    g(1).LineStyle = 'none';
    g(2).LineStyle = 'none';
    g(3).LineStyle = 'none';
    g(4).LineStyle='none' ;
        ratio=[1 1 1];
    pbaspect(ratio)
    ylim([0 100])
    xlim([1 40])
    set(gca,'box','off')
    xlabel('time (days)','FontSize',lfs,'FontName',lfn)
    ylabel('Percentage of NG','FontSize',lfs,'FontName',lfn)
    %title('% NG in specific state ','FontSize',lfs,'FontName',lfn)

xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
xl = [1 40];
yl = [0 100];
xlim(xl);
ylim(yl);

yticks([0 20 40 60 80 100]);

text('Position',[-39*0.1 109.5],...
    'String',{'(b)'},'FontName','Arial','FontSize',lfs);

subplot(1,3,1)
Fig_4_a_09_10_2018

