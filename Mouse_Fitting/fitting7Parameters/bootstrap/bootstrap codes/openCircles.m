
clear
close all

data=10.^[0.90062855;1.892188654;2.674794694;3.170108331;3.574043432;3.194323059;2.109402156;0.972223302;...
    0.866794005];

numofSamples=30;
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

initial=[ 0.000429065018924
   0.000999999459785
   0.000000002303134
   0.000002252281058
   0.000000013168375
   0.083253021593905
   0.207911278388359
];


lb=[0,0,1*10^-13,0,0,0,0];
ub=[1,1,1,1,1,1,1];
% lb=[0,0,1*10^-13,0,0,0,0];
% ub=[inf,inf,1,1,1,100,100];
% lb=[10^-5,10^-5,1*10^-12,1*10^-8,1*10^-8,0.08,0.2];
% ub=[10^-3,10^-3,1*10^-6,1*10^-3,1*10^-5,0.5,0.8];
thours=(1:9)'.*24;

for i=1:numofSamples
   % initial=rand(1,7);
    NGdata=NGsamples(i,:)';
    n0=(0.01*0.01617414*41667)/(1-(0.01*0.01617414));
    
    
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

