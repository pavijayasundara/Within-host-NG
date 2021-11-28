close all

fontSize=16;
lfs = 16;
lfn = 'Arial';
linewidth=1.5;
markersize=20;

%for figure labels as (a), (b)
xo = 0.12;
yo = 0.12;
    
% %%%%plotting attachment to piliated and non piliated NG
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1)
attachment_a1_a2_estimation


%estimating e,d, and p .
%With r3 of changed value of 0.34 and using death data to estimate d1, c and p (Fitting to both B and Bs populations).
%assuming the neutrophil population remains constant
bacterialDeathWithuncertaintyRanges



%%%%-------------------------------------
 %%%%%plotting internalisation r2 and eta estiamtes.
internalisationWithConfidenceLevel
 
% print('Figure2','-dtiff','-r800');
% 
% print('Figure2','-djpeg','-r800');