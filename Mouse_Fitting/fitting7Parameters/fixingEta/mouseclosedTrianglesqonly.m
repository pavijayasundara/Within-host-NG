function f= mouseclosedTrianglesqonly()
% close all
% clear

linewidth=1.5;
thours=(1:9)'.*24' ; 

initial=[    1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000001012946600
   0.089867152149296
   0.982116215532655

];
 
openTrianlges=[    1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
      0.000005685812129
   0.089867152149296
   0.982116215532655

];


mouseClosedCircles=[   1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000009999982677
   0.089867152149296
   0.982116215532655

];

closedSquare=[     1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000224421146000
   0.089867152149296
   0.982116215532655

];
mouseX=[    1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000001047232971
   0.089867152149296
   0.982116215532655
];

   mousePlus=[    1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000005225426946
   0.089867152149296
   0.982116215532655

];
 
openSquare=[    1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
      0.000001003320103
   0.089867152149296
   0.982116215532655

];
 
openCircles=[     1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
  0.000004871508297
   0.089867152149296
   0.982116215532655

];
 

data=[3.114345114;2.823284823;2.503118503;2.022869023;2.124740125;0;0;0.014553015;0.014553015];%in log


optimum=model(initial,thours);
mouseXResults=model(mouseX,thours);
openTrianlgesResults=model(openTrianlges,thours);
mouseclosedSquareResults=model(closedSquare,thours);
mouseClosedCirclesResults=model(mouseClosedCircles,thours);
mousePlusresults=model(mousePlus,thours);
openCirclesresults=model(openCircles,thours);
openSquareresults=model(openSquare,thours);


o1=plot(thours/24,optimum,'b')
hold on 
scatter(thours/24,data,15,'^b','filled')
hold on 
plot(thours/24,mouseXResults,'--')
hold on
plot(thours/24,openTrianlgesResults,'--')
hold on
plot(thours/24,mouseclosedSquareResults,'--')
hold on
plot(thours/24,mouseClosedCirclesResults,'--')
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
yl = [-0.5 3.5];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(e)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m5','changed \eta m5'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);

end
function output= model(para,thours)
    n0=0.01*0.44681061*83333/(1-0.01*0.44681061);
    b0=[10^3.114345114,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);




    output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
    output=log10(output);
 
end


