function f=mouseOPenTrianglesqonly()
%in here the q was %taken from other mice
% close all
% clear
linewidth=1.5;
initial=[    0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000005685812129
   0.085219127319860
   0.354206281873150
];

closedSquare=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000224421146000
   0.085219127319860
   0.354206281873150
];

mouseX=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000001047232971
   0.085219127319860
   0.354206281873150
];

closedCircles=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000009999982677
   0.085219127319860
   0.354206281873150
];

closedTriangles=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000001012946600
   0.085219127319860
   0.354206281873150
];
mousePlus=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
   0.000005225426946
   0.085219127319860
   0.354206281873150
];
openCircles=[   0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
  0.000004871508297
   0.085219127319860
   0.354206281873150
];
openSquare=[    0.000133111660000
   0.000283052201106
   0.000000024628981
   0.000055707782420
      0.000001003320103
   0.085219127319860
   0.354206281873150
];



thours=(1:9)'.*24';
 
data=[3.288981289;4.875259875;4.613305613;5.675675676;5.995841996;6.607068607;4.88981289;5;5.180873181];
PMNdata=[0.21857498;0.454486113;2.302262874;8.04016431;1.999194463;1.427716494;35.28320858;27.13502369;10^-1];%adjusted PMN data per 100 cells
PMNdata=log10(PMNdata);

optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
mouseXresults=model(mouseX,thours);
closedCircesresults=model(closedCircles,thours);
closedTrianglesresults=model(closedTriangles,thours);
mousePlusresults=model(mousePlus,thours);
openCirclesresults=model(openCircles,thours);
openSquareresults=model(openSquare,thours);


scatter(thours/24,data,15,'^b')
hold on 
o1=plot(thours/24,optimum,'b');
hold on 

plot(thours/24,closedSquareResults,'--')
hold on 
plot(thours/24,mouseXresults,'--')
hold on
plot(thours/24,closedCircesresults,'--')
hold on
plot(thours/24,closedTrianglesresults,'--')
hold on
plot(thours/24,mousePlusresults,'--')
hold on
plot(thours/24,openCirclesresults,'--')
hold on
h1=plot(thours/24,openSquareresults,'--','color',[255,140,0]./255,'LineWidth',linewidth);

    lfs = 16;
    lfn = 'Arial';

xlabel('time (days)','FontSize',lfs,'FontName',lfn)
ylabel('log NG','FontSize',lfs,'FontName',lfn)
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xo = 0.2;
yo = 0.12;
xl = [1 9];
yl = [2 6.5];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(h)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m8','changed \eta m8'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);
end

function output= model(para,thours)
    n0=0.01*0.21857498*42500/(1-(0.01*0.21857498));
    b0=[10^3.288981289,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);
 
  
output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
output=log10(output);
 
end


