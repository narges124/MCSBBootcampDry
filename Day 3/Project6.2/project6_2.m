%% section 1-2
% set parameters (birth, death rates)
epsilon = 0.08;
a = 1;
b = 0.2;

% set initial population sizes
v0 = -0.0;
w0 = -0.5;


% write system of odes
dvwdt = @(vw) [vw(1) - ((1 / 3) * (vw(1) ^ 3)) - vw(2);...
                epsilon * (vw(1) + a - (b * vw(2)))];

% solve
[t,vw] = ode45(@(t,x) dvwdt(x),[0 50],[v0;w0]);

% plot
figure; clf; hold on;
plot(t,vw(:,1),'b');
plot(t,vw(:,2),'r');
xlabel('time','FontSize',18);
ylabel('excitability','FontSize',18);
legend('electrical potential','activity of ion pumps');
savefig('2_2.fig');

%% sdection 3
% set parameters (birth, death rates)
epsilon = 0.08;
a = 1;
b = 0.2;

% set initial population sizes
v0 = -1.5;
w0 = -0.5;

I0 = 1.0;
tStart = 40;
tStop = 47;
I =@(t) I0*(t>tStart).*(t<tStop);

% write system of odes
dvwdt = @(t,vw) [vw(1) - ((1 / 3) * (vw(1) ^ 3)) - vw(2) + I(t);...
                epsilon * (vw(1) + a - (b * vw(2)))];

% solve
[t,vw] = ode45(@(t,x) dvwdt(t, x),[0 50],[v0;w0]);

% plot
figure; clf; hold on;
plot(t,vw(:,1),'b');
plot(t,vw(:,2),'r');
xlabel('time','FontSize',18);
ylabel('excitability','FontSize',18);
legend('electrical potential','activity of ion pumps');
savefig('3_1.fig');

%% sdection 4.1
% set parameters (birth, death rates)
epsilon = 0.08;
a = 1;
b = 0.2;
D = 0.9;

% set initial population sizes
v0 = -1.5:0.1:-0.6;
w0 = -0.5:0.1:0.4;
% write system of odes
dvwdt = @(vw) [vw(1:10) - ((1 / 3) * (vw(1:10) .^ 3)) - vw(11:20) + D *...
    (vw([10,1:9]) - 2 * vw(1:10) + vw([2:10,1]));...
    epsilon * (vw(1:10) + a - (b * vw(11:20)))];

% solve
[T, X] = ode45(@(t,x) dvwdt(x),[0 50],[v0;w0]);

% plot
for nt=1:numel(T)
    figure(5); clf; hold on; box on;
    plot(X(nt,1:10));
    set(gca,'ylim', [-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage');
    drawnow;
end

%% sdection 4.2
% set parameters (birth, death rates)
epsilon = 0.08;
a = 1;
b = 0.2;
D = 0.9;

% set initial population sizes
v0 = -1.5:0.1:-0.6;
w0 = -0.5:0.1:0.4;

I0 = 1.0;
tStart = 40;
tStop = 47;
I =@(t) I0*(t>tStart).*(t<tStop);
I4 = [0; 0; 0; 1; 0; 0; 0; 0; 0; 0];

% write system of odes
dvwdt = @(t, vw) [vw(1:10) - ((1 / 3) * (vw(1:10) .^ 3)) - vw(11:20) + D *...
    (vw([10,1:9]) - 2 * vw(1:10) + vw([2:10,1])) + I4 * I(t);...
    epsilon * (vw(1:10) + a - (b * vw(11:20)))];

% solve
[T, X] = ode45(@(t,x) dvwdt(t, x),[0 50],[v0;w0]);

% plot
for nt=1:numel(T)
    figure(5); clf; hold on; box on;
    plot(X(nt,1:10));
    set(gca,'ylim', [-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage');
    drawnow;
end
