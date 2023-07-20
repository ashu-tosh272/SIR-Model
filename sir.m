close all

%%
%Reading the data from .csv file
time = readtable('state_wise_daily.csv','range','A2:A217');
time=(table2array(time));
time=(time(1:3:end,1))';
MP=readtable('state_wise_daily.csv','range','Y2:Y217');
MP=table2array(MP);
%%
%Initializing the variables
N=6.79e7;
I=(MP(1:3:end,1))';
R=(MP(2:3:end,1))';
D=(MP(3:3:end,1))';
S=N-I-D;

s=S/N;
i=I/N;
r=R/N;

%%
%Plotting the current data
figure(1);
plot(time,R,'g',time,I,'b',time,D,'r');
xlabel('No of days');
ylabel('No of people');
legend('Recovered','Confirmed cases','Deaths');

%%
%Finding b and k
b=-1*([0 diff(s)]./(s.*i));
b(isnan(b)) = [];
b(isinf(b)) = [];
b=abs(mean(b))
k=([0 diff(r)]./i);
k(isnan(k)) = [];
k(isinf(k)) = [];
k=abs(mean(k))


%%
%Solving the equations
to = 0;
tf =600;
yo = [s(end) i(end) r(end)];
[t y] = ode45('ypsir',[to tf],yo);

%%
%Plotting the prediction
figure(2)
plot(t,y(:,1),t,y(:,2),t,y(:,3))
title('SIR Model');
xlabel('Time')
ylabel('Fraction of number of people')
legend('Susceptible', 'Infected', 'Recovered')
