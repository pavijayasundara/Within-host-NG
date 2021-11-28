
figure('OuterPosition',[200 -10 3500 3500])


markerSize=10;
for i=1:4
    if i==1
        c=mouseclosedSquaredata();
        a=mouseClsoedSquarecheckingPMNcurve2();
        NGcurve1=a(:,1);
        
       
        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        
        NGdata=c(:,1);
      
        %plotting data
        scatter(1:9,NGdata,'sg','MarkerFaceColor','g')
        
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r');

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse closed square')

    end
    
    if i==2
        c=mousePlusdata();
        a=mousePluscheckingPMNcurve2();
        NGcurve1=a(:,1);
       
        NGdata=c(:,1);
    
      
        %plotting data
        subplot(2,2,i)
        
        scatter(1:9,NGdata,15,'+g')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')
         ylabel('log NG')
        xlabel('time(days)')
        title('mouse Plus')

        
    end
    
    if i==3
        c=openCirclesdata();
        a=mouseOPenCirclescheckingPMNcurve();
        NGcurve1=a(:,1);
  
        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        NGdata=c(:,1);
      %plotting data
        scatter(1:9,NGdata,markerSize,'og')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse open circles')
   
    end
    if i==4
        c=openTianglesdata();
        a=mouseOPenTrianglecheckingPMNcurve2();
        NGcurve1=a(:,1);
        %plotting NG data, fit with only NG and fit with both NG and PMN data
        subplot(2,2,i)
        NGdata=c(:,1);
 
        %plotting data
        scatter(1:9,NGdata,markerSize,'^g')
        hold on
        %plotting NG curve with only NG data
        plot(1:9,NGcurve1,'r')

        ylabel('log NG')
        xlabel('time(days)')
        title('mouse open Triangles')
        
   
        
    end
end



