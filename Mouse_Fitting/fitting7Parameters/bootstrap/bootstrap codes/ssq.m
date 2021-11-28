function SSE=ssq(parameters,x)
    time=x(:,1);
    data1=x(:,2);
    int=x(:,3);
    initialCond=[int(1),int(2),int(3),int(4),int(5)] ; 
    fitted=model(parameters,time,initialCond);
    error1=fitted(:,1)-data1;
    SSE=sum(error1.^2);
  
         
end