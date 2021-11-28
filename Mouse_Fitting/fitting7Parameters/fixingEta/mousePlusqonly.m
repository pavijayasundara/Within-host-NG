function f=mousePlusqonly()
%in here the q was %taken from other mice
% close all
% clear

initial=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000005225426946
   0.109601660260155
   0.196163153971005
];

closedSquare=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000224421146000
   0.109601660260155
   0.196163153971005

];

mouseX=[   0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000001047232971
   0.109601660260155
   0.196163153971005

];

closedCircles=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000009999982677
   0.109601660260155
   0.196163153971005

];

closedTriangles=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000001012946600
   0.109601660260155
   0.196163153971005

];

openSquare=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000001003320103
   0.109601660260155
   0.196163153971005
];

openCircles=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
    0.000004871508297
   0.109601660260155
   0.196163153971005
];

openTriangles=[0.000010482823990
   0.000027899927036
   0.000000115163514
   0.000051319721006
   0.000005685812129
   0.109601660260155
   0.196163153971005
];

thours=(1:9)'.*24';
 
data=[4.38045738;3.929313929;5.108108108;2.925155925;2.343035343;3.856548857;6.316008316;5.413721414;4.831600832];
PMNdata=[0.21857498;0.454486113;2.302262874;8.04016431;1.999194463;1.427716494;35.28320858;27.13502369;10^-1];%adjusted PMN data per 100 cells
PMNdata=log10(PMNdata);

optimum=model(initial,thours);
closedSquareResults=model(closedSquare,thours);
mouseXresults=model(mouseX,thours);
closedCircesresults=model(closedCircles,thours);
closedTrianglesresults=model(closedTriangles,thours);
openSquareresults=model(openSquare,thours);
openCirclesresults=model(openCircles,thours);
openTrianglesresults=model(openTriangles,thours);




scatter(thours/24,data,15,'+b')
hold on 
o2=plot(thours/24,optimum,'b')
hold on 

plot(thours/24,closedSquareResults,'--')
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
h2=plot(thours/24,openTrianglesresults,'--','color',[255,140,0]./255,'LineWidth',1.5);

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
yl = [2 7];
xlim(xl);
ylim(yl);

text('Position',[min(xl)-xo*diff(xl) max(yl)+yo*diff(yl)],...
     'String',{'(b)'},'FontName','Arial','FontSize',lfs);    
l=legend([o2,h2],{'best fit m2','changed \eta m2'},...
    'FontSize',lfs,'FontName',lfn);
legendProperties(l);
%legend('data','optimum','a','e','f','g')
% xlabel('time (days)')
% ylabel('log NG')
% title('mouse 2')
end

function output= model(para,thours)
    n0=0.01*0.232166297*41665/(1-(0.01*0.232166297));
    b0=[10^4.38045738,0,0,n0,0];
    options = odeset('AbsTol',1e-13,'RelTol',1e-11);
    [~,values] = ode45(@Equations,thours,b0,options,para);


    output=values(:,1)+values(:,2)+values(:,3)+values(:,5);
    output=log10(output);

end


