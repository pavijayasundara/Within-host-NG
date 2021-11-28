%when histograms are plotted there were parameters that showed skewed
%relationships and taking the 90% of the ranges of those parameters.

r1=clearedParameterValues(:,1);
r1_90Percent=quantile(r1,0.1)
mu=clearedParameterValues(:,7);
mu_90Percent=quantile(mu,0.9)
e=clearedParameterValues(:,6);
e_90Percent=quantile(e,0.1)
eta=clearedParameterValues(:,8);
eta_90Percent=quantile(eta,0.9)
d=clearedParameterValues(:,9);
d_90Percent=quantile(d,0.9)
d3=clearedParameterValues(:,13);
d3_90Percent=quantile(d3,0.9)