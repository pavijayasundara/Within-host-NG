function [clearedOutcomes,unclearedOutcomes,clearedParameterValues,UnclearedParameterValues,clearedButNotmetFeatures,...
    clearedOutcomesNotmetFeatures]=sensitivityBiparameters(LHSSamples)

    %sensitivity analysis by changing all parameters EXCEPT k AND Nmax.
    close all
    
    b=1000;%initial size of the unattached bacteria
    b_n=0;
    b_i=0;
    b_a=0;
    n=10^-8;%initial neutrophils
    time=5000;%duration we are running the model
    %tspan=0:6:time;%time in hours
    
    numLHSsamples=size(LHSSamples,1);
    clearenceTime=zeros(1,numLHSsamples);
    peakTimeCleared=zeros(1,numLHSsamples);
    peakNGCleared=zeros(1,numLHSsamples);
    sampleNumber=zeros(1,numLHSsamples);
    
    %for the unclear values
    
    peakTimeUnCleared=zeros(1,numLHSsamples);
    peakNGUnCleared=zeros(1,numLHSsamples);
    UnclearsampleNumber=zeros(1,numLHSsamples);
    numParas=6;
    clearedParameterValues=zeros(numLHSsamples,numParas);%stores the parameter values only of the cleared parameter sets
    UnclearedParameterValues=zeros(numLHSsamples,numParas);
    clearedButNotmetFeatures=zeros(numLHSsamples,numParas);%stores the parameter values that clear infection but does not meet qualitative features
    clearenceTimeNotmetFeatures=zeros(1,numLHSsamples);
    peakTimeClearedNotmetFeatures=zeros(1,numLHSsamples);
    peakNGClearedNotmetFeatures=zeros(1,numLHSsamples);
    sampleNumberNotmetFeatures=zeros(1,numLHSsamples);
    
    
    tic
    parfor i=1:numLHSsamples
         paraValues=LHSSamples(i,:);
         options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
         [~,y,te,~]=ode45(@(t,y)Natural_infection_model_sensitivity_Internalise_invitro(t,y,paraValues),...
             0:time,[b,b_n,b_i,n,b_a],options);
         
         bacterialLoad=y(:,1)+y(:,2)+y(:,3)+y(:,5);
         
         [maximum,indexVal]=max(bacterialLoad);
            
         if (isempty(te))%when infection does not get cleared
             
                UnclearedParameterValues(i,:)=paraValues;
                peakTimeUnCleared(i)=indexVal/24;
                peakNGUnCleared(i)=maximum;
                UnclearsampleNumber(i)=i;
                
         end
         
         if ~(isempty(te))

             if (10^6<maximum && maximum<10^8)&& ((1<indexVal/24) && (indexVal/24)<7)&& (30<(te/24) && (te/24)<180)
                
                clearedParameterValues(i,:)=paraValues;
                peakTimeCleared(i)=indexVal/24;
                peakNGCleared(i)=maximum;
                clearenceTime(i)=te/24;
                sampleNumber(i)=i;
          
             else
                %those that clear infection but does not meet features
                clearedButNotmetFeatures(i,:)=paraValues;
                peakTimeClearedNotmetFeatures(i)=indexVal/24;
                peakNGClearedNotmetFeatures(i)=maximum;
                clearenceTimeNotmetFeatures(i)=te/24;
                sampleNumberNotmetFeatures(i)=i;
             end
              
         end
    
    end

   %for uncleared
   UnclearedParameterValues= UnclearedParameterValues(any(UnclearedParameterValues,2),:);
   peakTimeUnCleared=peakTimeUnCleared(peakTimeUnCleared~=0);
   peakNGUnCleared=peakNGUnCleared(peakNGUnCleared~=0);
   UnclearsampleNumber= UnclearsampleNumber(UnclearsampleNumber~=0);
   
   %for cleared AND met features
   clearedParameterValues = clearedParameterValues(any(clearedParameterValues,2),:);%remove rows with all 0  
   clearenceTime=clearenceTime(clearenceTime~=0);
   peakTimeCleared=peakTimeCleared(peakTimeCleared~=0);
   peakNGCleared=peakNGCleared(peakNGCleared~=0);
   sampleNumber= sampleNumber(sampleNumber~=0);
   
   %for cleared but did not meet features
   clearedButNotmetFeatures = clearedButNotmetFeatures(any(clearedButNotmetFeatures,2),:);%remove rows with all 0
   clearenceTimeNotmetFeatures=clearenceTimeNotmetFeatures(clearenceTimeNotmetFeatures~=0);
   peakTimeClearedNotmetFeatures=peakTimeClearedNotmetFeatures(peakTimeClearedNotmetFeatures~=0);
   peakNGClearedNotmetFeatures=peakNGClearedNotmetFeatures(peakNGClearedNotmetFeatures~=0);
   sampleNumberNotmetFeatures= sampleNumberNotmetFeatures(sampleNumberNotmetFeatures~=0);
   
   %outcomes
   clearedOutcomes=[sampleNumber',clearenceTime',peakTimeCleared',peakNGCleared'];
   clearedOutcomesNotmetFeatures=[sampleNumberNotmetFeatures',clearenceTimeNotmetFeatures',...
       peakTimeClearedNotmetFeatures',peakNGClearedNotmetFeatures'];
   unclearedOutcomes=[UnclearsampleNumber',peakTimeUnCleared',peakNGUnCleared'];
  
   

%    for j=1:size(clearedParameterValues,1)
%         paraValues=clearedParameterValues(j,:);
%         options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
%         [t,y]=ode45(@(t,y)Natural_infection_model_sensitivity(t,y,paraValues),...
%              0:time,[b,b_n,b_i,n,b_a],options);
%          
%         bacterialLoad=y(:,1)+y(:,2)+y(:,3)+y(:,5);
%         figure(1)
%         plot(t/24,bacterialLoad)
%         set(gca, 'YScale', 'log')
%         hold on
%    end
%    hold off
%    xlabel('time (days)')
%    ylabel('total NG')
%    toc
%    end 
    
   
  
    
    

