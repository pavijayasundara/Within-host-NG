
figure('OuterPosition',[200 -10 3500 3500])

markerSize=10;
for i=1:4
    if i==1
        c=mouseXdata();
        a=mouseXcheckingPMNcurve2;
        
        %check if f in mouseXcheckingPMNcurve2 works as error is one vector where as others have 7 rows
        
        NGcurve1=a(:,1);
      
        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        
        NGdata=c(:,1);
        %PMNdata=c(:,2);
        %plotting data
        scatter(1:9,NGdata,markerSize,'xg');
        
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r');

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse X')

        
   end
    
    if i==2
        c=mouseclosedCircles();
       a=mouseclosedCirclescheckingPMNcurve2();
        NGcurve1=a(:,1);


        NGdata=c(:,1);
        subplot(2,2,i)
        
        scatter(1:9,NGdata,15,'og','MarkerFaceColor','g')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')
        hold on

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse closed circles')

 
    end
    
    if i==3
        c=closedTrianglesdata();
       a=mouseclosedTrianglescheckingPMNcurve2();
        NGcurve1=a(:,1);
%         PMNcurve1=a(:,2);
%         NGcurve2=b(:,5);
%         PMNcurve2=b(:,6);
        
       
        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        NGdata=c(:,1);
%         PMNdata=c(:,2);
        %plotting data
        scatter(1:9,NGdata,markerSize,'^g','MarkerFaceColor','g')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')
        hold on
%         plot(1:9,NGcurve2,'k')
%         l=legend('data','NG data only');
%         legendProperties(l);
        ylabel('log NG')
        xlabel('time(days)')
        title('mouse closed triangles')
              
    end
    if i==4
        c=openSquaredata();
       a=mouseOPenSquarecheckingPMNcurve2();
        NGcurve1=a(:,1);

        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        NGdata=c(:,1);
%         PMNdata=c(:,2);
        %plotting data
        scatter(1:9,NGdata,markerSize,'sg')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse open Square')
        
    end

end



