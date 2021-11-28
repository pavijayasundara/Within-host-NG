function totalNGload_above60=totalNGSummary_above60(paraValuesabove60)
%Q1,Q2 and Q3 of the total NG load across all samples



b=1000;%initial size of the unattached bacteria
b_n=0;
b_i=0;
b_a=0;
n=10^-8;%initial neutrophils
time=5000;%duration we are running the model

plottingTime=180*24;
numRows=plottingTime;
numLHSsamples=size(paraValuesabove60,1);
totalNGload_above60=NaN(numRows,numLHSsamples);

for i=1:numLHSsamples
    paraValues=paraValuesabove60(i,:);
    options = odeset('AbsTol',1e-13,'RelTol',1e-11,'Events',@eventfunction);
    [~,y,te,~]=ode45(@(t,y)Natural_infection_model_sensitivity_14paras(t,y,paraValues),...
        0:time,[b,b_n,b_i,n,b_a],options);
    
    %based on the bacterial load aat the last time point
    bacterialLoad=y(:,1)+y(:,2)+y(:,3)+y(:,5);%total bacterial load at all time points
       totalNGload_above60(1:length(bacterialLoad),i)=bacterialLoad;
end