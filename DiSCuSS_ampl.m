%{
Dynamical State Cell Signaling Simulator (DiSCuSS).
(ligand-receptor simulations, part 1)
  
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

%neurotransmitter-receptor dynamics, stimulus amplitude modulation

close all;
clear all;


t = 0:5000000 ; % us
%t = 0:1:5000000 ;


% NE stimuli
% tau pairs, rise= odd, decay = even

taune1 = 10; % 
taune2 = 500000; 
taune3 = 27000; %
taune4 = 500000; 
taune5 = 91000; % 
taune6 = 500000;
taune7 = 220000; %
taune8 = 500000; 
taune9 = 370000; %
taune10 = 500000; %

taurise=[10, 27000, 91000, 220000, 370000];
tauratios=[0.00002, 0.54, 0.182, 0.44, 0.74];
taurisefold=[2700, 3.37, 2.4, 1.68];
taurisefoldrev=[1.68, 2.4, 3.37, 2700];
taurisefoldrevm1=[1.68, 2.4, 3.37];

%KDne

kDne1 =  14; % 
kDne2 =  2e-1; 
kDne3 =  3e-2;
kDne4 =  6.0e-3;
kDne5 =  3.6e-5; 

kdset=[14, 0.2, 0.03, 0.006, 0.000036];
kdfold=[700, 6.67, 5, 166];


% receptor densities 

rden1 = 10  ; % /um2
rden2 = 100 ;
rden3 = 1000 ;


% NE stimulus waveforms

ne1 = exp(-t/taune2) - exp(-t/taune1);
ne2 = exp(-t/taune4) - exp(-t/taune3);
ne3 = exp(-t/taune6) - exp(-t/taune5);
ne4 = exp(-t/taune8) - exp(-t/taune7);
ne5 = exp(-t/taune10) - exp(-t/taune9);


%beta-AR activation fraction for each waveform


bar_ne1_kd1 = (ne1./(kDne1 + ne1));
bar_ne2_kd1 = (ne2./(kDne1 + ne2));
bar_ne3_kd1 = (ne3./(kDne1 + ne3));
bar_ne4_kd1 = (ne4./(kDne1 + ne4));
bar_ne5_kd1 = (ne5./(kDne1 + ne5));

bar_ne1_kd2 = (ne1./(kDne2 + ne1));
bar_ne2_kd2 = (ne2./(kDne2 + ne2));
bar_ne3_kd2 = (ne3./(kDne2 + ne3));
bar_ne4_kd2 = (ne4./(kDne2 + ne4));
bar_ne5_kd2 = (ne5./(kDne2 + ne5));

bar_ne1_kd3 = (ne1./(kDne3 + ne1));
bar_ne2_kd3 = (ne2./(kDne3 + ne2));
bar_ne3_kd3 = (ne3./(kDne3 + ne3));
bar_ne4_kd3 = (ne4./(kDne3 + ne4));
bar_ne5_kd3 = (ne5./(kDne3 + ne5));

bar_ne1_kd4 = (ne1./(kDne4 + ne1));
bar_ne2_kd4 = (ne2./(kDne4 + ne2));
bar_ne3_kd4 = (ne3./(kDne4 + ne3));
bar_ne4_kd4 = (ne4./(kDne4 + ne4));
bar_ne5_kd4 = (ne5./(kDne4 + ne5));

bar_ne1_kd5 = (ne1./(kDne5 + ne1));
bar_ne2_kd5 = (ne2./(kDne5 + ne2));
bar_ne3_kd5 = (ne3./(kDne5 + ne3));
bar_ne4_kd5 = (ne4./(kDne5 + ne4));
bar_ne5_kd5 = (ne5./(kDne5 + ne5));



%%%%%%%%%%%figures 1st phase %%%%

display ('first phase...')
display ('premiere phase...')


% ne

%{
figure(1)

plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)

plot(t,ne3,'g','linewidth',3)

plot(t,ne4,'b','linewidth',3)

plot(t,ne5,'c','linewidth',3)
legend('\tau_r1', '\tau_r2', '\tau_r3', '\tau_r4','\tau_r5')
xlabel('time')
ylabel('NE (mM)')
%title('NE')

%}


%{

% bar nex kdx

figure(2)

plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)

