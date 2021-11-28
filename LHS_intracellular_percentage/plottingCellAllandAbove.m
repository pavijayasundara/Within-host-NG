    fontSize=16;
    lfs = 16;
    lfn = 'Arial';
    linewidth=1.5;
    plottingTime=t(end)+1;%plotting only upto 60 days

    %numLHSsamples=size(LHSSamples,1);
    figure('units','normalized','outerposition',[0 0 1 1],'Name','cell Percentages')
    
       
    subplot(2,3,2)
    numRowsPlotting=1:plottingTime;
    plot(numRowsPlotting/24,qunatileVals_Bi_all(1:plottingTime,2),'LineWidth',linewidth);
    hold on
    ciplot(qunatileVals_Bi_all(1:plottingTime,1),qunatileVals_Bi_all(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4);
    ciplot(qunatileVals_Bi_all(1:plottingTime,4),qunatileVals_Bi_all(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4);
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%Bi','FontSize', fontSize,'FontName',lfn)
    xlim([0 60])
    
    subplot(2,3,3)
    numRowsPlotting=1:plottingTime;
    plot(numRowsPlotting/24,qunatileVals_Bs_all(1:plottingTime,2),'LineWidth',linewidth)
    hold on
    ciplot(qunatileVals_Bs_all(1:plottingTime,1),qunatileVals_Bs_all(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4)
    ciplot(qunatileVals_Bs_all(1:plottingTime,4),qunatileVals_Bs_all(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4)
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    yticks([0 20 40 60 80 100])
    ylabel('%Bs','FontSize', fontSize,'FontName',lfn)
    xlim([0 60])
    
    subplot(2,3,1)
    numRowsPlotting=1:plottingTime;
    h1=plot(numRowsPlotting/24,qunatileVals_extracellular_all(1:plottingTime,2),'LineWidth',linewidth);
    hold on
    h2=ciplot(qunatileVals_extracellular_all(1:plottingTime,1),qunatileVals_extracellular_all(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4);
    h3=ciplot(qunatileVals_extracellular_all(1:plottingTime,4),qunatileVals_extracellular_all(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4);
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%(B+Ba)','FontSize', fontSize,'FontName',lfn)
    yticks([0 20 40 60 80 100])
    xlim([0 60])
    
   
    legend([h1,h2,h3],{'median','inter quartile range','95% range'},'Box','off',...
         'Position',[0.191358028223485 0.813827163805196 0.156296292764169 0.11851851520715])
    
    

    plottingTime=t_above(end)+1;%plotting only upto 60 days
    numRows=t;%plotting for 
   
    
    subplot(2,3,5)
    numRowsPlotting=1:plottingTime;
    plot(numRowsPlotting/24,qunatileVals_Bi_above(1:plottingTime,2),'LineWidth',linewidth)
    hold on
    ciplot(qunatileVals_Bi_above(1:plottingTime,1),qunatileVals_Bi_above(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4)
    ciplot(qunatileVals_Bi_above(1:plottingTime,4),qunatileVals_Bi_above(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4)
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%Bi','FontSize', fontSize,'FontName',lfn)
    xlim([0 60])
    
    subplot(2,3,6)
    numRowsPlotting=1:plottingTime;
    plot(numRowsPlotting/24,qunatileVals_Bs_above(1:plottingTime,2),'LineWidth',linewidth)
    hold on
    ciplot(qunatileVals_Bs_above(1:plottingTime,1),qunatileVals_Bs_above(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4)
    ciplot(qunatileVals_Bs_above(1:plottingTime,4),qunatileVals_Bs_above(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4)
    yticks([0 20 40 60 80 100])
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%Bs','FontSize', fontSize,'FontName',lfn)
    xlim([0 60])
    
    subplot(2,3,4)
    numRowsPlotting=1:plottingTime;
    plot(numRowsPlotting/24,qunatileVals_extracellular_above(1:plottingTime,2),'LineWidth',linewidth)
    hold on
    ciplot(qunatileVals_extracellular_above(1:plottingTime,1),qunatileVals_extracellular_above(1:plottingTime,3)...
        ,numRowsPlotting/24,'b',0.4)
    ciplot(qunatileVals_extracellular_above(1:plottingTime,4),qunatileVals_extracellular_above(1:plottingTime,5)...
        ,numRowsPlotting/24,'g',0.4)
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    set(gca,'box','off')
    yticks([0 20 40 60 80 100])
    xlabel('time (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%(B+Ba)','FontSize', fontSize,'FontName',lfn)
    xlim([0 60])
    
    labelsCellPercentages