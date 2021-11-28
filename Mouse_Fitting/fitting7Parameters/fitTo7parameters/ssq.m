function SSE=ssq(x,data)
%x is the estimating parameter set. 'data' is the data:NG data , initial conditions for ODE for
%a particlular mouse

    
    yy=data{:,1};
    initialCond=data{:,2};   
    fitted=model(x,initialCond);
    fitted = fitted(1:24:9*24,:);
    error=fitted-yy;
    SSE=sum(error.^2);
    
            
end