plot(t,bar_ne3_kd1,'g','linewidth',3)

plot(t,bar_ne4_kd1,'b','linewidth',3)

plot(t,bar_ne5_kd1,'c','linewidth',3)

legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('bar NE kd1')

hold off



figure(3)

plot(t,bar_ne1_kd2,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd2,'r','linewidth',3)

plot(t,bar_ne3_kd2,'g','linewidth',3)

plot(t,bar_ne4_kd2,'b','linewidth',3)

plot(t,bar_ne5_kd2,'c','linewidth',3)

legend ('Bar NE1 kd2','bar NE2 kd2','bar NE3 kd2','bar NE4 kd2','bar NE5 kd2')
title('bar NE kd2')
hold off


figure(4)

plot(t,bar_ne1_kd3,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd3,'r','linewidth',3)

plot(t,bar_ne3_kd3,'g','linewidth',3)

plot(t,bar_ne4_kd3,'b','linewidth',3)

plot(t,bar_ne5_kd3,'c','linewidth',3)

legend ('Bar NE1 kd3','bar NE2 kd3','bar NE3 kd3','bar NE4 kd3','bar NE5 kd3')
title('bar NE kd3')
hold off


figure(5)

plot(t,bar_ne1_kd4,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd4,'r','linewidth',3)

plot(t,bar_ne3_kd4,'g','linewidth',3)

plot(t,bar_ne4_kd4,'b','linewidth',3)

plot(t,bar_ne5_kd4,'c','linewidth',3)

legend ('bar NE1 kd4','bar NE2 kd4','bar NE3 kd4','bar NE4 kd4','bar NE5 kd4')
title('bar NE kd4')
hold off



figure(6)

plot(t,bar_ne1_kd5,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd5,'r','linewidth',3)

plot(t,bar_ne3_kd5,'g','linewidth',3)

plot(t,bar_ne4_kd5,'b','linewidth',3)

plot(t,bar_ne5_kd5,'c','linewidth',3)

legend ('Bar NE1 kd5','bar NE2 kd5','bar NE3 kd5','bar NE4 kd5','bar NE5 kd5')
title('bar NE kd5')

hold off

%}


%%%%%%%%%%%%%%%%%%%

% find peaks of NE stimuli waveforms

pksne1 = findpeaks(ne1);
pksne2 = findpeaks(ne2);
pksne3 = findpeaks(ne3);
pksne4 = findpeaks(ne4);
pksne5 = findpeaks(ne5);


% find peaks of beta-AR receptor activation

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


% create sets

yne=[pksne1, pksne2, pksne3, pksne4, pksne5];
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

% standard deviations of selected sets

Snekd5=std(ykd5);
Snekd4=std(ykd4);
Snekd3=std(ykd3);
Snekd2=std(ykd2);
Snekd1=std(ykd1);

% create set of standard deviations for selected set

Snekdx=[Snekd5, Snekd4, Snekd3, Snekd2, Snekd1];

% use ykd1, ykd2, ykd3, ykd4, ykd5 
% create sets for 3D plots of [NE] vs KD vs. receptor activation

X=[0.00002, 0.054, 0.182, 0.44, 0.74,0.00002, 0.054, 0.182, 0.44, 0.74,0.00002, 0.054, 0.182, 0.44, 0.74,0.00002, 0.054, 0.182, 0.44, 0.74,0.00002, 0.054, 0.182, 0.44, 0.74];

Y=[14.0, 14.0, 14.0, 14.0, 14.0, 0.2, 0.2, 0.2, 0.2, 0.2, 0.03, 0.03, 0.03, 0.03, 0.03, 0.006, 0.006, 0.006, 0.006, 0.006,0.000036, 0.000036, 0.000036, 0.000036, 0.000036]; 

Z=[pkskd11 pkskd12 pkskd13 pkskd14 pkskd15 pkskd21 pkskd22 pkskd23 pkskd24 pkskd25 pkskd31 pkskd32 pkskd33 pkskd34 pkskd35 pkskd54 pkskd44 pkskd34 pkskd24 pkskd14 pkskd51 pkskd52 pkskd53 pkskd54 pkskd55]; 



%%%%%%%%%%%%%%%%%%%%%%%%

% create sets for 3D plots
% discrete points

