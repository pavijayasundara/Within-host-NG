function f= mouseclosedSquareqonly()
 close all
% clear

    lfs = 16;
    lfn = 'Arial';
    linewidth=1.5;
    markersize=8.5;
    thours=(1:9)'.*24' ; 

   initial=[    0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
   0.000224421146000
   0.120309085128072
   0.528067531657758

];
 
openTrianlges=[     0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
   0.000005685812129
   0.120309085128072
   0.528067531657758

];


mouseClosedCircles=[     0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
  0.000009999982677
   0.120309085128072
   0.528067531657758

];

closedTriangles=[    0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
   0.000001012946600
   0.120309085128072
   0.528067531657758

];
mouseX=[    0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
   0.000001047232971
   0.120309085128072
   0.528067531657758
];

mousePlus=[   0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
   0.000005225426946
   0.120309085128072
   0.528067531657758
];
   
openCircles=[    0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
  0.000004871508297
   0.120309085128072
   0.528067531657758
];
   
 openSquare=[   0.000837354076860
   0.001106310841848
   0.000000008177074
   0.000346089294646
    0.000001003320103
   0.120309085128072
   0.528067531657758
];
   
 
data=[3.128898129;4.22037422;3.128898129;
2.444906445;4.089397089;5.326403326;6.024948025;6.527027027;6.716216216];%in log


optimum=model(initial,thours);

mouseXResults=model(mouseX,thours);
openTrianlgesResults=model(openTrianlges,thours);
mouseclosedTrianglesResults=model(closedTriangles,thours);
mouseClosedCirclesResults=model(mouseClosedCircles,thours);
mousePlusresults=model(mousePlus,thours);
openCirclesresults=model(openCircles,thours);
openSquareresults=model( openSquare,thours);

figure('units','normalized','outerposition',[-0.5 -0.5 1 1])
x0=10;
y0=10;
width=1000;
height=800;
set(gcf,'units','points','position',[x0,y0,width,height])
ax1 = axes('Position',[0.2 0.5 0.5 0.4]);
ax1.ActivePositionProperty = 'outerposition';
subplot(2,4,1)

o1=plot(thours/24,optimum,'b','LineWidth',linewidth);
hold on 
scatter(thours/24,data,10,'sb','filled')
hold on 
plot(thours/24,mouseXResults,'--','LineWidth',linewidth)
hold on
plot(thours/24,openTrianlgesResults,'--','LineWidth',linewidth)
hold on
plot(thours/24,mouseclosedTrianglesResults,'--','LineWidth',linewidth)
hold on
plot(thours/24,mouseClosedCirclesResults,'--','LineWidth',linewidth)
hold on
plot(thours/24,mousePlusresults,'--','LineWidth',linewidth)
hold on
plot(thours/24,openCirclesresults,'--','LineWidth',linewidth)
hold on
h1=plot(thours/24,openSquareresults,'--','color',[255,140,0]./255,'LineWidth',linewidth);

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
yl = [2 8];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(a)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m1','changed \eta m1'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);

subplot(2,4,2)
mousePlusqonly();
subplot(2,4,3)
mouseclosedCirclesqonly();

subplot(2,4,4)

mouseXqonly();
subplot(2,4,5)
mouseclosedTrianglesqonly();
subplot(2,4,6)
mouseOPenSquareqonly();

subplot(2,4,7)
mouseOpenCirclesqonly();
subplot(2,4,8)
mouseOPenTrianglesqonly();


end
function output= model(para,thours)
    n0=0.01*0.230818452*10001/(1-(0.01*0.230818452));
    b0=[10^3.13,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);

    output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
    output=log10(output);
    
end


