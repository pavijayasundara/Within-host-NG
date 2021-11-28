function [value, isterminal,direction]=eventfunction(~,y)
    value=y(1)+y(2)+y(3)+y(5)-10^-10;
    isterminal=1;
    direction=0;
end
   
 