Tbb= [pksne1 pksne2 pksne3 pksne4 pksne5 pksne1 pksne2 pksne3 pksne4 pksne5 pksne1 pksne2 pksne3 pksne4 pksne5 pksne1 pksne2 pksne3 pksne4 pksne5 pksne1 pksne2 pksne3 pksne4 pksne5];
Kbb= [kDne1 kDne1 kDne1 kDne1 kDne1 kDne2 kDne2 kDne2 kDne2 kDne2 kDne3 kDne3 kDne3 kDne3 kDne3 kDne4 kDne4 kDne4 kDne4 kDne4 kDne5 kDne5 kDne5 kDne5 kDne5];
[TTbb, KKbb]=meshgrid(Tbb,Kbb);
ZZbb=(TTbb./(KKbb + TTbb));

%ZZbb= (log(e^(-t/taune2)-ne1)/log(e^(-t/taune2)+ne1))./ (KKb + (log(e^(-t/taune2)-ne1)/log(e^(-t/taune2)+ne1)))

% smoothed

Tc=(.1104:.00234 :.9996); % this is peak smoothed
Kc =(0.000036:.03684:13.9992); 
[TTc, KKc]=meshgrid(Tc,Kc);
ZZc=(TTc./(KKc + TTc));

% create sets for 3D plots using tau ratios instead of []
% orig 25 tau ratios, discrete

Trr= [taune1/(taune2+taune1) taune3/(taune4+taune3) taune5/(taune6+taune5) taune7/(taune8+taune7) taune9/(taune10+taune9) taune1/(taune2+taune1) taune3/(taune4+taune3) taune5/(taune6+taune5) taune7/(taune8+taune7) taune9/(taune10+taune9) taune1/(taune2+taune1) taune3/(taune4+taune3) taune5/(taune6+taune5) taune7/(taune8+taune7) taune9/(taune10+taune9) taune1/(taune2+taune1) taune3/(taune4+taune3) taune5/(taune6+taune5) taune7/(taune8+taune7) taune9/(taune10+taune9) taune1/(taune2+taune1) taune3/(taune4+taune3) taune5/(taune6+taune5) taune7/(taune8+taune7) taune9/(taune10+taune9)];
Krr= [kDne1 kDne1 kDne1 kDne1 kDne1 kDne2 kDne2 kDne2 kDne2 kDne2 kDne3 kDne3 kDne3 kDne3 kDne3 kDne4 kDne4 kDne4 kDne4 kDne4 kDne5 kDne5 kDne5 kDne5 kDne5];
[TTrr, KKrr]=meshgrid(Trr,Krr);
ZZrr=(TTrr./(KKrr + TTrr)); 

%this is tau1/(tau2 + tau1), smoothed

