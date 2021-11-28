function FigS_7_PMN_delay_fig()
    close all
    clear
    
    %initial conditions for ODE
    b=1000;%initial size of the unattached bacteria
    b_e=0;%initial size of the attached bacteria to endothelial
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    
    time=2400;%time in hours
 
 
    options = odeset('AbsTol',1e-8,'RelTol',1e-8,'Events',@eventfunction);
    [t,y]=ode45(@(t,y)Equations(t,y),0:time,[b,b_n,b_i,n,b_a],options);
 
    total_NG=y(:,1)+y(:,2)+y(:,3)+y(:,5);
    
    %area graph
    
    lfs = 16;
    lfn = 'Arial';
    linewidth=1.5;
    
    figure('units','normalized','outerposition',[1 1 1 1])
    set(gcf,'pos',[0 0 0.5 0.5])
    
    rectangle('Position',[0.5 1*10^5 100 1*10^8],'EdgeColor',[192,192,192]./255,'FaceColor',[192,192,192]./255)
    rectangle('Position',[1 1*10^-8 6 1*10^8],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
    rectangle('Position',[30 1*10^-8 60 1*10^5],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
   
    hold on
    plot(t/24,y(:,1),'color',[255,160,122]./255,'LineWidth',linewidth);%
    set(gca, 'YScale', 'log')
    hold on
    plot(t/24,y(:,5),'-.','color',[250,128,114]./255,'LineWidth',linewidth);%
    set(gca, 'YScale', 'log')
    hold on
    plot(t/24,y(:,3),'--','color',[205,92,92]./255,'LineWidth',linewidth);%
    set(gca, 'YScale', 'log')
    hold on
    plot(t/24,y(:,2),'color',[178,34,34]./255,'LineWidth',linewidth);%
    set(gca, 'YScale', 'log')
    hold on
    plot(t/24,y(:,4),':','color',[0,0,139]./255,'LineWidth',linewidth);
    set(gca, 'YScale', 'log')
    hold on
    plot(t/24,total_NG,'k--','LineWidth',linewidth);
    set(gca, 'YScale', 'log','Layer','top')
   ngx=0:90;
ngy=10*ones(length(ngx));
hold on 
plot(ngx,ngy,'k -.')
   

    xlabel('time (days)','FontSize',lfs,'FontName',lfn)
    ylabel('Number of cells','FontSize',10,'FontName',lfn)
   
    xticks([0 7 30 60 90])
    yticks([10^-5 1 10^4 10^7])
    ylim([10^-8 10^8])
    xlim([0 90])
    
    xt = get(gca, 'XTick');
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    ratio=[1.5 1 1];
    pbaspect(ratio)
    set(gca,'box','off')
   
    xo = 0.15;
    yo = 0.010;
    xl = [0 90];
    yl = [0 10^8];
    

             
    legend({'Unattached NG','Attached NG','NG internalized in epithelial','NG within PMN',...
         'activated PMN','total NG'},'FontSize',14,'FontName',lfn,'Box','off',...
         'Position',[0.312402537131031 0.169985967210731 0.464062488079071 0.360677073088785])
     
annotation('textbox',...
    [0.212985267203514 0.618489583333333 0.3286875 0.037109375],...
    'String',{'infection clearence'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.278315153733528 0.560546875 0.1615 0.048828125],'String',{'cut-off'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');



annotation('textbox',...
    [0.497339677891654 0.828125 0.22008345534407 0.0494791666666666],...
    'String',{'Peak NG load'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.604221083455344 0.697916666666667 0.265471449487555 0.078125],...
    'String',{'infection duration'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
text(5,1.5*10^-8,'incubation period','FontSize',15,'FontName',lfn)
H=findobj(gca,'Type','text');
set(H,'Rotation',90); % tilt

end 
    function s= Equations(t,y)
    r1=0.489;%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=0.025;%proportion surving within PMN
    d=2.783;%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=1.605*10^-11;%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/12;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=0.821;%ratio dependent constant
    e=0.65;%rate of exit from epithelial cells
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
    if t>3*24
        s(4)=mu*(N_max-y(4))*(y(1)+y(5))-d3*y(4);%activated neutrophil
    else
        s(4)=10^-8;
    end
   s(5)=(r1*y(5))*(1-((y(1)+y(5))/k))-(d*y(4)*y(5)/(c*y(4)+y(5)))-...
        eta*y(5)+a1*y(1)*(1-(y(5)/k2));%attached bacteria
    
    end
    
    function [value, isterminal,direction]=eventfunction(~,y)
    value=y(1)+y(2)+y(3)+y(5)-5;
    isterminal=1;
    direction=0;
    end
    
 

