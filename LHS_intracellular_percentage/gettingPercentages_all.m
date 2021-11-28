function [t,percentB_end_all,percentBa_end_all,percentBi_end_all,percentBs_end_all,extracellular_end_all,inracellular_end_all]=gettingPercentages_all(LHSSamples)

%This code evaluate cell percentages of the samples that meet features
    b=1000;%initial size of the unattached bacteria
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    time=66*24;%duration we are running the model
    
    plottingTime=66*24;%plotting only upto 60 days
    numRows=plottingTime;%plotting for 
    numLHSsamples=size(LHSSamples,1);
    
    percentB_end_all=NaN( numRows,numLHSsamples);%to store the percentage based on the final time point...
    %bacterial load. The colums store the bacterial percentage for each
    %sample and the rows represnt the time
    percentBa_end_all=NaN( numRows,numLHSsamples);
    percentBi_end_all=NaN( numRows,numLHSsamples);
    percentBs_end_all=NaN(numRows,numLHSsamples);
    extracellular_end_all=NaN(numRows,numLHSsamples);
    inracellular_end_all=NaN(numRows,numLHSsamples);
   
    
      
    for i=1:numLHSsamples
         paraValues=LHSSamples(i,:);
         options = odeset('AbsTol',1e-13,'RelTol',1e-11);
         [t,y]=ode45(@(t,y)Natural_infection_model_sensitivity_14paras(t,y,paraValues),...
             0:1:time,[b,b_n,b_i,n,b_a],options);
         
         %based on the bacterial load at the last time point
         bacterialLoad=y(:,1)+y(:,2)+y(:,3)+y(:,5);%total bacterial load at all time points
         
       
         B_1=length((y(:,1)./bacterialLoad)*100);
                 
         percentB_end_all(1:B_1,i)=(y(:,1)./bacterialLoad)*100;
         percentBa_end_all(1:B_1,i)=(y(:,5)./bacterialLoad)*100;
         percentBi_end_all(1:B_1,i)=(y(:,3)./bacterialLoad)*100;
         percentBs_end_all(1:B_1,i)=(y(:,2)./bacterialLoad)*100;
         extracellular_end_all(1:B_1,i)=((y(:,1)+y(:,5))./bacterialLoad)*100;
         inracellular_end_all(1:B_1,i)=((y(:,2)+y(:,3))./bacterialLoad)*100;
      
    end


end