Td= (0.00002:0.00111916:0.4253); 
Kd=(0.000036:.03684:13.9992); 
[TTd, KKd]=meshgrid(Td,Kd);
ZZd=(TTd./(KKd + TTd));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%{

figure(7)

subplot(4,2,1)
bar(yne,0.4)
b = bar(yne,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
ylim([0 1.1])
axis square

subplot(4,2,6)
bar(ykd1,0.4,'w')
hold on
plot(ykd1,'linewidth',3)
hold off
ylim([0 1.1])
axis square

subplot(4,2,5)
bar(ykd2,0.4,'w')
hold on
plot(ykd2,'linewidth',3)
hold off
ylim([0 1.1])
axis square

subplot(4,2,4)
bar(ykd3,0.4,'w')
hold on
plot(ykd3,'linewidth',3)
hold off
ylim([0 1.1])
axis square

subplot(4,2,3)
bar(ykd4,0.4,'w')
hold on
plot(ykd4,'linewidth',3)
hold off
ylim([0 1.1])
axis square

subplot(4,2,2)
bar(ykd5,0.4,'w')
hold on
plot(ykd5,'linewidth',3)
hold off
ylim([0 1.1])
axis square

subplot(4,2,7)
bar(ykd1,0.4)
b = bar(ykd1,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square
%}

%{
figure(10)

subplot(4,2,1)
plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)

plot(t,ne3,'g','linewidth',3)

plot(t,ne4,'b','linewidth',3)

plot(t,ne5,'c','linewidth',3)
%legend ('NE 1','NE 2','NE 3','NE 4','NE 5')
ylim([0 1.1])
title('NE')
axis square

subplot(4,2,2)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)

plot(t,bar_ne3_kd1,'g','linewidth',3)

plot(t,bar_ne4_kd1,'b','linewidth',3)

plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
ylim([0 1.1])
title('bar NE kd1')
axis square

subplot(4,2,3)
plot(t,bar_ne1_kd2,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd2,'r','linewidth',3)

plot(t,bar_ne3_kd2,'g','linewidth',3)

plot(t,bar_ne4_kd2,'b','linewidth',3)

plot(t,bar_ne5_kd2,'c','linewidth',3)
%legend ('Bar NE1 kd2','bar NE2 kd2','bar NE3 kd2','bar NE4 kd2','bar NE5 kd2')
ylim([0 1.1])
title('bar NE kd2')
axis square

subplot(4,2,4)
plot(t,bar_ne1_kd3,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd3,'r','linewidth',3)

plot(t,bar_ne3_kd3,'g','linewidth',3)

plot(t,bar_ne4_kd3,'b','linewidth',3)

plot(t,bar_ne5_kd3,'c','linewidth',3)
%legend ('Bar NE1 kd3','bar NE2 kd3','bar NE3 kd3','bar NE4 kd3','bar NE5 kd3')
ylim([0 1.1])
title('bar NE kd3')
axis square

subplot(4,2,5)
plot(t,bar_ne1_kd4,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd4,'r','linewidth',3)

plot(t,bar_ne3_kd4,'g','linewidth',3)

plot(t,bar_ne4_kd4,'b','linewidth',3)

plot(t,bar_ne5_kd4,'c','linewidth',3)
%legend ('bar NE1 kd4','bar NE2 kd4','bar NE3 kd4','bar NE4 kd4','bar NE5 kd4')
ylim([0 1.1])
title('bar NE kd4')
axis square

subplot(4,2,6)
plot(t,bar_ne1_kd5,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd5,'r','linewidth',3)

plot(t,bar_ne3_kd5,'g','linewidth',3)

plot(t,bar_ne4_kd5,'b','linewidth',3)

plot(t,bar_ne5_kd5,'c','linewidth',3)
%legend ('Bar NE1 kd5','bar NE2 kd5','bar NE3 kd5','bar NE4 kd5','bar NE5 kd5')
title('bar NE kd5')
ylim([0 1.1])
axis square
hold off

subplot(4,2,7)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)

plot(t,bar_ne3_kd1,'g','linewidth',3)

plot(t,bar_ne4_kd1,'b','linewidth',3)

plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('bar NE kd1')
axis square
%}

