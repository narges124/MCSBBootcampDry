%% Section 1-4
% set up initial conditions
Itot = 1;
Ptot = 1;
Ktot = 1;
A0 = 0;
I0 = 1;
AP0 = 0;
IK0 = 0;

% set rates
kAon = 10;
kAoff = 10;
kAcat = 100;

kIon = 10;
kIoff = 10;
kIcat = 10;

% create differential equations
dAdt = @(A, I, AP, IK) - kAon * (Ptot - AP) * A + kAoff * AP + kAcat * IK;
dIdt = @(A, I, AP, IK) - kIon * (Ktot - IK) * I + kIoff * IK + kIcat * AP;
dAPdt = @(A, I, AP, IK) + kAon * (Ptot - AP) * A - kAoff * AP - kIcat * AP;
dIKdt = @(A, I, AP, IK) + kIon * (Ktot - IK) * I - kIoff * IK - kAcat * IK;

dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
        dIdt(x(1),x(2),x(3),x(4));
        dAPdt(x(1),x(2),x(3),x(4));
        dIKdt(x(1),x(2),x(3),x(4))];
    
% solve system
[T,X] = ode45(dxdt,[0,4],[A0, I0, AP0, IK0]);

% plot
figure(1); clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);

legend('A', 'I', 'AP', 'IK');

%% Section 5
% set up initial conditions
Itot = 1;
Ptot = 1;
A0 = 0;
I0 = 1;
AP0 = 0;
IK0 = 0;

% set rates
kAon = 10;
kAoff = 10;
kAcat = 100;

kIon = 10;
kIoff = 10;
kIcat = 10;
A = [];
count = 1;
for Ktot = 1e-3:10e1
    % create differential equations
    dAdt = @(A, I, AP, IK) - kAon * (Ptot - AP) * A + kAoff * AP + kAcat * IK;
    dIdt = @(A, I, AP, IK) - kIon * (Ktot - IK) * I + kIoff * IK + kIcat * AP;
    dAPdt = @(A, I, AP, IK) + kAon * (Ptot - AP) * A - kAoff * AP - kIcat * AP;
    dIKdt = @(A, I, AP, IK) + kIon * (Ktot - IK) * I - kIoff * IK - kAcat * IK;

    dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
            dIdt(x(1),x(2),x(3),x(4));
            dAPdt(x(1),x(2),x(3),x(4));
            dIKdt(x(1),x(2),x(3),x(4))];
    
    % solve system
    [T,X] = ode45(dxdt,[0,4],[A0, I0, AP0, IK0]);
    A(count) = X(length(X), 1);
    count = count + 1;
end

% plot
figure(1); clf; hold on; box on;
plot(log(1e-3:10e1),A);

%% Section 6
% set up initial conditions
Itot = 100;
Ptot = 1;
Ktot = 1;
A0 = 0;
I0 = 1;
AP0 = 0;
IK0 = 0;

% set rates
kAon = 10;
kAoff = 10;
kAcat = 100;

kIon = 10;
kIoff = 10;
kIcat = 10;

% create differential equations
dAdt = @(A, I, AP, IK) - kAon * (Ptot - AP) * A + kAoff * AP + kAcat * IK;
dIdt = @(A, I, AP, IK) - kIon * (Ktot - IK) * I + kIoff * IK + kIcat * AP;
dAPdt = @(A, I, AP, IK) + kAon * (Ptot - AP) * A - kAoff * AP - kIcat * AP;
dIKdt = @(A, I, AP, IK) + kIon * (Ktot - IK) * I - kIoff * IK - kAcat * IK;

dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
        dIdt(x(1),x(2),x(3),x(4));
        dAPdt(x(1),x(2),x(3),x(4));
        dIKdt(x(1),x(2),x(3),x(4))];
    
% solve system
[T,X] = ode45(dxdt,[0,4],[A0, I0, AP0, IK0]);

% plot
figure(1); clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);

legend('A', 'I', 'AP', 'IK');