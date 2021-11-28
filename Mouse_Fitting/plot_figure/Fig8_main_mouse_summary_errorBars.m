close all
%%%load dataForPlottingResults.mat
load('dataForplottingResults')

%human model values
r1h=clearedParameterValues(:,1);%replication rate  of unattached bacteria range from LHS samples
ph=clearedParameterValues(:,11);%proportion surving within PMN
d1h=clearedParameterValues(:,9);%rate that NG are engulfed by PMN
muh=clearedParameterValues(:,7);%neutrophil activation rate
ch=clearedParameterValues(:,10);%ratio dependent constant
r3h=clearedParameterValues(:,3);%replication of survinvg NG within PMN
etah=clearedParameterValues(:,8);
%parah=[d1h,ch,muh,ph,r3h,r1h];
dovercA=dA./cA;
dovercB=dB./cB;
dovercC=dC./cC;
dovercD=dD./cD;
doverch=d1h./ch;
%mouse

%%
%%%%The labels A, B, C and D refers to: A- mouse model with Bi removed,..
%B- mouse model with Ba and Bi removed, C- mouse model with Bi,Ba and Bs removed, ...
%D-mouse model using all five equations.

%%%%But need to represent to the journal in the format of:
%%%%human, D,A,B,C
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,3,4)
quantile_d1h=quantile(d1h,[0.5,0.025,0.975]);
quantile_dD=quantile(dD,[0.5,0.025,0.975]);
quantile_dA=quantile(dA,[0.5,0.025,0.975]);
quantile_dB=quantile(dB,[0.5,0.025,0.975]);
quantile_dC=quantile(dC,[0.5,0.025,0.975]);
quantilesMouse=[quantile_dD;quantile_dA;quantile_dB;quantile_dC];
errorBars_all_4micemodels(quantile_d1h,quantilesMouse)

set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
ylim([10^-8 10])
xlim([0 6])
set(gca,'YTick',[10^-6 10^-4 10^-2 10^0])
xlabel('d','interpreter','latex')
ylabel('parameter range')
% subplot(2,3,2)
% quantile_ch=quantile(ch,[0.5,0.025,0.975]);
% quantile_cD=quantile(cD,[0.5,0.025,0.975]);
% quantile_cA=quantile(cA,[0.5,0.025,0.975]);
% quantile_cB=quantile(cB,[0.5,0.025,0.975]);
% quantile_cC=quantile(cC,[0.5,0.025,0.975]);
% quantilesMouse=[quantile_cD;quantile_cA;quantile_cB;quantile_cC];
% errorBars_all_4micemodels(quantile_ch,quantilesMouse)
% 
% set(gca,'yscale','log','Box','off')
% set(gca, 'FontSize', 16)
% yt = get(gca, 'YTick');
% set(gca, 'FontSize', 16)
% set(gca,'box','off')
% ylim([10^-6 20])
% xlim([0 6])
% xlabel('c','interpreter','latex')

subplot(2,3,2)
quantile_r1h=quantile(r1h,[0.5,0.025,0.975]);
quantile_r1D=quantile(r1D,[0.5,0.025,0.975]);
quantile_r1A=quantile(r1A,[0.5,0.025,0.975]);
quantile_r1B=quantile(r1B,[0.5,0.025,0.975]);
quantile_r1C=quantile(r1C,[0.5,0.025,0.975]);
quantilesMouse=[quantile_r1D;quantile_r1A;quantile_r1B;quantile_r1C];
errorBars_all_4micemodels(quantile_r1h,quantilesMouse)

set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
ylim([10^-5 10])
xlim([0 6])
set(gca,'YTick',[10^-4 10^-2 10^0 10^1])
xlabel('$$r_1$$','interpreter','latex')
ylabel('parameter range')
% 
subplot(2,3,5)
quantile_r3h=quantile(r3h,[0.5,0.025,0.975]);
quantile_r3D=quantile(r3D,[0.5,0.025,0.975]);
quantile_r3A=quantile(r3A,[0.5,0.025,0.975]);
quantile_r3B=quantile(r3B,[0.5,0.025,0.975]);
%quantile_r3C=quantile(r3C,[0.5,0.025,0.975]);
Qmouse=[quantile_r3D;quantile_r3A;quantile_r3B];
scatter(1:4,[quantile_r3h(1);Qmouse(1,1);Qmouse(2,1);Qmouse(3,1)],'b','filled')
Cell{1} = {'h','A','B','C','D'};
set(gca,'YTick',[10^-2 10^-1 5*10^-1])
set(gca,'XTick',1:4,'XTickLabel',Cell{1})
hold on
yneg = quantile_r3h(1)-quantile_r3h(2);
ypos = quantile_r3h(3)-quantile_r3h(1);
h2=errorbar(1,quantile_r3h(1),yneg,ypos);
h2.Color='b';
h2.LineWidth=1.5;
hold on
for i=1:3%4 mouse models
    yneg = Qmouse(i,1)-Qmouse(i,2);
    ypos = Qmouse(i,3)-Qmouse(i,1);
    h2=errorbar(i+1,Qmouse(i,1),yneg,ypos);
    h2.Color='b';
    h2.LineWidth=1.5;
end

set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
ylim([10^-2 0.8])
xlim([0 5])
xlabel('$$r_3$$','interpreter','latex')
ylabel('parameter range')

