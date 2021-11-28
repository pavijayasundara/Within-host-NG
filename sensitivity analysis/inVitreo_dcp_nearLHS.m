%%checking if the LHS samples that fell near the in vitro estimates can give
%%a longer duration using the in vitro estimates
a=NaN(100,4);
j=1;
for i=1:size(paraValuesabove60,1)
    if(paraValuesabove60(i,10)>0.58 && paraValuesabove60(i,10)<0.86)
    %if(paraValuesabove60(i,10)<0.86)    
        a(j,1)=paraValuesabove60(i,9);
        a(j,2)=paraValuesabove60(i,10);
        a(j,3)=paraValuesabove60(i,11);
        a(j,4)=i;
        j=j+1;
    end
end
