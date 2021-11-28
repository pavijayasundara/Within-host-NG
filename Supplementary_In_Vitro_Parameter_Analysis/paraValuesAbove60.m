clearenceTime=clearedOutcomes(:,2);
numResults=length(clearenceTime);
numParas=6;%nuumber of parameters that are in LHS 
paraValuesabove60=zeros(numResults,numParas);%parameter values that result in clearence time above 60
outcomesAbove60=zeros(numResults,3);%Outcomes that result in clearence time above 60
samplesAbove60=zeros(numResults,1);
for i=1:numResults
    if clearenceTime(i)>=60
        paraValuesabove60(i,:)=clearedParameterValues(i,:);
        outcomesAbove60(i,:)=clearedOutcomes(i,[2 3 4]);
        samplesAbove60(i)=i;
    end
end

paraValuesabove60 = paraValuesabove60(any(paraValuesabove60,2),:);
outcomesAbove60 = outcomesAbove60(any(outcomesAbove60,2),:);
samplesAbove60=samplesAbove60(samplesAbove60~=0); 