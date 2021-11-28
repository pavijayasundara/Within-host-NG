

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

%area graph

lfs = 16;
lfn = 'Arial';
linewidth=1.5;
xo = 0.1;
yo = 0.1;


bacteria=[y(:,1),y(:,5),y(:,3),y(:,2)];
h=area(t/24,bacteria);
h(1).FaceColor = [255,160,122]./255;
h(2).FaceColor = [250,128,114]./255;
h(3).FaceColor = [205,92,92]./255;
h(4).FaceColor=[178,34,34]./255;

h(1).LineStyle = 'none';
h(2).LineStyle = 'none';
h(3).LineStyle = 'none';
h(4).LineStyle ='none';

hold on
j1=plot(t/24,total_NG,'k','LineWidth',linewidth);

hold on
j2=plot(t/24,y(:,4),'color',[0,0,139]./255,'LineWidth',linewidth);
set(gca,'box','off')
ratio=[1 1 1];
pbaspect(ratio)

xlabel('time (days)','FontSize',lfs,'FontName',lfn)

%ylabel('NG \textit{(bacteria)} and PMN \textit{(cells)}','Interpreter', 'LaTeX','FontSize',lfs,'FontName',lfn)
ylabel({'Number of cells','(bacteria, PMN)'},'FontSize',lfs,'FontName',lfn)
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
xl1 = [0 40];
yl1 = [0 5*10^6];
xlim(xl1);
ylim(yl1);

text('Position',[min(xl1)-xo*diff(xl1) max(yl1)+yo*diff(yl1)],...
    'String',{'(a)'},'FontName','Arial','FontSize',lfs);

legend([h(4),h(3),h(2),h(1),j1,j2],{'NG within PMN','NG within epithelial','Attached NG',...
    'Unattached NG','total NG','activated PMN'},...
    'FontSize',lfs,'FontName',lfn,'Box','off',...
    'Position',[0.177283954723381 0.446682776865458 0.173333329293463 0.292066551657258])