
clear
close all

data=10.^[3.114345114;2.823284823;2.503118503;2.022869023;2.124740125;0;0;0.014553015;0.014553015];

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

initial=[ 1.005427580387888
   0.955514895775686
   0.000000000048671
   0.000000010001782
   0.000001012946600
   0.089867152149296
   0.982116215532655
];


% lb=[0,0,1*10^-13,1*10^-7,0,0,0];
% ub=[1,1,1*10^-4,1*10^-3,1*10^-3,1,1];
lb=[1,0.9,10^-12,10^-8,10^-7,0.07,0.8];
ub=[1.1,1.2,10^-3,10^-4,10^-5,0.1,1.2];
thours=(1:9)'.*24;

for i=1:numofSamples
    %initial=rand(1,7);
    NGdata=NGsamples(i,:)';
    n0=0.01*0.44681061*83333/(1-0.01*0.44681061);
    
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
f=parameters;
figure
boxplot(parameters,1:7,'Labels',{'d1','c','mu','p','q','r3','r1'})

