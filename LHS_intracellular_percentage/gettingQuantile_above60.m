    numLHSsamples=size(paraValuesabove60,1);

    percentB_end_above(sum(isnan( percentB_end_above), 2) == numLHSsamples, :) = [];%removes the rows with all columns NaN
    percentBa_end_above(sum(isnan( percentBa_end_above), 2) == numLHSsamples, :) = [];
    percentBi_end_above(sum(isnan( percentBi_end_above), 2) == numLHSsamples, :) = [];
    percentBs_end_above(sum(isnan( percentBs_end_above), 2) == numLHSsamples, :) = [];
    extracellular_end_above(sum(isnan(extracellular_end_above), 2) == numLHSsamples, :) = [];
    inracellular_end_above(sum(isnan( inracellular_end_above), 2) == numLHSsamples, :) = [];
    
    qunatileVals_B_above=NaN(size(percentB_end_above,1),5);%columns 1-6 stores: ...
   % Q1,Q2,Q3,95% range found from 2.5 percentile and 97.5 percentile. 
    %rows are the length of time points
    qunatileVals_Ba_above=NaN(size(percentB_end_above,1),5);
    qunatileVals_Bi_above=NaN(size(percentB_end_above,1),5);
    qunatileVals_Bs_above=NaN(size(percentB_end_above,1),5);
    qunatileVals_extracellular_above=NaN(size(percentB_end_above,1),5);
    qunatileVals_intracellular_above=NaN(size(percentB_end_above,1),5);
    
    for i=1:size(percentB_end_above,1)

        qunatileVals_B_above(i,:)=quantile(percentB_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Ba_above(i,:)=quantile(percentBa_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Bi_above(i,:)=quantile(percentBi_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_Bs_above(i,:)=quantile(percentBs_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_extracellular_above(i,:)=quantile(extracellular_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        qunatileVals_intracellular_above(i,:)=quantile(inracellular_end_above(i,:),[0.25,0.5,0.75,0.025,0.975]);
        
    
    end
       
