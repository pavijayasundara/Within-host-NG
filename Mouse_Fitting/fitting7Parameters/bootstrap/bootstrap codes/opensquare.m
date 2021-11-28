clear
close all

data=10.^[4.336798337;3.827442827;0.029106029;0;0;0.029106029;0.014553015;0;0.014553015];

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

initial=[0.004227494854058
   0.007044969701125
   0.000000000031187
   0.000211127472063
   0.000001003320103
   0.042372600705623
   0.000999997743138
];


lb=[10^-6,0.007,10^-13,10^-7,10^-6,0,10^-6];
ub=[10^-1,0.05,10^-5,10^-3,10^-3,0.1,10^-3];

thours=(1:9)'.*24;

for i=1:numofSamples
   % initial=rand(1,7);
    NGdata=NGsamples(i,:)';
    n0=0.01*0.44681061*42083/(1-(0.01*0.44681061));
    
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


