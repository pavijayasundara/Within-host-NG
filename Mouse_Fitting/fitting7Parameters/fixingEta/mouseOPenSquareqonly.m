function f= mouseOPenSquareqonly()
% close all
% clear

linewidth=1.5;
thours=(1:9)'.*24' ; 

   initial=[  0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000001003320103
   0.042372600705623
   0.000999997743138

];
 
closedSquare=[0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000224421146000
   0.042372600705623
   0.000999997743138
];


openTrianlges=[0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
     0.000005685812129
   0.042372600705623
   0.000999997743138
];

mouseX=[ 0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000001047232971
   0.042372600705623
   0.000999997743138
];
mouseClosedCircles=[ 0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
      0.000009999982677
   0.042372600705623
   0.000999997743138
];

   mousePlus=[ 0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
  0.000005225426946
   0.042372600705623
   0.000999997743138

];
   openCircles=[  0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
     0.000004871508297
   0.042372600705623
   0.000999997743138

];
   openSquare=[ 0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000001003320103
   0.042372600705623
   0.000999997743138

];

data=[4.336798337;3.827442827;0.029106029;0;0;0.029106029;0.014553015;0;0.014553015];%in log


optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
openTrianlgesResults=model(openTrianlges,thours);
mouseXResults=model(mouseX,thours);
mouseClosedCirclesResults=model(mouseClosedCircles,thours);
 mousePlusresults=model( mousePlus,thours);
 openCirclesresults=model(openCircles,thours);
 openSquareresults=model(openSquare,thours);
o1=plot(thours/24,optimum,'b');
hold on 
scatter(thours/24,data,15,'sb')
hold on 
plot(thours/24,closedSquareResults,'--')
hold on
plot(thours/24,openTrianlgesResults,'--')
hold on
plot(thours/24,mouseXResults,'--')
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
yl = [-0.5 4.5];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(f)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m6','changed \eta m6'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);

end
function output= model(para,thours)
    n0=0.01*0.44681061*42083/(1-(0.01*0.44681061));
    b0=[10^4.336798337,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
   [~,values] = ode45(@Equations,thours,b0,options,para);
 
   
 
output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
output=log10(output);
 
end


