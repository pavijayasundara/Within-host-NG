function errorBars_all_4micemodels(Qhuman,Qmouse)
h1=scatter(1:5,[Qhuman(1);Qmouse(1,1);Qmouse(2,1);Qmouse(3,1);Qmouse(4,1)],'b','filled');
Cell{1} = {'h','A','B','C','D'};
set(gca,'YTick',[0.0001 0.01 1 10])
%set(gca,'YminorTick','off')
set(gca,'XTick',1:5,'XTickLabel',Cell{1})
hold on
yneg = Qhuman(1)-Qhuman(2);
ypos = Qhuman(3)-Qhuman(1);
g2=errorbar(1,Qhuman(1),yneg,ypos);
g2.Color='b';
g2.LineWidth=1.5;
hold on
for i=1:4%4 mouse models
    yneg = Qmouse(i,1)-Qmouse(i,2);
    ypos = Qmouse(i,3)-Qmouse(i,1);
    h2=errorbar(i+1,Qmouse(i,1),yneg,ypos);
    h2.Color='b';
    h2.LineWidth=1.5;
end
legend([h1,h2],{'median','95%range'},'Box','off',...
    'Position',[0.132839508115509 0.836675826691777 0.102962961020293 0.101710077219085])
end