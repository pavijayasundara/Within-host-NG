function f= mouseclosedCirclesqonly()
% close all
% clear


thours=(1:9)'.*24' ; 

initial=[ 0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000009999982677
   0.128523774865445
   0.800937804190396

];
 
closedSquare=[0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000224421146000
   0.128523774865445
   0.800937804190396

];


openTrianlges=[0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
      0.000005685812129
   0.128523774865445
   0.800937804190396

];


closedTriangles=[ 0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000001012946600
   0.128523774865445
   0.800937804190396

];
mouseX=[ 0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000001047232971
   0.128523774865445
   0.800937804190396
];

mousePlus=[0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000005225426946
   0.128523774865445
   0.800937804190396

];
 

openCircles=[ 0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000004871508297
   0.128523774865445
   0.800937804190396

];
 

openSquare=[ 0.046666179853581
   0.043111045471919
   0.000000000158530
   0.000000006803690
   0.000001003320103
   0.128523774865445
   0.800937804190396

];
 


data=[5.53014553;5.617463617;3.318087318;1.440748441;2.823284823;3.507276507;...
    3.812889813;5.108108108;6.417879418];%in log


optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
openTrianlgesResults=model(openTrianlges,thours);
mouseclosedTrianglesResults=model(closedTriangles,thours);
mouseXResults=model(mouseX,thours);
mousePlusresults=model(mousePlus,thours);
openCirclesresults=model(openCircles,thours);
openSquareresults=model(openSquare,thours);

o1=plot(thours/24,optimum,'b');
hold on 
scatter(thours/24,data,15,'ob','filled')
hold on 
plot(thours/24,closedSquareResults,'--')
hold on
plot(thours/24,openTrianlgesResults,'--')
hold on
plot(thours/24,mouseclosedTrianglesResults,'--')
hold on
plot(thours/24,mouseXResults,'--')
hold on
plot(thours/24,mousePlusresults,'--')
hold on
plot(thours/24,openCirclesresults,'--')
hold on
h1=plot(thours/24,openSquareresults,'--','color',[255,140,0]./255,'LineWidth',1.5);

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
yl = [0 8];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(c)'},'FontName','Arial','FontSize',lfs);    
l=legend([o1,h1],{'best fit m3','changed \eta m3'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);

end
function output= model(para,thours)
    n0=0.01*8.438520438*50010/(1-(0.01*8.438520438));
    b0=[10^5.53014553,0,0,n0,0];
    %b0=[10^4.33,0,0,10^-8];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);
    output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
    output=log10(output);
 
end

