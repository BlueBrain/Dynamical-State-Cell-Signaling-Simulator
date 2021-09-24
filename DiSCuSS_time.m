%{
Dynamical State Cell Signaling Simulator (DiSCuSS).
(ligand-receptor simulations, part 2)
  
Copyright (c) Blue Brain Project/EPFL [2021] [Dynamical State Cell Signaling Simulator (DiSCuSS]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


ACKNOWLEDGEMENTS:
The development of this software was supported by funding to the Blue Brain Project, a research center of the École polytechnique fédérale de Lausanne (EPFL), from the Swiss government’s ETH Board of the Swiss Federal Institutes of Technology, as well as a CRG grant from King Abdullah University of Science and Technology “KAUST-EPFL Alliance for Integrative Modeling of Brain Energy Metabolism” [OSR-2017-CRG6-3438]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}

%neurotransmitter-receptor dynamics, stimulus time modulation


%neurotransmitter-receptor dynamics, part 2

close all;
clear all;


t = 0:5000000 ;

%KDne

kDne1 =  14; %
kDne2 =  2e-1; %
kDne3 =  3e-2; %
kDne4 =  6.0e-3; %
kDne5 =  3.6e-5; %

kdset=[14, 0.2, 0.03, 0.006, 0.000036];
kdfold=[700, 6.67, 5, 166];

% NE stimuli
% tau pairs, rise= odd, decay = even

taune1b = 10; 
taune2b = 500000; 
taune3b = 10; 
taune4b = 800000; 
taune5b = 10;
taune6b = 1200000; 
taune7b = 10;
taune8b = 1700000; 
taune9b = 10;
taune10b = 2300000;


% NE stimuli waveforms

ne1b = exp(-t/taune2b) - exp(-t/taune1b);
ne2b = exp(-t/taune4b) - exp(-t/taune3b);
ne3b = exp(-t/taune6b) - exp(-t/taune5b);
ne4b = exp(-t/taune8b) - exp(-t/taune7b);
ne5b = exp(-t/taune10b) - exp(-t/taune9b);


% Find peaks of NE stimuli

pksne1b = findpeaks(ne1b);
pksne2b = findpeaks(ne2b);
pksne3b = findpeaks(ne3b);
pksne4b = findpeaks(ne4b);
pksne5b = findpeaks(ne5b);

% beta-AR activation fraction for each waveform

bar_ne1_kd1 = (ne1b./(kDne1 + ne1b));
bar_ne2_kd1 = (ne2b./(kDne1 + ne2b));
bar_ne3_kd1 = (ne3b./(kDne1 + ne3b));
bar_ne4_kd1 = (ne4b./(kDne1 + ne4b));
bar_ne5_kd1 = (ne5b./(kDne1 + ne5b));

bar_ne1_kd2 = (ne1b./(kDne2 + ne1b));
bar_ne2_kd2 = (ne2b./(kDne2 + ne2b));
bar_ne3_kd2 = (ne3b./(kDne2 + ne3b));
bar_ne4_kd2 = (ne4b./(kDne2 + ne4b));
bar_ne5_kd2 = (ne5b./(kDne2 + ne5b));

bar_ne1_kd3 = (ne1b./(kDne3 + ne1b));
bar_ne2_kd3 = (ne2b./(kDne3 + ne2b));
bar_ne3_kd3 = (ne3b./(kDne3 + ne3b));
bar_ne4_kd3 = (ne4b./(kDne3 + ne4b));
bar_ne5_kd3 = (ne5b./(kDne3 + ne5b));

bar_ne1_kd4 = (ne1b./(kDne4 + ne1b));
bar_ne2_kd4 = (ne2b./(kDne4 + ne2b));
bar_ne3_kd4 = (ne3b./(kDne4 + ne3b));
bar_ne4_kd4 = (ne4b./(kDne4 + ne4b));
bar_ne5_kd4 = (ne5b./(kDne4 + ne5b));

bar_ne1_kd5 = (ne1b./(kDne5 + ne1b));
bar_ne2_kd5 = (ne2b./(kDne5 + ne2b));
bar_ne3_kd5 = (ne3b./(kDne5 + ne3b));
bar_ne4_kd5 = (ne4b./(kDne5 + ne4b));
bar_ne5_kd5 = (ne5b./(kDne5 + ne5b));

%%%%%%%%%%%

% find peaks of beta-AR activation

pkskd11= findpeaks(bar_ne1_kd1);
pkskd12= findpeaks(bar_ne2_kd1);
pkskd13= findpeaks(bar_ne3_kd1);
pkskd14= findpeaks(bar_ne4_kd1);
pkskd15= findpeaks(bar_ne5_kd1);

pkskd21= findpeaks(bar_ne1_kd2);
pkskd22= findpeaks(bar_ne2_kd2);
pkskd23= findpeaks(bar_ne3_kd2);
pkskd24= findpeaks(bar_ne4_kd2);
pkskd25= findpeaks(bar_ne5_kd2);

pkskd31= findpeaks(bar_ne1_kd3);
pkskd32= findpeaks(bar_ne2_kd3);
pkskd33= findpeaks(bar_ne3_kd3);
pkskd34= findpeaks(bar_ne4_kd3);
pkskd35= findpeaks(bar_ne5_kd3);

pkskd41= findpeaks(bar_ne1_kd4);
pkskd42= findpeaks(bar_ne2_kd4);
pkskd43= findpeaks(bar_ne3_kd4);
pkskd44= findpeaks(bar_ne4_kd4);
pkskd45= findpeaks(bar_ne5_kd4);

pkskd51= findpeaks(bar_ne1_kd5);
pkskd52= findpeaks(bar_ne2_kd5);
pkskd53= findpeaks(bar_ne3_kd5);
pkskd54= findpeaks(bar_ne4_kd5);
pkskd55= findpeaks(bar_ne5_kd5);

% create sets of peaks

yneb=[pksne1b, pksne2b, pksne3b, pksne4b, pksne5b];
ykd1=[pkskd11, pkskd12, pkskd13, pkskd14, pkskd15];
ykd2=[pkskd21, pkskd22, pkskd23, pkskd24, pkskd25];
ykd3=[pkskd31, pkskd32, pkskd33, pkskd34, pkskd35];
ykd4=[pkskd41, pkskd42, pkskd43, pkskd44, pkskd45];
ykd5=[pkskd51, pkskd52, pkskd53, pkskd54, pkskd55];

ypksne1=[pkskd51,pkskd41,pkskd31,pkskd21,pkskd11];
ypksne2=[pkskd52,pkskd42,pkskd32,pkskd22,pkskd12];
ypksne3=[pkskd53,pkskd43,pkskd33,pkskd23,pkskd13];
ypksne4=[pkskd54,pkskd44,pkskd34,pkskd24,pkskd14];
ypksne5=[pkskd55,pkskd45,pkskd35,pkskd25,pkskd15];

% standard deviations of sets

Snekd5=std(ykd5);
Snekd4=std(ykd4);
Snekd3=std(ykd3);
Snekd2=std(ykd2);
Snekd1=std(ykd1);

Snekdx=[Snekd5, Snekd4, Snekd3, Snekd2, Snekd1];

display('first phase...')
display('premier phase...')



%%%%%%%%%%%%%%%%%%%%%%%%%%% create sets for 3D graphs, [] vs KD vs receptor activation %%%%%%%%


Tb=0.00000435:.00000004:0.00002; % smoothed tau1/tau2
Kb =[0.000036:.03684:13.9992];
[TTb KKb]=meshgrid(Tb,Kb);

ZZb=(TTb./(KKb + TTb));


%ZZb= (log(e^(-t/taune2)-ne1)/log(e^(-t/taune2)+ne1))./ (KKb + (log(e^(-t/taune2)-ne1)/log(e^(-t/taune2)+ne1)))


%%%%%%%%%%%%%

% discrete peaks

Tbb= [pksne1b pksne2b pksne3b pksne4b pksne5b pksne1b pksne2b pksne3b pksne4b pksne5b pksne1b pksne2b pksne3b pksne4b pksne5b pksne1b pksne2b pksne3b pksne4b pksne5b pksne1b pksne2b pksne3b pksne4b pksne5b];
Kbb= [kDne1 kDne1 kDne1 kDne1 kDne1 kDne2 kDne2 kDne2 kDne2 kDne2 kDne3 kDne3 kDne3 kDne3 kDne3 kDne4 kDne4 kDne4 kDne4 kDne4 kDne5 kDne5 kDne5 kDne5 kDne5];
[TTbb KKbb]=meshgrid(Tbb,Kbb);
ZZbb=(TTbb./(KKbb + TTbb));

% smoothed
Tc=[.9998:.00000026 :.9999]; %smoothed peaks
Kc =[0.000036:.03684:13.9992]; 
[TTc KKc]=meshgrid(Tc,Kc);
ZZc=(TTc./(KKc + TTc));


Tr= [taune1b/taune2b taune3b/taune4b taune5b/taune6b taune7b/taune8b taune9b/taune10b taune1b/taune2b taune3b/taune4b taune5b/taune6b taune7b/taune8b taune9b/taune10b taune1b/taune2b taune3b/taune4b taune5b/taune6b taune7b/taune8b taune9b/taune10b taune1b/taune2b taune3b/taune4b taune5b/taune6b taune7b/taune8b taune9b/taune10b taune1b/taune2b taune3b/taune4b taune5b/taune6b taune7b/taune8b taune9b/taune10b];
Kr= [kDne1 kDne1 kDne1 kDne1 kDne1 kDne2 kDne2 kDne2 kDne2 kDne2 kDne3 kDne3 kDne3 kDne3 kDne3 kDne4 kDne4 kDne4 kDne4 kDne4 kDne5 kDne5 kDne5 kDne5 kDne5];
[TTr KKr]=meshgrid(Tr,Kr);
ZZr=(TTr./(KKr + TTr));

% substitute tau1/(tau2 + tau1) for []

% discrete

Trr= [taune1b/(taune2b+taune1b) taune3b/(taune4b+taune3b) taune5b/(taune6b+taune5b) taune7b/(taune8b+taune7b) taune9b/(taune10b+taune9b) taune1b/(taune2b+taune1b) taune3b/(taune4b+taune3b) taune5b/(taune6b+taune5b) taune7b/(taune8b+taune7b) taune9b/(taune10b+taune9b) taune1b/(taune2b+taune1b) taune3b/(taune4b+taune3b) taune5b/(taune6b+taune5b) taune7b/(taune8b+taune7b) taune9b/(taune10b+taune9b) taune1b/(taune2b+taune1b) taune3b/(taune4b+taune3b) taune5b/(taune6b+taune5b) taune7b/(taune8b+taune7b) taune9b/(taune10b+taune9b) taune1b/(taune2b+taune1b) taune3b/(taune4b+taune3b) taune5b/(taune6b+taune5b) taune7b/(taune8b+taune7b) taune9b/(taune10b+taune9b)];
Krr= [kDne1 kDne1 kDne1 kDne1 kDne1 kDne2 kDne2 kDne2 kDne2 kDne2 kDne3 kDne3 kDne3 kDne3 kDne3 kDne4 kDne4 kDne4 kDne4 kDne4 kDne5 kDne5 kDne5 kDne5 kDne5];
[TTrr KKrr]=meshgrid(Trr,Krr);
ZZrr=(TTrr./(KKrr + TTrr));

% smoothed

Td= 0.00002:0.00263153:1; %this is tau1/(tau2 + tau1), smoothed
Kd=[0.000036:.03684:13.9992]; 
[TTd KKd]=meshgrid(Td,Kd);
ZZd=(TTd./(KKd + TTd));


%%%%%%%%%%%%%%%diff taud%%%%%%%%%%
%{

figure(15)

subplot(1,7,1)
plot(t,ne1b,'k','linewidth',3)
hold on
plot(t,ne2b,'r','linewidth',3)
plot(t,ne3b,'g','linewidth',3)
plot(t,ne4b,'b','linewidth',3)
plot(t,ne5b,'c','linewidth',3)
legend('\tau_r1', '\tau_r2','\tau_r3', '\tau_r4', '\tau_r5','Location', 'northeast')
ylim([0 1.1])
ylabel('NE (mM)')
xlabel('time')
%title('NE')
axis square

subplot(1,7,2)
plot(t,bar_ne1_kd5,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd5,'r','linewidth',3)
plot(t,bar_ne3_kd5,'g','linewidth',3)
plot(t,bar_ne4_kd5,'b','linewidth',3)
plot(t,bar_ne5_kd5,'c','linewidth',3)
%legend ('Bar NE1 kd5','bar NE2 kd5','bar NE3 kd5','bar NE4 kd5','bar NE5 kd5')
title('K_d5')
ylim([0 1.1])
ylabel('open \beta_2R')
xlabel('time')
axis square
hold off

subplot(1,7,3)
plot(t,bar_ne1_kd4,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd4,'r','linewidth',3)
plot(t,bar_ne3_kd4,'g','linewidth',3)
plot(t,bar_ne4_kd4,'b','linewidth',3)
plot(t,bar_ne5_kd4,'c','linewidth',3)
%legend ('bar NE1 kd4','bar NE2 kd4','bar NE3 kd4','bar NE4 kd4','bar NE5 kd4')
ylim([0 1.1])
title('K_d4')
xlabel('time')
axis square

subplot(1,7,4)
plot(t,bar_ne1_kd3,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd3,'r','linewidth',3)
plot(t,bar_ne3_kd3,'g','linewidth',3)
plot(t,bar_ne4_kd3,'b','linewidth',3)
plot(t,bar_ne5_kd3,'c','linewidth',3)
%legend ('Bar NE1 kd3','bar NE2 kd3','bar NE3 kd3','bar NE4 kd3','bar NE5 kd3')
ylim([0 1.1])
title('K_d3')
xlabel('time')
axis square

subplot(1,7,5)
plot(t,bar_ne1_kd2,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd2,'r','linewidth',3)
plot(t,bar_ne3_kd2,'g','linewidth',3)
plot(t,bar_ne4_kd2,'b','linewidth',3)
plot(t,bar_ne5_kd2,'c','linewidth',3)
%legend ('Bar NE1 kd2','bar NE2 kd2','bar NE3 kd2','bar NE4 kd2','bar NE5 kd2')
ylim([0 1.1])
title('K_d2')
xlabel('time')
axis square

subplot(1,7,6)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)
plot(t,bar_ne3_kd1,'g','linewidth',3)
plot(t,bar_ne4_kd1,'b','linewidth',3)
plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('K_d1')
ylim([0 1.1])
xlabel('time')
axis square
hold off

subplot(1,7,7)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)
plot(t,bar_ne3_kd1,'g','linewidth',3)
plot(t,bar_ne4_kd1,'b','linewidth',3)
plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('K_d1 (scaled)')
xlabel('time')
axis square

