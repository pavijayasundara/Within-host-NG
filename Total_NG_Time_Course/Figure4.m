close all

load 'totalNGloadDataforplotting.mat'

b=1000;%initial size of the unattached bacteria
b_e=0;%initial size of the attached bacteria to endothelial
b_n=0;
b_i=0;
b_a=0;
n=10^-8;%initial neutrophils
time=3000;%time in hours
%%in vitro estimates
para=[2.586,3.135,0.25,5.72*10^-13];
options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
[t_point,y]=ode45(@(t,y)Equations(t,y,para),0:5000,[b,b_n,b_i,n,b_a]);
%%point estimate total NG load
total_NG_point=y(:,1)+y(:,2)+y(:,3)+y(:,5);

para2=[2.783,0.821,0.025,3.1*10^-13];

[t2,y2,te2,ye2,ie2]=ode45(@(t,y)Equations(t,y,para2),0:time,[b,b_n,b_i,n,b_a],options);

total_NG2=y2(:,1)+y2(:,2)+y2(:,3)+y2(:,5);


figure('units','normalized','outerposition',[0 0 1 1])

k1=subplot(1,2,2,'Position',[0.577037037037035 0.261296296296296 0.335432098765431 0.503148148148147]);

%%axis tight
linewidth=1.5;
afn = 'Arial';
lfs = 16;
lfn = 'Arial';
rectangle('Position',[0.5 1*10^5 180 1*10^8],'EdgeColor',[192,192,192]./255,'FaceColor',[192,192,192]./255)
rectangle('Position',[1 1*10^-8 6 1*10^8],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
rectangle('Position',[30 1*10^-8 150 1*10^5],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
%rectangle('Position',[60 1*10^-8 150 1*10^5],'EdgeColor',[173,216,230]/255,'FaceColor',[173,216,230]/255)
hold on
h1=plot(t_point/24,total_NG_point,'k','LineWidth',linewidth);
set(gca, 'YScale', 'log','Layer','top')
hold on
h2=plot(t2/24,total_NG2,'r--','LineWidth',linewidth);
hold on
ngx=0:180;
ngy=10*ones(length(ngx));
plot(ngx,ngy,'k -.')
%%%plotting 95% range
%     qunatileVals_totNG_above60=load('qunatileVals_totNG_above60.mat','qunatileVals_totNG_above60');
%     qunatileVals_totNG_cleared=load('qunatileVals_totNG_cleared.mat','qunatileVals_totNG_cleared');
plottingTime=length(qunatileVals_totNG_above60(:,1));
numRowsPlotting=1:plottingTime;
%95%range  of all that cleared
RGB1=[255,140,0]./255;
h3=plot(numRowsPlotting/24,qunatileVals_totNG(1:plottingTime,4),'LineWidth',2,'color','k','LineStyle',':');
h4=plot(numRowsPlotting/24,qunatileVals_totNG_above60(1:plottingTime,5),'LineWidth',2,'color','k','LineStyle',':');
RGB2=[47,79,79]./255;
%95%range  of above 60
% h5=plot((1:60*24)/24,qunatileVals_totNG_above60(1:60*24,4),'LineWidth',linewidth,'color',RGB2,'LineStyle',':');
% h6=plot(numRowsPlotting/24,qunatileVals_totNG_above60(1:plottingTime,5),'LineWidth',linewidth,'color',RGB2,'LineStyle',':');

% axis tight
ylim([10^-8 10^8])
xlim([0 180])
yticks([10^-5 10 10^7]);
xticks([1 7 30 60 90 120 150 180])

xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
%%set(gca,'Position',[0.587816455696202 0.30793991416309 0.373417721518987 0.379828326180257]);
% % ratio=[2 1.5 1];
% % pbaspect(ratio)
% % set(gca,'box','off')

xo = 0.15;
yo = 0.010;
xl = [0 90];
yl = [0 10^8];
%     xlim(xl);
%     ylim(yl);

text(3.5,5*10^-8,'incubation period','FontSize',16,'FontName',lfn)
H=findobj(gca,'Type','text');
set(H,'Rotation',90); % tilt

text('FontSize',16,'FontName','Arial',...
    'String','Peak NG load',...
    'Position',[72.5550660792952 2152553.42539646 0]);
H=findobj(gca,'Type','text');
%title('total NG','FontSize',lfs,'FontName',lfn)
xlabel('time (days)','FontSize',lfs,'FontName',lfn)
ylabel('Number of bacteria','FontSize',lfs,'FontName',lfn)

legend([h2,h1,h3],{'\textit{in vitro} parameters','estimated parameters',...
    ['95\% CI']},...
    'FontSize',lfs,'FontName',lfn,'Box','off','FontSize',16,'FontName',lfn,...
    'Position',[0.718878191024595 0.271566263736529 0.178068866080863 0.121185183489764],...
    'Interpreter', 'LaTeX')

text('FontSize',16,'FontName','Arial','String',{'(b)'},...
    'Position',[-16.9322039262723 433601138.231966 0]);

annotation('textbox',...
    [0.718774884285404 0.541685700354032 0.232113913342321 0.0423280423280421],...
    'String','infection clearence',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

annotation('textbox',...
    [0.761979103487747 0.514246294523332 0.0759230769230771 0.0388007054673721],...
    'String','cut-off',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

annotation('textbox',...
    [0.786185185185185 0.607407407407407 0.152333333333333 0.0444444444444444],...
    'String',{'infection duration'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

%text(0.02,1.08,'(a)','Units', 'Normalized', 'VerticalAlignment', 'Top','FontName','Arial','FontSize',lfs)
k2=subplot(1,2,1);
set(k2,'units','normalized','Position',[0.137037037037037 0.263703703703703 0.340936531244901 0.499528619528619])

timeCourseFig3_a

function s= Equations(~,y,para)

    r1=0.489;%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=para(3);%proportion surving within PMN
    d=para(1);%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=para(4);%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/12;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=para(2);%ratio dependent constant
    e=0.650;%rate of exit from epithelial cells
    k3=8;%carrying capacity of PMN
    r2=0.533;%replication rate of internalized NG within epithelial cells
    r3=0.34;%replication of survinvg NG within PMN
    eta=0.28;%proportion of NG internalized
   
    s=zeros(5,1);
       
    s(1)=(1-((y(1)+y(5))/k))*(r1*y(1)+d3*y(2)+e*y(3))-(d*y(1)*y(4)/(c*y(4))+y(1))-d2*y(1)...
        -a1*y(1)*(1-(y(5)/(k2)));%rate of change of unattached bacteria
    s(2)=(1-(y(2)/(y(4)*k3)))*((p*d*y(4)*y(1)/(c*y(4)+y(1)))+(p*d*y(4)*y(5)/(c*y(4)+y(5)))+r3*y(2))...
        -d3*y(2);%NG within PMN 
    s(3)=(1-(y(3)/k2))*(eta*y(5)+r2*y(3))-e*y(3);%NG within epithelial
    s(4)=mu*(N_max-y(4))*(y(1)+y(5))-d3*y(4);%activated neutrophil
    s(5)=(r1*y(5))*(1-((y(1)+y(5))/k))-(d*y(4)*y(5)/(c*y(4)+y(5)))-...
        eta*y(5)+a1*y(1)*(1-(y(5)/k2));%attached bacteria

end

function [value, isterminal,direction]=eventfunction(~,y)
value=y(1)+y(2)+y(3)+y(5)-10^-10;
isterminal=1;
direction=0;
end


