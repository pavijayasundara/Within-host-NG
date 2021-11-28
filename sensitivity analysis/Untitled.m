close all
% for i=1:5402
%     if clearedParameterValues(i,2)<0.5
%         clearedParameterValues(i,2)=NaN;
%     end
% end
% mean(clearedParameterValues(:,2))
% hist(clearedParameterValues(:,2))
% % g1=sum(log10(clearedParameterValues(:,2)))/5402;
% % geomean=10^g1
% newMtx = round((10^3)*clearedParameterValues(:,2))/10^3;
% mode(newMtx)


% for i=1:442
%     if paraValuesabove60(i,2)<0.55
%         paraValuesabove60(i,2)=NaN;
%     end
% end
%mode(paraValuesabove60(:,2))
hist(paraValuesabove60(:,2))
newMtx = round((10^4)*paraValuesabove60(:,2))/10^4;
mode(newMtx)