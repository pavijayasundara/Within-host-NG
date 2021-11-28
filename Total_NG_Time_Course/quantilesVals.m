qunatileVals_totNG=NaN(size(totalNGload,1),5);
for i=1:size(totalNGload,1)
    qunatileVals_totNG(i,:)=quantile(totalNGload(i,:),[0.25,0.5,0.75,0.025,0.975]);
end
qunatileVals_totNG(sum(isnan(qunatileVals_totNG), 2) == 5, :) = [];%
