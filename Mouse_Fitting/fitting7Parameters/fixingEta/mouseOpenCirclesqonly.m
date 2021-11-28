function f=mouseOpenCirclesqonly()
%in here the q was %taken from other mice
% close all
% clear

    linewidth=1.5;
  
initial=[    0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
   0.000004871508297
   0.086432589082197
   0.797578758736272

];

closedSquare=[      0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
   0.000224421146000
   0.086432589082197
   0.797578758736272

];

mouseX=[    0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
   0.000001047232971
   0.086432589082197
   0.797578758736272


];

closedCircles=[     0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
      0.000009999982677
   0.086432589082197
   0.797578758736272
];

closedTriangles=[   0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
     0.000001012946600
   0.086432589082197
   0.797578758736272
];

openSquare=[    0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
      0.000001003320103
   0.086432589082197
   0.797578758736272

];

mousePlus=[    0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
      0.000005225426946
   0.086432589082197
   0.797578758736272

];


openTriangles=[   0.000020714163488
   0.000023390900799
   0.000000999597309
   0.000000011170354
  0.000005685812129
   0.086432589082197
   0.797578758736272
];
thours=(1:9)'.*24';
 
data=[0.90062855;1.892188654;2.674794694;3.170108331;3.574043432;3.194323059;2.109402156;0.972223302;...
    0.866794005];
PMNdata=[0.21857498;0.454486113;2.302262874;8.04016431;1.999194463;1.427716494;35.28320858;27.13502369;10^-1];%adjusted PMN data per 100 cells
PMNdata=log10(PMNdata);

optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
mouseXresults=model(mouseX,thours);
closedCircesresults=model(closedCircles,thours);
closedTrianglesresults=model(closedTriangles,thours);
openSquareresults=model(openSquare,thours);
openCirclesresults=model(mousePlus,thours);
openTrianglesresults=model(openTriangles,thours);
scatter(thours/24,data,15,'ob')
hold on 
o1=plot(thours/24,optimum,'b');
hold on 

%plot(thours/24,closedSquareResults)
hold on 
plot(thours/24,mouseXresults,'--')
hold on
plot(thours/24,closedCircesresults,'--')
hold on
plot(thours/24,closedTrianglesresults,'--')
hold on
plot(thours/24,openSquareresults,'--')
hold on
plot(thours/24,openCirclesresults,'--')
hold on

h1=plot(thours/24,openTrianglesresults,'--','color',[255,140,0]./255,'LineWidth',linewidth)
%legend('data','optimum','a','e','f','g')
    lfs = 16;
    lfn = 'Arial';
    linewidth=1.5;
    markersize=8.5;
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
yl = [0 4];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(g)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m7','changed \eta m7'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);
end

function output= model(para,thours)
     n0=(0.01*0.01617414*41667)/(1-(0.01*0.01617414));
b0=[10^0.9,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
   [~,values] = ode45(@Equations,thours,b0,options,para);
 
  
 
output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
output=log10(output);
 
end

