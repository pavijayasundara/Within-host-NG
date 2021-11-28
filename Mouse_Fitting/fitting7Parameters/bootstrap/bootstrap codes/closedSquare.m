
clear
close all

data=10.^[3.128898129;4.22037422;3.128898129;
2.444906445;4.089397089;5.326403326;6.024948025;6.527027027;6.716216216];

numofSamples=10;
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


initial=[ 0.000678691120317
   0.000702088089297
   0.000000027878123
   0.124668263172571
   0.790760336921934
    0.1
    0.53
];


lb=[10^-5,10^-5,1*10^-12,1*10^-8,1*10^-8,0.08,0.2];
ub=[10^-3,10^-3,1*10^-6,1*10^-3,1*10^-5,0.5,1.1];


thours=(1:9)'.*24;

for i=1:numofSamples
   % initial=rand(1,7);
    NGdata=NGsamples(i,:)';
     n0=0.01*0.230818452*10001/(1-(0.01*0.230818452));
    
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
errors
