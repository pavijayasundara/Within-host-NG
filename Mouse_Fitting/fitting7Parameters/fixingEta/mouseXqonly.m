function f= mouseXqonly()
% close all
% clear

linewidth=1.5;

thours=(1:9)'.*24' ; 

initial=[    0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000001047232971
   0.047956972142040
   0.000999983550536


];
 
closedSquare=[   0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
    0.000224421146000
   0.047956972142040
   0.000999983550536

];


openTrianlges=[    0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000005685812129
   0.047956972142040
   0.000999983550536

];


mouseClosedCircles=[    0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
      0.000009999982677
   0.047956972142040
   0.000999983550536

];

closedTriangles=[   0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000001012946600
   0.047956972142040
   0.000999983550536

];

mousePlus=[     0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000005225426946
   0.047956972142040
   0.000999983550536
];

openCircles=[      0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000004871508297
   0.047956972142040
   0.000999983550536
];

openSquare=[    0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
  0.000001003320103
   0.047956972142040
   0.000999983550536
];

data=[4.303948332;3.724314865;0.011636498;0.010606525;-0.004492433;...
   0.008590409;-0.006530464;-0.007538522;0.005588149];%in log


optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
openTrianlgesResults=model(openTrianlges,thours);
mouseclosedTrianglesResults=model(closedTriangles,thours);
mouseClosedCirclesResults=model(mouseClosedCircles,thours);
mousePlusresults=model(mousePlus,thours);
openCirclesresults=model(openCircles,thours);
openSquareresults=model(openSquare,thours);

o1=plot(thours/24,optimum,'b');
hold on 
scatter(thours/24,data,15,'xb')
hold on 
plot(thours/24,closedSquareResults,'--')
hold on
plot(thours/24,openTrianlgesResults,'--')
hold on
plot(thours/24,mouseclosedTrianglesResults,'--')
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

set(gca, 'FontSize', 16)

set(gca, 'FontSize', 16)
set(gca,'box','off')
xo = 0.2;
yo = 0.12;
xl = [1 9];
yl = [-0.5 5];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(d)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m4','changed \eta m4'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);

end
function output= model(para,thours)
    n0=0.01*9.085822988*65861/(1-(0.01*9.085822988));
    b0=[10^4.303948332,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);


    output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
    output=log10(output);
 
end


