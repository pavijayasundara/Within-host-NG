    %This is for all the samples that met the features with clearence of 1-6 months
    numLHSsamples=size(clearedParameterValues,1);

    percentB_end_all(sum(isnan( percentB_end_all), 2) == numLHSsamples, :) = [];%removes the rows with all columns NaN
    percentBa_end_all(sum(isnan( percentBa_end_all), 2) == numLHSsamples, :) = [];
    percentBi_end_all(sum(isnan( percentBi_end_all), 2) == numLHSsamples, :) = [];
    percentBs_end_all(sum(isnan( percentBs_end_all), 2) == numLHSsamples, :) = [];
    extracellular_end_all(sum(isnan(extracellular_end_all), 2) == numLHSsamples, :) = [];
    inracellular_end_all(sum(isnan( inracellular_end_all), 2) == numLHSsamples, :) = [];
    
    qunatileVals_B_all=NaN(size(percentB_end_all,1),5);%columns 1-6 stores: ...
   % Q1,Q2,Q3,95% range found from 2.5 percentile and 97.5 percentile. 
    %rows are the length of time points
    qunatileVals_Ba_all=NaN(size(percentB_end_all,1),5);
    qunatileVals_Bi_all=NaN(size(percentB_end_all,1),5);
    qunatileVals_Bs_all=NaN(size(percentB_end_all,1),5);
    qunatileVals_extracellular_all=NaN(size(percentB_end_all,1),5);
    qunatileVals_intracellular_all=NaN(size(percentB_end_all,1),5);
    
    for i=1:size(percentB_end_all,1)

        qunatileVals_B_all(i,:)=quantile(percentB_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Ba_all(i,:)=quantile(percentBa_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Bi_all(i,:)=quantile(percentBi_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Bs_all(i,:)=quantile(percentBs_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_extracellular_all(i,:)=quantile(extracellular_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_intracellular_all(i,:)=quantile(inracellular_end_all(i,:),[0.25,0.5,0.75,0.025,0.975]);
        
    
    end
       
