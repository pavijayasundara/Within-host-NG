function plottingTotalNG(qunatileVals_totNG,qunatileVals_totNG_above60)
fontSize=16;
lfn = 'Arial';
linewidth=1.5;

plottingTime=length(qunatileVals_totNG);%plotting only upto 60 days

numRowsPlotting=1:plottingTime;
%h1=plot(numRowsPlotting/24,qunatileVals_totNG(1:plottingTime,2),'LineWidth',linewidth);
set(gca, 'FontSize', 16)
set(gca, 'yscale', 'log')
%yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')
hold on
%     h2=ciplot(qunatileVals_totNG(1:plottingTime,1),qunatileVals_totNG(1:plottingTime,3)...
%         ,numRowsPlotting/24,'b',0.4)
%     h3=ciplot(qunatileVals_totNG(1:plottingTime,4),qunatileVals_totNG(1:plottingTime,5)...
%         ,numRowsPlotting/24,'g',0.4)
h2=plot(numRowsPlotting/24,qunatileVals_totNG(1:plottingTime,4),'LineWidth',linewidth,'color','k');
h3=plot(numRowsPlotting/24,qunatileVals_totNG_above60(1:plottingTime,5),'LineWidth',linewidth','color','k');
hold on
ngx=0:200;
ngy=10*ones(length(ngx));
plot(ngx,ngy,'k -.')
xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
ylabel('total NG','FontSize', fontSize,'FontName',lfn)
ylim([10^-5 10^8])
legend([h3],{'95% range'},'Box','off')

end