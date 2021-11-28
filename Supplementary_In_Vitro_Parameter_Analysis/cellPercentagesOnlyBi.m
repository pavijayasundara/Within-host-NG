function cellPercentagesOnlyBi(LHSSamples)
%input clearedParametervalues
        fontSize=16;
lfs = 16;
lfn = 'Arial';
linewidth=1.5;
%Plotting the two supplementary figures on %Bi on one figure
    b=1000;%initial size of the unattached bacteria
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    time=5000;%duration we are running the model
    
    numLHSsamples=size(LHSSamples,1);

    percentBi_end=zeros(numLHSsamples,1);

    percentBi_6days=zeros(numLHSsamples,1);

    percentBi_2days=zeros(numLHSsamples,1);

    percentBi_4days=zeros(numLHSsamples,1);
  
    percentBi_30days=zeros(numLHSsamples,1);

    
    parfor i=1:numLHSsamples
         paraValues=LHSSamples(i,:);
         options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
         [~,y,te,~]=ode45(@(t,y)Natural_infection_model_sensitivity_Internalise_invitro(t,y,paraValues),...
             0:time,[b,b_n,b_i,n,b_a],options);
         %based on the bacterial load aat the last time point
         bacterialLoad=y(end,1)+y(end,2)+y(end,3)+y(end,5);%final time point bacterial load
         plottingTime_2=2*24;
         tot_NGoverTime_2=y(plottingTime_2,1)+y(plottingTime_2,2)+y(plottingTime_2,3)+y(plottingTime_2,5);%2th day bacterial Load
         plottingTime_4=4*24;
         tot_NGoverTime_4=y(plottingTime_4,1)+y(plottingTime_4,2)+y(plottingTime_4,3)+y(plottingTime_4,5);%4th day bacterial Load
         plottingTime_6=6*24;
         tot_NGoverTime_6=y(plottingTime_6,1)+y(plottingTime_6,2)+y(plottingTime_6,3)+y(plottingTime_6,5);%6th day bacterial Load
         plottingTime_30=30*24;
         tot_NGoverTime_30=y(plottingTime_30,1)+y(plottingTime_30,2)+y(plottingTime_30,3)+y(plottingTime_30,5);%6th day bacterial Load
         
  
         percentBi_end(i)=(y(end,3)./bacterialLoad)*100;

         percentBi_2days(i)=(y(plottingTime_2,3)./tot_NGoverTime_2)*100;
       
         percentBi_4days(i)=(y(plottingTime_4,3)./tot_NGoverTime_4)*100;

         percentBi_6days(i)=(y(plottingTime_6,3)./tot_NGoverTime_6)*100;
 
         percentBi_30days(i)=(y(plottingTime_30,3)./tot_NGoverTime_30)*100;
         
    end
    
    %subplot(1,2,2)
    group=[percentBi_2days,percentBi_4days,percentBi_6days,percentBi_30days,percentBi_end];
    boxplot(group,1:5,'Labels',{'2','4','6','30','60'})
    set(gca, 'FontSize', 16,'box','off')
    xlabel('time of infection (days)','FontSize',fontSize,'FontName',lfn)
    ylabel('%Bi','FontSize', fontSize,'FontName',lfn)

end