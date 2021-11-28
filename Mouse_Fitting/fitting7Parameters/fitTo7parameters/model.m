function output= model(x,initial)
    %takes as input inital condition s to the ODE and estimating parameters
    
    options = odeset('RelTol',1e-6);
    [~,values] = ode45(@mouse_ode_eq,(24:1:(9*24)),initial,options,x);
    output=values(:,1)+values(:,2)+values(:,3);
    output=log10(output);

end

 