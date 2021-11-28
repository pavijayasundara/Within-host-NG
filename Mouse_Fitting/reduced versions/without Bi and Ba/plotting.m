
close all
figure('units','normalized','outerposition',[-0.5 -0.5 1 1])
x0=10;
y0=10;
width=5550;
height=400;
set(gcf,'units','points','position',[x0,y0,width,height])

ax1 = axes('Position',[0.2 0.2 0.6 0.6]);
ax1.ActivePositionProperty = 'outerposition';

thours=(1:9)'.*24';

markerSize=15;%3mm=8.5 point

lfs = 16;
lfn = 'Arial';
linewidth=1.5;
fontSize=16;

c=mouseXdata();
a=mouseXcheckingPMNcurve2;

NGcurve1=a(:,1);
subplot(1,3,2);
NGdata=c(:,1);
g1=scatter(1:9,NGdata,20,'xb');
hold on
%plotting NG curve with only NG data
h1=plot(1:9,NGcurve1,'-.b','Linewidth',linewidth);

%mouse 7
hold on
c=closedTrianglesdata();
a=mouseclosedTrianglescheckingPMNcurve2();
NGcurve1=a(:,1);
NGdata=c(:,1);
RGB=[128,0,128]./255;
g2=scatter(1:9,NGdata,20,RGB,'^','filled');
hold on
h2=plot(1:9,NGcurve1,'--','color',[128,0,128]./255,'Linewidth',linewidth);
hold on
       
%open square
        
c=openSquaredata();
a=mouseOPenSquarecheckingPMNcurve2();
NGcurve1=a(:,1);

NGdata=c(:,1);
RGB=[255,140,0]./255;
g3=scatter(1:9,NGdata,20,RGB,'s');
hold on
%plotting NG curve with only NG data
h3=plot(1:9,NGcurve1,'color',[255,140,0]./255,'Linewidth',linewidth);
ylabel('log NG','FontSize',lfs,'FontName',lfn)
xlabel('time(days)','FontSize',lfs,'FontName',lfn)
xo = 0.1;
yo = 0.01;
xl = [1 9];
yl = [-1 5];
xlim(xl);
ylim(yl);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[2 1 1];
pbaspect(ratio)
set(gca,'box','off')

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(b)'},'FontName','Arial','FontSize',lfs);           


l=legend([g1,g2,g3,h1,h2,h3],{'m4 data','m5 data','m6 data',...
    'm4 fit', 'm5 fit', 'm6 fit'},...
    'FontSize',16,'FontName',lfn,'Position',[0.533090026027673 0.654182280531239 0.0941605822448313 0.293071152677251],'Box','off');
legendProperties(l);
%________________________________
subplot(1,3,1);
c=mouseclosedSquaredata();
a=mouseClsoedSquarecheckingPMNcurve2();
NGcurve1=a(:,1);
PMNcurve1=a(:,2);

NGdata=c(:,1);
PMNdata=c(:,2);

g1=scatter(1:9,NGdata,'sb','MarkerFaceColor','b');

hold on

h1=plot(1:9,NGcurve1,'-.b');
hold on
c=mousePlusdata();
a=mousePluscheckingPMNcurve2();
NGcurve1=a(:,1);

NGdata=c(:,1);
RGB=[128,0,128]./255;
g2=scatter(1:9,NGdata,20,RGB,'+');
hold on
%plotting NG curve with only NG data
h2=plot(1:9,NGcurve1,'--','color',[128,0,128]./255,'Linewidth',linewidth);

c=mouseclosedCircles();
a=mouseclosedCirclescheckingPMNcurve2();
NGcurve1=a(:,1);

NGdata=c(:,1);
RGB=[255,140,0]./255;
g3=scatter(1:9,NGdata,15,RGB,'o','filled');
hold on
%plotting NG curve with only NG data
h3=plot(1:9,NGcurve1,'color',[255,140,0]./255,'Linewidth',linewidth);
hold on
ylabel('log NG','FontSize',lfs,'FontName',lfn)
xlabel('time(days)','FontSize',lfs,'FontName',lfn)
xo = 0.02;
yo = 0.1;
xl = [1 9];
yl = [0 8];
xlim(xl);
ylim(yl);

xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[2 1 1];
pbaspect(ratio)
set(gca,'box','off')

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(a)'},'FontName','Arial','FontSize',fontSize);           

l=legend([g1,g2,g3,h1,h2,h3],{'m1 data','m2 data','m3 data',...
    'm1 fit', 'm2 fit', 'm3 fit'},...
    'FontSize',16,'FontName',lfn,'Position',[0.252068128217456 0.644818984651089 0.0941605822448311 0.29307115267725],'Box','off');

% %_________________________
% positionVector = [0.38, 0.15, 0.3, 0.32];
% subplot(1,3,3,'Position',positionVector);
subplot(1,3,3)
c=openCirclesdata();
a=mouseOPenCirclescheckingPMNcurve();
NGcurve1=a(:,1);
NGdata=c(:,1);

g1=scatter(1:9,NGdata,markerSize,'ob');
hold on
h1=plot(1:9,NGcurve1,'-.b');

c=openTianglesdata();
a=mouseOPenTrianglecheckingPMNcurve2();
NGcurve1=a(:,1);

NGdata=c(:,1);
hold on
RGB=[255,140,0]./255;
g2=scatter(1:9,NGdata,markerSize,RGB,'^');
hold on

h2=plot(1:9,NGcurve1,'--','color',[255,140,0]./255,'Linewidth',linewidth);
ylabel('log NG','FontSize',lfs,'FontName',lfn)
xlabel('time(days)','FontSize',lfs,'FontName',lfn)
xo = 0.18;
yo = 0.25;
xl = [1 9];
yl = [0 7];
xlim(xl);
ylim(yl);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[2 1 1];
pbaspect(ratio)
set(gca,'box','off')

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(c)'},'FontName','Arial','FontSize',fontSize);           


l=legend([g1,g2,h1,h2],{'m7 data','m8 data',...
    'm7 fit', 'm8 fit'},...
    'FontSize',16,'FontName',lfn,'Position',[0.81776155887439 0.653401997503121 0.0941605822448313 0.197565537490202],'Box','off');
% % 
% %print('Figure_5','-djpeg','-r600');
% 
% 
% 
% 
% 
