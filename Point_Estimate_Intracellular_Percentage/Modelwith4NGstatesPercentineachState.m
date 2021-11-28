    close all
    b=1000;%initial size of the unattached bacteria
    b_e=0;%initial size of the attached bacteria to endothelial
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    time=4000;%time in hours
 
 
    options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
    [t,y]=ode45(@(t,y)Equations(t,y),0:time,[b,b_n,b_i,n,b_a],options);
 
    total_NG=y(:,1)+y(:,2)+y(:,3)+y(:,5);
    
%     for i=(2*24:20*24)
%         if total_NG(i)>10^6
%         disp(i)
%    
%         end
%     end
    figure(1)
    subplot(2,3,1);
    plot(t/24,y(:,1))
    title('Unattached bacteria')
    subplot(2,3,2)
    plot(t/24,y(:,2))
    title('NG within PMN')
    subplot(2,3,3)
    plot(t/24,y(:,3))
    title('NG internalized in epithelial')
    subplot(2,3,4)
    plot(t/24,y(:,4))
    title('PMN')
    subplot(2,3,5)
    plot(t/24,total_NG)
    title('total NG')
    xlabel('time(days)')
 
% %using total cell population
    figure(2)
    subplot(2,4,1)
    percentage5=(y(48:144,1)./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,4)))*100;%as t is in hours. so 2-6 days is 48-144 hours
    plot(t(48:144)/24,percentage5)
    title('% of NG in B(2-6 days)')
    xlabel('time(days)')
    subplot(2,4,2)
    plot(t/24,(y(:,1)./(total_NG+y(:,4)))*100)   
    title('%  of NG in B')
    xlabel('time(days)')
%     
%     subplot(2,4,3)
%     percentage4=(y(48:144,2)./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,4)))*100;%as t is in hours. so 2-6 days is 48-144 hours
%     plot(t(48:144)/24,percentage4)
%     title('% Bs (2-6 days)')
%     xlabel('time(days)')
%     subplot(2,4,4)
%     plot(t/24,(y(:,2)./(total_NG+y(:,4)))*100)
%     title('% Bs')
%     xlabel('time(days)')
%     
%    
%     subplot(2,4,5)
%     percentage4=(y(48:144,3)./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,4)))*100;%as t is in hours. so 2-6 days is 48-144 hours
%     plot(t(48:144)/24,percentage4)
%     title('% of Bi (2-6 days)')
%     xlabel('time(days)')
%     subplot(2,4,6)
%     plot(t/24,(y(:,3)./(total_NG+y(:,4)))*100)
%     title('% Bi')
%     xlabel('time(days)')
    
    
    %using total NG population
    
    figure(4)
    subplot(2,4,1)
    percentage5=((y(48:144,1)+y(48:144,5))./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,5)))*100;%as t is in hours. so 2-6 days is 48-144 hours
    plot(t(48:144)/24,percentage5)
    title('% of NG in B+Ba(2-6 days)')
    xlabel('time(days)')
    subplot(2,4,2)
    plot(t/24,((y(:,1)+y(:,5))./(total_NG))*100)   
    title('%  of NG in B+Ba')
    xlabel('time(days)')
    
    subplot(2,4,3)
    percentage4=(y(48:144,2)./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,5)))*100;%as t is in hours. so 2-6 days is 48-144 hours
    plot(t(48:144)/24,percentage4)
    title('% Bs (2-6 days)')
    xlabel('time(days)')
    subplot(2,4,4)
    plot(t/24,(y(:,2)./(total_NG))*100)
    title('% Bs')
    xlabel('time(days)')
    
   
    subplot(2,4,5)
    percentage4=(y(48:144,3)./(y(48:144,1)+y(48:144,2)+y(48:144,3)+y(48:144,5)))*100;%as t is in hours. so 2-6 days is 48-144 hours
    plot(t(48:144)/24,percentage4)
    title('% of Bi (2-6 days)')
    xlabel('time(days)')
    subplot(2,4,6)
    plot(t/24,(y(:,3)./(total_NG))*100)
    title('% Bi')
    xlabel('time(days)')
    
    figure(3)
    subplot(2,3,1);
    plot(t/24,y(:,1))
    set(gca, 'YScale', 'log')
    title('unattached bacteria')
    subplot(2,3,2)
    plot(t/24,y(:,2))
    set(gca, 'YScale', 'log')
    title('NG within PMN')
    subplot(2,3,3)
    plot(t/24,y(:,3))
    set(gca, 'YScale', 'log')
    title('NG internalized in epithelial')
    subplot(2,3,4)
    plot(t/24,y(:,4))
    set(gca, 'YScale', 'log')
    title('neutrophil')
    subplot(2,3,5)
    plot(t/24,total_NG)
    set(gca, 'YScale', 'log')
    title('total bacteria')
    xlabel('time(days)')
    
   
    
 
    
    function s= Equations(t,y)
    r1=0.488;%replication rate  of unattached bacteria
    a1=0.34;%bacterial attachment rate to epithelial
    p=0.25;%proportion surving within PMN
    d=2.5887;%rate that NG are engulfed by PMN
    d2=10^-3;%washout rate of unattached bacteria
    N_max=(((2.5+7.5)/2)*10^9)*5;%maximum number of neutrophils in the body
    mu=5.631*10^-13;%neutrophil activation rate
    d3=1/24;%death rate of neutrophil
    k=10^7;%carrying capacity 
    a2=1/12;%infection rate of epithelial cells
    k2=k/a2;%carrying capacity of epithelial cell
    c=3.136;%ratio dependent constant
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
    value=y(1)+y(2)+y(3)+y(5)-10;
    isterminal=1;
    direction=0;
    end
 

