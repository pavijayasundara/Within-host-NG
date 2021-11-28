markersize=50;
fontSize=16;
lfs = 16;
lfn = 'Arial';
close all
figure('units','normalized','outerposition',[0 0 1 1],'Name','hists All ClearedPara')

subplot(2,3,1)
hist(clearedOutcomes(:,2))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')

xlabel('clearence time (days)','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)

ratio=[1 1 1];
pbaspect(ratio)

subplot(2,3,2)
hist(clearedOutcomes(:,3))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('peak time (days)','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)

subplot(2,3,3)
hist(clearedOutcomes(:,4))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('peak NG load','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)

%clearence above 60 days

subplot(2,3,4)
hist(outcomesAbove60(:,1))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('clearence time (days)','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)

subplot(2,3,5)
hist(outcomesAbove60(:,2))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('peak time (days)','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)

subplot(2,3,6)
hist(outcomesAbove60(:,3))
bp = gca;
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('peak NG load','FontSize', fontSize,'FontName',lfn)
ylabel('frequency','FontSize', fontSize,'FontName',lfn)
ratio=[1 1 1];
pbaspect(ratio)

annotation('textbox',...
    [0.0988362573099419 0.907431935246503 0.0427037037037033 0.0503703703703701],...
    'String','(a)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

annotation('textbox',...
    [0.395346978557504 0.896296296296295 0.0493703703703705 0.0637037037037037],...
    'String','(b)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

annotation('textbox',...
    [0.683495126705651 0.891851851851849 0.0493703703703705 0.0637037037037037],...
    'String','(c)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.0975692007797263 0.439999999999998 0.0493703703703705 0.0637037037037037],...
    'String','(d)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.397569200779726 0.435555555555554 0.0493703703703705 0.0637037037037038],...
    'String','(e)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.687198830409355 0.423703703703702 0.0493703703703705 0.0637037037037038],...
    'String','(f)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');