subplot(2,3,3)
Nh=(((2.5+7.5)/2)*10^9)*5;
Nm=8.32*10^6;
quantile_muh=quantile(muh*Nh,[0.5,0.025,0.975]);%%These are mu*N
quantile_muD=quantile(muD*Nm,[0.5,0.025,0.975]);
quantile_muA=quantile(muA*Nm,[0.5,0.025,0.975]);
quantile_muB=quantile(muB*Nm,[0.5,0.025,0.975]);
quantile_muC=quantile(muC*Nm,[0.5,0.025,0.975]);
quantilesMouse=[quantile_muD;quantile_muA;quantile_muB;quantile_muC];
errorBars_all_4micemodels(quantile_muh,quantilesMouse)
xlim([0 6])
set(gca,'YTick',[10^-6 10^-4 10^-2 10 10^3])
ylim([10^-6 2*10^3])
set(gca,'yscale','log','Box','off')
set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
xlabel('$$\mu \times N$$','interpreter','latex')
ylabel('parameter range')

subplot(2,3,6)
scatter(1,5.4*10^-5,'k','filled')
hold on
quantile_ph=quantile(ph,[0.5,0.025,0.975]);
yneg = quantile_ph(1)-quantile_ph(2);
ypos = quantile_ph(3)-quantile_ph(1);
h2=errorbar(1,quantile_ph(1),yneg,ypos);
h2.Color='b';
h2.LineWidth=1.5;
hold on 
scatter(1,quantile_ph(1),'b','filled')
bp = gca;
set(gca,'YTick',[10^-5 10^-4 10^-2 10^-1])
ylim([10^-5 1])
set(gca,'yscale','log','Box','off')
set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
set(gca,'Position',[0.706682043423264 0.127496159754224 0.197454319521652 0.32366663094345])
xlabel('p','interpreter','latex')
ylabel('parameter range')
annotation('textbox',...
    [0.746200709617893 0.162322865484583 0.052159739201304 0.036534216335541],...
    'String','mouse',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
set(gca,'XTick',[])
annotation('textbox',...
    [0.745945056387458 0.379294208604185 0.0483299253855096 0.0361695201473029],...
    'String',{'human'},...
    'FontSize',14,...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1],...
    'BackgroundColor',[1 1 1]);%legend({'mouse p'},'Box','off')

% subplot(2,4,7)
% scatter(1,1.08*10^-6,'k','filled')
% hold on
% boxplot(etah)
% bp = gca;
% set(gca,'YTick',[10^-5 0.1 0.5])
% ylim([10^-7 4])
% set(gca,'yscale','log','Box','off')
% set(gca,'yscale','log','Box','off')
% set(gca, 'FontSize', 16)
% yt = get(gca, 'YTick');
% set(gca, 'FontSize', 16)
% set(gca,'box','off')
% xlabel('$$\eta$$','interpreter','latex')
% annotation('textbox',...
%     [0.635881825590871 0.195364238410596 0.0584947025264877 0.043046357615894],...
%     'String','mouse',...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1],'FontSize', 14);
% annotation('rectangle',...
%     [0.593502037489812 0.112582781456954 0.0584947025264877 0.043046357615894],...
%     'Color',[0.941176470588235 0.941176470588235 0.941176470588235],...
%     'FaceColor',[0.937254901960784 0.937254901960784 0.937254901960784]);
% annotation('textbox',...
%     [0.649340594314598 0.399006622516556 0.0491109134278633 0.0470773440758488],...
%     'String',{'human'},...
%     'FitBoxToText','off',...
%     'EdgeColor',[1 1 1],...
%     'BackgroundColor',[1 1 1],'FontSize', 14);


%legend({'mouse eta'},'Box','off')

subplot(2,3,1)
quantile_doverch=quantile(doverch,[0.5,0.025,0.975]);
quantile_dovercD=quantile(dovercD,[0.5,0.025,0.975]);
quantile_dovercA=quantile(dovercA,[0.5,0.025,0.975]);
quantile_dovercB=quantile(dovercB,[0.5,0.025,0.975]);
quantile_dovercC=quantile(dovercC,[0.5,0.025,0.975]);
quantilesMouse=[quantile_dovercD;quantile_dovercA;quantile_dovercB;quantile_dovercC];
errorBars_all_4micemodels(quantile_doverch,quantilesMouse)

set(gca,'yscale','log','Box','off')
set(gca, 'FontSize', 16)
yt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
set(gca,'box','off')
set(gca,'YTick',[5*10^-2 10^0 10^1 10^2])
ylim([5*10^-2 100])
xlim([0 6])
xlabel('$$d\over c$$','interpreter','latex')
ylabel('parameter range')


annotation('textbox',...
    [0.0826376552247709 0.922853729305342 0.0323333333333334 0.0459259259259258],...
    'String',{'(a)'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
     [0.364802396833143 0.916927803379415 0.0323333333333334 0.0459259259259258],...
    'String','(b)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.652004826202483 0.919999999999999 0.0323333333333334 0.0459259259259258],...
    'String','(c)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.0805043652730319 0.446881720430107 0.032333333333333 0.0459259259259256],...
    'String','(d)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.381536847242557 0.448779655231267 0.0323333333333333 0.045925925925926],...
    'String','(e)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.674604468304322 0.444171360300392 0.0323333333333331 0.0459259259259256],...
    'String','(f)',...
    'LineStyle','none',...
    'FontSize',14,...
    'FontName','Arial',...
    'FitBoxToText','off');

print('Fig7','-dtiff','-r600');

%print('Figure_6','-djpeg','-r800');