%}

%{

figure(16)

subplot(1,7,1)
bar(yneb,0.4)
b = bar(yneb,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
ylim([0 1.1])
ylabel('peak NE')
xlabel('\tau_r')
axis square

subplot(1,7,6)
bar(ykd1,0.4,'w')
hold on
plot(ykd1,'linewidth',3)
hold off
ylim([0 1.1])
%ylabel('peak \beta2R')
xlabel('\tau_r')
title('K_d1')
axis square

subplot(1,7,5)
bar(ykd2,0.4,'w')
hold on
plot(ykd2,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('\tau_r')
title('K_d2')
axis square

subplot(1,7,4)
bar(ykd3,0.4,'w')
hold on
plot(ykd3,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('\tau_r')
title('K_d3')
axis square

subplot(1,7,3)
bar(ykd4,0.4,'w')
hold on
plot(ykd4,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('\tau_r')
title('K_d4')
axis square

subplot(1,7,2)
bar(ykd5,0.4,'w')
hold on
plot(ykd5,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('\tau_r')
ylabel('peak \beta_2R')
title('K_d5')
axis square

subplot(1,7,7)
bar(ykd1,0.4)
b = bar(ykd1,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
xlabel('\tau_r')
title('K_d1 (scaled)')
axis square

%}

%{
figure(17)

 %dif in responsiveness to kd by ne waveform (neuromodulators more sensitive than neurotransmission?
plot(ypksne1,'-ok','MarkerSize',8,'MarkerFaceColor','w','linewidth',3)
hold on
plot(ypksne2,'-or','MarkerSize',8,'MarkerFaceColor','w','linewidth',3)
plot(ypksne3,'-og','MarkerSize',8,'MarkerFaceColor','w','linewidth',3)
plot(ypksne4,'-ob','MarkerSize',8,'MarkerFaceColor','w','linewidth',3)
plot(ypksne5,'-oc','MarkerSize',8,'MarkerFaceColor','w','linewidth',3)
ylabel('peak \beta_2R','fontsize',18)
xlabel('K_d','fontsize',18)
legend('\tau_r 1', '\tau_r 2','\tau_r 3', '\tau_r 4', '\tau_r 5','Location', 'southwest')
axis square
hold off
%}

%{

figure(18)

%bar(Snekdx,0.4,'k')
%hold on
plot(Snekdx,'-o','color',[0.7 0 0.7],'MarkerSize',9,'MarkerFaceColor','w','linewidth', 3)
ylabel('st dev','fontsize',18)
xlabel('K_d','fontsize',18)
legend('all \taus', 'Location','northwest')
%hold off
axis square

%}

%%%%%%%%%%%%%


display('second phase...')
display('deuxieme phase...')

figure(21)

plot(t,ne1b,'k','linewidth',3)
hold on
plot(t,ne2b,'k','linewidth',3)

plot(t,ne3b,'k','linewidth',3)

plot(t,ne4b,'k','linewidth',3)

plot(t,ne5b,'k','linewidth',3)
legend('\tau_r1', '\tau_r2', '\tau_r3', '\tau_r4','\tau_r5')
xlabel('time')
ylabel('NE (mM)')
title('NE')

%{

figure(22)

surf(TTb, KKb, ZZb)
colormap default
%colorbar('southoutside')
shading interp
xlabel('\tau_1 / \tau_2','fontsize',20)
ylabel('K_d','fontsize',20)
zlabel('\beta_2R fraction','fontsize',20)
%title('smoothed 380 points')
axis square

%}

%{

figure(23)

surf(TTbb, KKbb, ZZbb)
colormap default
%colorbar('southoutside')
shading interp
xlabel('peak []', 'fontsize', 20)
ylabel('K_d','fontsize',20)
zlabel('\beta_2R fraction','fontsize',20)
title('orig 25 points')
axis square
%}



figure(34)

surf(TTc, KKc, ZZc)
colormap default
%colorbar('southoutside')
shading interp
xlabel('peak []', 'fontsize', 20)
ylabel('K_d','fontsize',20)
zlabel('\beta_2R fraction','fontsize',20)
%title('smoothed 380 points')
axis square


%{

figure(35)

surf(TTr, KKr, ZZr)
colormap default
%colorbar('southoutside')
shading interp
xlabel('\tau_1 / \tau_2','fontsize',18)
ylabel('K_d','fontsize',18)
zlabel('\beta_2R fraction','fontsize',18)
title('orig 25 points')
axis square

%}

%{
figure(45)

surf(TTrr, KKrr, ZZrr)
colormap default
%colorbar('southoutside')
shading interp
xlabel('\tau_1 / (\tau_2 + \tau_1)','fontsize',20)
ylabel('K_d','fontsize',20)
zlabel('\beta_2R fraction','fontsize',18)
title('orig 25 points')
axis square
%}

figure(46)

surf(TTd, KKd, ZZd)
colormap default
%colorbar('southoutside')
shading interp
xlabel('\tau_1 / (\tau_2 + \tau_1)','fontsize',20)
ylabel('K_d','fontsize',20)
zlabel('\beta_2R fraction','fontsize',20)
%title('smoothed 380 points')
axis square




%%%%%%%%%%%%%%%%%


display('end ...but wait for the figures')
display('fin ...mais attendez les graphiques')



