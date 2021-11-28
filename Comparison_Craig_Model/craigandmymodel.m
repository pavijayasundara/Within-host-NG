    close all
    clear
    
    %initial conditions for ODE
    b=1000;%initial size of the unattached bacteria
    b_e=0;%initial size of the attached bacteria to endothelial
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    
    time=2000;%time in hours
 
 
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [t,y]=ode45(@(t,y)Equations(t,y),0:time,[b,b_n,b_i,n,b_a],options);
 
    total_NG=y(:,1)+y(:,2)+y(:,3)+y(:,5);
    
    %area graph
    lfs = 16;
    lfn = 'Arial';
    linewidth=1.5;
    
    figure('units','normalized','outerposition',[0.25 0.25 0.5 0.75])
    x0=10;
    y0=10;
    width=550;
    height=400;
    set(gcf,'units','points','position',[x0,y0,width,height])
    
    ax1 = axes('Position',[0.2 0.2 0.65 0.65]);
    ax1.ActivePositionProperty = 'outerposition';

    %figure
    rectangle('Position',[10^-5 1*10^5 180 1*10^8],'EdgeColor',[192,192,192]./255,'FaceColor',[192,192,192]./255)
    rectangle('Position',[1 1*10^-8 6 1*10^8],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
    rectangle('Position',[30 1*10^-8 150 1*10^5],'EdgeColor',[0.6902 .7686 .8706],'FaceColor',[0.6902 .7686 .8706])
    hold on
    h1=plot(t/24,total_NG,'k','LineWidth',linewidth);
    set(gca, 'YScale', 'log')
    hold on 
    ngx=0:180;
    ngy=10*ones(length(ngx));
    plot(ngx,ngy,'k -.')
    hold on
   
   
    
   annotation('arrow',[0.476179729680312 0.477542127500476],...
    [0.577651977904844 0.226592052811212],'LineWidth',1,'LineStyle','-.');
    annotation('arrow',[0.686810821074666 0.68817321889483],...
    [0.57817768872825 0.227117763634617],'LineWidth',1,'LineStyle','-.');
    annotation('textbox',...
    [0.44650408719346 0.177902621722846 0.046683923705722 0.0411985018726592],...
    'String',{'75'},...
    'LineStyle','none',...
    'FontSize',16,...
    'FontName','Arial',...
    'FitBoxToText','off');

    hold on
    ylim([10^-8 10^8])
    xlim([0 180])
    xlabel('time (days)','FontSize',lfs,'FontName',lfn)
    ylabel('Total number of bacteria','FontSize',lfs,'FontName',lfn)
    xt = get(gca, 'XTick');
    set(gca, 'FontSize', 16)
    yt = get(gca, 'YTick');
    set(gca, 'FontSize', 16)
    yticks([10^-5 10 10^7]);
    xticks([0 30 60 75 90 120 135 150 180])
    text(4,5*10^-8,'incubation period','FontSize',lfs,'FontName',lfn)
    H=findobj(gca,'Type','text');
    set(H,'Rotation',90); % tilt
          
    text(105,5*10^3,'infection duration','FontSize',lfs,'FontName',lfn)
    H=findobj(gca,'Type','text');
    %set(H,'Rotation',90); % tilt
    
    text(55,1*10^6,'Peak NG load','FontSize',lfs,'FontName',lfn)
    H=findobj(gca,'Type','text');
    %text(0.02,1.08,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontName','Arial','FontSize',12)
    %legend({'Unattached NG','NG within PMN','NG internalized in epithelial',...
    %     'activated PMN','total NG'},'FontSize',lfs,'FontName',lfn,'Box','off')
    %text(0.02,1.08,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontName','Arial','FontSize',12)
    %title('NG and PMN over time (log scale)')
    
   %craig's data
    tt=0:3800;
    k=10^7;
    l_0=1000;
    r_e=log(2)/(3.4);
    r_h=log(2)/(6.9*24);
    values=(k*l_0*exp((r_e-r_h).*tt))./((k-l_0)+l_0*exp(r_e.*tt));
     hold on    
    %h2=plot(tt/24,values,'--','color',[255,140,0]./255,'Linewidth',linewidth);
     h2=plot(tt/24,values,'--r','Linewidth',linewidth);
   set(gca,'box','off','Layer','top')
   annotation('textbox',...
    [0.238057220708446 0.54494382022472 0.263305177111717 0.0805243445692885],...
    'String','infection clearence',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.285741144414169 0.554307116104869 0.162487738419618 0.0355805243445694],...
    'String','cut-off',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
    legend([h1,h2],{'our model', 'model by Craig, et al. (2015)'},'FontSize',14,'FontName',lfn,...
        'Box','off','Position',[0.471843787965505 0.8458177278402 0.391008164804703 0.0908239675818311] )
     
%      print('Figure S2','-djpeg','-r600');
%      print('Figure S2','-dtiff','-r600');
%      print('Figure S2_1','-dtiff','-r300');

    function s= Equations(t,y)
    
    r1=0.489;%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=0.25;%proportion surving within PMN
    d=2.586;%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=5.72*10^-13;%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/12;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=3.135;%ratio dependent constant
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
    
 

