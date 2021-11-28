clear
close all

data=10.^[4.303948332;3.724314865;0.011636498;0.010606525;-0.004492433;...
   0.008590409;-0.006530464;-0.007538522;0.005588149];

numofSamples=100;
NGsamples=zeros(numofSamples,9);

for i=1:9
    NGsamples(:,i)=poissrnd(data(i),numofSamples,1);
end

%to avoid the issue of 0 generating and log10(0)
NGsamples(NGsamples==0) = 0.999;
NGsamples=log10(NGsamples);

NGsamples(1,:)=log10(data)';

d1=zeros(numofSamples,1);
c=zeros(numofSamples,1);
mu=zeros(numofSamples,1);
p=zeros(numofSamples,1);
q=zeros(numofSamples,1);
r3=zeros(numofSamples,1);
r1=zeros(numofSamples,1);
errors=zeros(numofSamples,1);

initial=[  0.004791676008511
   0.010000023385016
   0.000000000027969
   0.000099999864006
   0.000001047232971
   0.047956972142040
   0.000999983550536
];


 lb=[10^-4,0.01,10^-13,10^-6,10^-6,0.02,10^-6];
ub=[10^-2,0.05,10^-5,10^-4,10^-3,0.06,10^-3];
% lb=[10^-5,10^-5,1*10^-12,1*10^-8,1*10^-8,0.08,0.2];
% ub=[10^-3,10^-3,1*10^-6,1*10^-3,1*10^-5,0.5,0.8];
thours=(1:9)'.*24;

for i=1:numofSamples
    %initial=rand(1,7);
    NGdata=NGsamples(i,:)';
    n0=0.01*9.085822988*65861/(1-(0.01*9.085822988));
    
    b02=[10^NGdata(1),0,0,n0,0,0,0,0,0]';
    x=[thours,NGdata,b02];
    
    [xmulti,errormulti]=fmincon(@(parameters)ssq(parameters,x),initial,[],[],[],[],lb,ub,[]);
    
    d1(i)=xmulti(1);
    c(i)=xmulti(2);
    mu(i)=xmulti(3);
    p(i)=xmulti(4);
    q(i)=xmulti(5);
    r3(i)=xmulti(6);
    r1(i)=xmulti(7);
    errors(i)=errormulti;
   
end

b0=[10^NGdata(1),0,0,n0,0];
figure
para1=[d1(1),c(1),mu(1),p(1),q(1),r3(1),r1(1)];
fittedValues=model(para1,thours,b0);
scatter(thours/24,log10(data))
hold on
plot(thours/24,fittedValues,'g')
legend('data','fit')
ylabel('log NG')
xlabel('time(days)')

parameters=[d1,c,mu,p,q,r3,r1];
figure
boxplot(parameters,1:7,'Labels',{'d1','c','mu','p','q','r3','r1'})
errors;
figure
scatter(p,r3)

figure
subplot(3,2,1)
scatter(p,r3)
xlabel('p')
ylabel('r3')
subplot(3,2,2)
scatter(d1,c)
xlabel('d1')
ylabel('c')
subplot(3,2,3)
scatter(d1,mu)
xlabel('d1')
ylabel('mu')
subplot(3,2,4)
scatter(p,q)
xlabel('p')
ylabel('q')
subplot(3,2,5)
scatter(r3,r1)
xlabel('r3')
ylabel('r1')
subplot(3,2,6)
scatter(d1,r1)
xlabel('d1')
ylabel('r1')