%{
figure(11)

subplot(4,2,1)
bar(yne,0.4)
b = bar(yne,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square

subplot(4,2,6)
bar(ykd1,0.4,'k')
b = bar(ykd1,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
ylim([0 1])
axis square

subplot(4,2,5)
bar(ykd2,0.4,'k')
b = bar(ykd2,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square

subplot(4,2,4)
bar(ykd3,0.4,'k')
b = bar(ykd3,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square

subplot(4,2,3)
bar(ykd4,0.4,'k')
b = bar(ykd4,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square

subplot(4,2,2)
bar(ykd5,0.4,'k')
b = bar(ykd5,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square


subplot(4,2,7)
bar(ykd1,0.4,'k')
b = bar(ykd1,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
axis square

%}

%{
figure(12)

subplot(4,2,1)
plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)

plot(t,ne3,'g','linewidth',3)

plot(t,ne4,'b','linewidth',3)

plot(t,ne5,'c','linewidth',3)
%legend ('NE 1','NE 2','NE 3','NE 4','NE 5')
ylim([0 1.1])
title('NE')
axis square

subplot(4,2,6)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)

plot(t,bar_ne3_kd1,'g','linewidth',3)

plot(t,bar_ne4_kd1,'b','linewidth',3)

plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
ylim([0 1.1])
title('bar NE kd1')
axis square


subplot(4,2,5)
plot(t,bar_ne1_kd2,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd2,'r','linewidth',3)

plot(t,bar_ne3_kd2,'g','linewidth',3)

plot(t,bar_ne4_kd2,'b','linewidth',3)

plot(t,bar_ne5_kd2,'c','linewidth',3)
%legend ('Bar NE1 kd2','bar NE2 kd2','bar NE3 kd2','bar NE4 kd2','bar NE5 kd2')
ylim([0 1.1])
title('bar NE kd2')
axis square


subplot(4,2,4)
plot(t,bar_ne1_kd3,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd3,'r','linewidth',3)

plot(t,bar_ne3_kd3,'g','linewidth',3)

plot(t,bar_ne4_kd3,'b','linewidth',3)

plot(t,bar_ne5_kd3,'c','linewidth',3)
%legend ('Bar NE1 kd3','bar NE2 kd3','bar NE3 kd3','bar NE4 kd3','bar NE5 kd3')
ylim([0 1.1])
title('bar NE kd3')
axis square


subplot(4,2,3)
plot(t,bar_ne1_kd4,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd4,'r','linewidth',3)

plot(t,bar_ne3_kd4,'g','linewidth',3)

plot(t,bar_ne4_kd4,'b','linewidth',3)

plot(t,bar_ne5_kd4,'c','linewidth',3)
%legend ('bar NE1 kd4','bar NE2 kd4','bar NE3 kd4','bar NE4 kd4','bar NE5 kd4')
ylim([0 1.1])
title('bar NE kd4')
axis square


subplot(4,2,2)
plot(t,bar_ne1_kd5,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd5,'r','linewidth',3)

plot(t,bar_ne3_kd5,'g','linewidth',3)

plot(t,bar_ne4_kd5,'b','linewidth',3)

plot(t,bar_ne5_kd5,'c','linewidth',3)
%legend ('Bar NE1 kd5','bar NE2 kd5','bar NE3 kd5','bar NE4 kd5','bar NE5 kd5')
title('bar NE kd5')
ylim([0 1.1])
axis square
hold off


subplot(4,2,7)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)

plot(t,bar_ne3_kd1,'g','linewidth',3)

plot(t,bar_ne4_kd1,'b','linewidth',3)

plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('bar NE kd1')
axis square
%}

display ('second phase...')
display ('deuxieme phase...')


%{

figure(13)

subplot(2,7,8)
bar(yne,0.4)
b = bar(yne,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
ylim([0 1.1])
ylabel('peak NE')
xlabel('tau')
axis square

subplot(2,7,13)
bar(ykd1,0.4,'w')
hold on
plot(ykd1,'linewidth',3)
hold off
ylim([0 1.1])
%ylabel('peak \beta2R')
xlabel('tau')
title('Kd1')
axis square

subplot(2,7,12)
bar(ykd2,0.4,'w')
hold on
plot(ykd2,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('tau')
title('Kd2')
axis square

subplot(2,7,11)
bar(ykd3,0.4,'w')
hold on
plot(ykd3,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('tau')
title('Kd3')
axis square

subplot(2,7,10)
bar(ykd4,0.4,'w')
hold on
plot(ykd4,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('tau')
title('Kd4')
axis square

subplot(2,7,9)
bar(ykd5,0.4,'w')
hold on
plot(ykd5,'linewidth',3)
hold off
ylim([0 1.1])
xlabel('tau')
ylabel('peak \beta2R')
title('Kd5')
axis square

subplot(2,7,14)
bar(ykd1,0.4)
b = bar(ykd1,0.4);
b.FaceColor = 'flat';
b.CData(1,:) = [0 0 0];
b.CData(2,:) = [1 0 0];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [0 0 1];
b.CData(5,:) = [0 1 1];
xlabel('tau')
title('Kd1')
axis square

subplot(2,7,1)
plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)
plot(t,ne3,'g','linewidth',3)
plot(t,ne4,'b','linewidth',3)
plot(t,ne5,'c','linewidth',3)
%legend ('NE 1','NE 2','NE 3','NE 4','NE 5')
ylim([0 1.1])
ylabel('NE (mM)')
xlabel('time')
%title('NE')
axis square

subplot(2,7,2)
plot(t,bar_ne1_kd5,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd5,'r','linewidth',3)
plot(t,bar_ne3_kd5,'g','linewidth',3)
plot(t,bar_ne4_kd5,'b','linewidth',3)
plot(t,bar_ne5_kd5,'c','linewidth',3)
%legend ('Bar NE1 kd5','bar NE2 kd5','bar NE3 kd5','bar NE4 kd5','bar NE5 kd5')
title('Kd5')
ylim([0 1.1])
ylabel('open \beta2R')
xlabel('time')
axis square
hold off

subplot(2,7,3)
plot(t,bar_ne1_kd4,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd4,'r','linewidth',3)
plot(t,bar_ne3_kd4,'g','linewidth',3)
plot(t,bar_ne4_kd4,'b','linewidth',3)
plot(t,bar_ne5_kd4,'c','linewidth',3)
%legend ('bar NE1 kd4','bar NE2 kd4','bar NE3 kd4','bar NE4 kd4','bar NE5 kd4')
ylim([0 1.1])
title('Kd4')
xlabel('time')
axis square

subplot(2,7,4)
plot(t,bar_ne1_kd3,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd3,'r','linewidth',3)
plot(t,bar_ne3_kd3,'g','linewidth',3)
plot(t,bar_ne4_kd3,'b','linewidth',3)
plot(t,bar_ne5_kd3,'c','linewidth',3)
%legend ('Bar NE1 kd3','bar NE2 kd3','bar NE3 kd3','bar NE4 kd3','bar NE5 kd3')
ylim([0 1.1])
title('Kd3')
xlabel('sec')
axis square

subplot(2,7,5)
plot(t,bar_ne1_kd2,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd2,'r','linewidth',3)
plot(t,bar_ne3_kd2,'g','linewidth',3)
plot(t,bar_ne4_kd2,'b','linewidth',3)
plot(t,bar_ne5_kd2,'c','linewidth',3)
%legend ('Bar NE1 kd2','bar NE2 kd2','bar NE3 kd2','bar NE4 kd2','bar NE5 kd2')
ylim([0 1.1])
title('Kd2')
xlabel('sec')
axis square

subplot(2,7,6)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)
plot(t,bar_ne3_kd1,'g','linewidth',3)
plot(t,bar_ne4_kd1,'b','linewidth',3)
plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('Kd1')
ylim([0 1.1])
xlabel('sec')
axis square
hold off

subplot(2,7,7)
plot(t,bar_ne1_kd1,'k','linewidth',3)
hold on
plot(t,bar_ne2_kd1,'r','linewidth',3)
plot(t,bar_ne3_kd1,'g','linewidth',3)
plot(t,bar_ne4_kd1,'b','linewidth',3)
plot(t,bar_ne5_kd1,'c','linewidth',3)
%legend ('Bar NE1 kd1','bar NE2 kd1','bar NE3 kd1','bar NE4 kd1','bar NE5 kd1')
title('Kd1')
xlabel('sec')
axis square

%}



%{

subplot(3,7,15)
plot(ypksne1,'k')
hold on
plot(ypksne2,'r')
plot(ypksne3,'g')
plot(ypksne4,'b')
plot(ypksne5,'c')
axis square
hold off

subplot(3,7,16)

subplot(3,7,17)

subplot(3,7,18)

subplot(3,7,19)

subplot(3,7,20)

subplot(3,7,21)

%}

%{
figure(14)

subplot(1,3,1) %dif in responsiveness to kd by ne waveform (neuromodulators more sensitive than neurotransmission?
plot(ypksne1,'-ok','MarkerFaceColor','w','linewidth',3)
hold on
plot(ypksne2,'-or','MarkerFaceColor','w','linewidth',3)
plot(ypksne3,'-og','MarkerFaceColor','w','linewidth',3)
plot(ypksne4,'-ob','MarkerFaceColor','w','linewidth',3)
plot(ypksne5,'-oc','MarkerFaceColor','w','linewidth',3)
ylabel('peak \beta2R')
xlabel('Kd')
legend('tau 1', 'tau 2', 'tau 3', 'tau 4', 'tau 5','Location', 'southwest')
axis square
hold off

subplot(1,3,2)
bar(Snekdx,0.4,'k')
ylabel('sdev')
xlabel('Kd')
axis square

subplot(1,3,3)
surf(TT, KK, ZZ)
colormap default
%colorbar('southoutside')
shading interp
xlabel('tau rise')
ylabel('Kd')
zlabel('\beta2R fraction')
axis square


%}

%%%%%%%%%%%%%%%%%%%%%%%%redone panels%%%%%%%%%%%%%%%%%% good figs below

%{
figure(15)

subplot(1,7,1)
plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)
plot(t,ne3,'g','linewidth',3)
plot(t,ne4,'b','linewidth',3)
plot(t,ne5,'c','linewidth',3)
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
title('K_d1 (scaled)')
xlabel('time')
axis square


figure(16)

subplot(1,7,1)
bar(yne,0.4)
b = bar(yne,0.4);
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


figure(18)

plot(Snekdx,'-o','color',[0.7 0 0.7],'MarkerSize',9,'MarkerFaceColor','w','linewidth', 3)
ylabel('st dev','fontsize',18)
xlabel('K_d','fontsize',18)
legend('all \taus', 'Location','northwest')
axis square

%}

%{
figure(19)

surf(TT, KK, ZZ)
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
figure(20)

semilogx(ykd5,'k','linewidth',3)
hold on
semilogx(ykd4,'r','linewidth',3)
semilogx(ykd3,'g','linewidth',3)
semilogx(ykd2,'b','linewidth',3)
semilogx(ykd1,'c','linewidth',3)
hold off
ylim([0 1.1])
axis square
%}

%{
subplot(1,2,2)
plot3(X, Y, Z,'o')
colormap default
xlabel('tau rise')
ylabel('Kd')
zlabel('\beta2R fraction')
axis square
%}

%{
figure(25)

surf(TT, KK, ZZ)
colormap default
%colorbar
shading interp
xlabel('tau rise')
ylabel('Kd')
zlabel('\beta2R fraction')
axis square

%}

%{
figure(33)

surf(TTbb, KKbb, ZZbb)
colormap default
%colorbar('southoutside')
shading interp
xlabel('peak []')
ylabel('K_d','fontsize',18)
zlabel('\beta_2R fraction','fontsize',18)
title('orig 25 points')
axis square

%}

figure(34)

surf(TTc, KKc, ZZc)
colormap default
%colorbar('southoutside')
shading interp
xlabel('peak []')
ylabel('K_d','fontsize',18)
zlabel('\beta_2R fraction','fontsize',18)
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
zlabel('\beta_2R fraction','fontsize',20)
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



%%%%%%%%%%%% froccupy receptor saturation %%%%%%%%%%%%%%%%%%%


figure(55)

subplot(1,1,1)
plot(t,ne1,'k','linewidth',3)
hold on
plot(t,ne2,'r','linewidth',3)
plot(t,ne3,'g','linewidth',3)
plot(t,ne4,'b','linewidth',3)
plot(t,ne5,'c','linewidth',3)
legend('\tau_r1', '\tau_r2','\tau_r3', '\tau_r4', '\tau_r5','Location', 'northeast')
ylim([0 1.1])
ylabel('NE (mM)')
xlabel('time')
%title('NE')
axis square



%{
figure(56)

subplot(5,3,1)
plot(t,Froccupy111,'k','linewidth',3)
hold on
plot(t,Froccupy112,'r','linewidth',3)
plot(t,Froccupy113,'g','linewidth',3)
plot(t,Froccupy114,'b','linewidth',3)
plot(t,Froccupy115,'c','linewidth',3)
title('ne1 den1')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,2)
plot(t,Froccupy121,'k','linewidth',3)
hold on
plot(t,Froccupy122,'r','linewidth',3)
plot(t,Froccupy123,'g','linewidth',3)
plot(t,Froccupy124,'b','linewidth',3)
plot(t,Froccupy125,'c','linewidth',3)
%ylim([0 1.1])
title('ne1 den2')
xlabel('time')
axis square

subplot(5,3,3)
plot(t,Froccupy131,'k','linewidth',3)
hold on
plot(t,Froccupy132,'r','linewidth',3)
plot(t,Froccupy133,'g','linewidth',3)
plot(t,Froccupy134,'b','linewidth',3)
plot(t,Froccupy135,'c','linewidth',3)
%ylim([0 1.1])
title('ne1 den3')
xlabel('time')
axis square


%--------------------

subplot(5,3,4)
plot(t,Froccupy211,'k','linewidth',3)
hold on
plot(t,Froccupy212,'r','linewidth',3)
plot(t,Froccupy213,'g','linewidth',3)
plot(t,Froccupy214,'b','linewidth',3)
plot(t,Froccupy215,'c','linewidth',3)
title('ne2 den1')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,5)
plot(t,Froccupy221,'k','linewidth',3)
hold on
plot(t,Froccupy222,'r','linewidth',3)
plot(t,Froccupy223,'g','linewidth',3)
plot(t,Froccupy224,'b','linewidth',3)
plot(t,Froccupy225,'c','linewidth',3)
title('ne2 den2')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,6)
plot(t,Froccupy231,'k','linewidth',3)
hold on
plot(t,Froccupy232,'r','linewidth',3)
plot(t,Froccupy233,'g','linewidth',3)
plot(t,Froccupy234,'b','linewidth',3)
plot(t,Froccupy235,'c','linewidth',3)
title('ne2 den3')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off

%----------------



subplot(5,3,7)
plot(t,Froccupy311,'k','linewidth',3)
hold on
plot(t,Froccupy312,'r','linewidth',3)
plot(t,Froccupy313,'g','linewidth',3)
plot(t,Froccupy314,'b','linewidth',3)
plot(t,Froccupy315,'c','linewidth',3)
title('ne3 den1')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,8)
plot(t,Froccupy321,'k','linewidth',3)
hold on
plot(t,Froccupy322,'r','linewidth',3)
plot(t,Froccupy323,'g','linewidth',3)
plot(t,Froccupy324,'b','linewidth',3)
plot(t,Froccupy325,'c','linewidth',3)
title('ne3 den2')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,9)
plot(t,Froccupy331,'k','linewidth',3)
hold on
plot(t,Froccupy332,'r','linewidth',3)
plot(t,Froccupy333,'g','linewidth',3)
plot(t,Froccupy334,'b','linewidth',3)
plot(t,Froccupy335,'c','linewidth',3)
title('ne3 den3')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off



%----------------



subplot(5,3,10)
plot(t,Froccupy411,'k','linewidth',3)
hold on
plot(t,Froccupy412,'r','linewidth',3)
plot(t,Froccupy413,'g','linewidth',3)
plot(t,Froccupy414,'b','linewidth',3)
plot(t,Froccupy415,'c','linewidth',3)
title('ne4 den1')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


subplot(5,3,11)
plot(t,Froccupy421,'k','linewidth',3)
hold on
plot(t,Froccupy422,'r','linewidth',3)
plot(t,Froccupy423,'g','linewidth',3)
plot(t,Froccupy424,'b','linewidth',3)
plot(t,Froccupy425,'c','linewidth',3)
title('ne4 den2')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off



subplot(5,3,12)
plot(t,Froccupy431,'k','linewidth',3)
hold on
plot(t,Froccupy432,'r','linewidth',3)
plot(t,Froccupy433,'g','linewidth',3)
plot(t,Froccupy434,'b','linewidth',3)
plot(t,Froccupy435,'c','linewidth',3)
title('ne4 den3')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off


%------------


subplot(5,3,13)
plot(t,Froccupy511,'k','linewidth',3)
hold on
plot(t,Froccupy512,'r','linewidth',3)
plot(t,Froccupy513,'g','linewidth',3)
plot(t,Froccupy514,'b','linewidth',3)
plot(t,Froccupy515,'c','linewidth',3)
title('ne5 den1')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off



subplot(5,3,14)
plot(t,Froccupy521,'k','linewidth',3)
hold on
plot(t,Froccupy522,'r','linewidth',3)
plot(t,Froccupy523,'g','linewidth',3)
plot(t,Froccupy534,'b','linewidth',3)
plot(t,Froccupy525,'c','linewidth',3)
title('ne5 den2')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off




subplot(5,3,15)
plot(t,Froccupy531,'k','linewidth',3)
hold on
plot(t,Froccupy532,'r','linewidth',3)
plot(t,Froccupy533,'g','linewidth',3)
plot(t,Froccupy534,'b','linewidth',3)
plot(t,Froccupy535,'c','linewidth',3)
title('ne5 den3')
%ylim([0 1.1])
ylabel('\beta_2R saturation')
xlabel('time')
axis square
hold off

%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

display ('end ...but wait for the figures')
display ('fin ...mais attendez les graphiques')

