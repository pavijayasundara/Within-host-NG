
clear
close all

data=10.^[5.53014553;5.617463617;3.318087318;1.440748441;2.823284823;3.507276507;...
    3.812889813;5.108108108;6.417879418];

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

initial=[ 0.04
   0.043644016005126
   0.000000000214879
   0.000000007095442
   0.000009999994931
   0.12
   0.8
];


lb=[0,0,1*10^-13,0,0,0,0];
ub=[1,1,1,1,1,1,1];

thours=(1:9)'.*24;

for i=1:numofSamples
   % initial=rand(1,7);
    NGdata=NGsamples(i,:)';
    n0=0.01*8.438520438*50010/(1-(0.01*8.438520438));
    
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
errors;
