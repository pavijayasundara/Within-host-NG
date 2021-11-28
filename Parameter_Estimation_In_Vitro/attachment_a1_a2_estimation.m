%close all

fontSize=16;
lfs = 16;
lfn = 'Arial';
linewidth=1.5;
markersize=20;
%for figure labels as (a), (b)
xo = 0.12;
yo = 0.12;
    
Attachment_fun = @(x,xdata) x(2)*(1-exp(-x(1)*xdata));


per10TypeA=[4.92573283493999;12.0253787133582;27.8526460751524;66.5748573676962;...
    78.1280739720637;82.0627582136533];%typeA NG data at ratio of 10:1
per10TypeB=[4.591836735;7.142857143;14.79591837;22.44897959;36.73469388;41.83673469];
time=[0.253393665158371;0.506787330316742;0.995475113122172;...
    1.99095022624434;3.02262443438913;3.98190045248868];
xA = [0,0.001];

NGtypeA=per10TypeA/10; %Data is given for bacteria attached per 10 HeLa cells
[attachment_Para_A,error1]= lsqcurvefit(Attachment_fun,xA,time,NGtypeA);

xB = [0.3,0.001];
lb = [0.31,0.34];
ub = [5,85];

NGtypeB=per10TypeB/10; %Data is given for bacteria attached per 10 HeLa cells
[attachment_Para_B,error2]= lsqcurvefit(Attachment_fun,xB,time,NGtypeB,lb,ub);

%figure('units','normalized','outerposition',[0 0 1 1])
%figure
RGB=[255,140,0]./255;
scatter(time,NGtypeA,markersize,RGB,'filled')
hold on
plot(time,attachment_Para_A(2)*(1-exp(-attachment_Para_A(1)*time)),'LineWidth',linewidth,'color',RGB)
hold on 
scatter(time,NGtypeB,markersize,'b^','filled')
hold on
plot(time,attachment_Para_B(2)*(1-exp(-attachment_Para_B(1)*time)),'b--','LineWidth',linewidth)

xlabel('time (hours)','FontSize', fontSize,'FontName',lfn)
ylabel('NG per HeLa cell','FontSize', fontSize,'FontName',lfn)

xl = [0 4];
yl = [0 8];
xlim(xl);
ylim(yl);
yticks([0 2 4 6 8])
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
ratio=[1 1 1];
pbaspect(ratio)
set(gca,'box','off')
text('Position',[-0.584421906693711 9.16685922920892 0],...
     'String',{'(a)'},'FontName','Arial','FontSize',fontSize);    
 legend({'piliated NG','fit','non piliated NG','fit'},'FontSize',lfs,'FontName',lfn,'Box','off',...
      'Position',[0.129135805714277 0.654320987654321 0.146666663421525 0.156296291881137])
% legend({'data','fit'},'FontSize',lfs,'FontName',lfn,'Box','off','Location','southeast')