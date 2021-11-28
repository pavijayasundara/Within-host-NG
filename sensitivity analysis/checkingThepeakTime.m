peakBelow1andabve5day=[];
for i=1:size(paraValuesabove60)
    if outcomesAbove60(i,2)>2 && outcomesAbove60(i,2)<5
        peakBelow1andabve5day=[peakBelow1andabve5day;i];
    end
end