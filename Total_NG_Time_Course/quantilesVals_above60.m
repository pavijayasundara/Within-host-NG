qunatileVals_totNG_above60=NaN(size(totalNGload_above60,1),5);
for i=1:size(totalNGload_above60,1)
    qunatileVals_totNG_above60(i,:)=quantile(totalNGload_above60(i,:),[0.25,0.5,0.75,0.025,0.975]);
end
qunatileVals_totNG_above60(sum(isnan(qunatileVals_totNG_above60), 2) == 5, :) = [];%
