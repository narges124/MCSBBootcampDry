% nargesr@uci.edu
%% section 1
% actin filament
out = zeros(1000);
out(1) = 1;
for i=2:1000
    rnd = rand();
    if rnd == 0
        out(i) = 1;
    elseif rnd < 0.5 && out(i-1) > 1
        out(i) = out(i-1) - 1;
    elseif rnd < 0.5
        out(i) = out(i-1);
    else
        out(i) = out(i-1) + 1;
    end
end

figure;
plot(out);
xlabel('Time (steps)');
ylabel('Length (number of  monomers)');

%% section 2 (fixed timestep monte carlo)
p = 0;
for i=1:10000
    if rand() < 0.25
        p = p + 1;
    end
end
disp(p);
disp('p * 10000 is about 2500');

%----------

out = zeros(1000);
out(1) = 1;
kon = 1000;
koff = 2;
time = 0;
for i=2:1000
    dt = (1/min(kon,koff))*(1/100);
    time = time + dt;
    if rand() < kon * dt && out(i-1) > 1;
        out(i) = out(i-1) - 1;
    else
        out(i) = out(i-1);
    end
    if rand() < koff * dt
        out(i) = out(i-1) + 1;
    else
        out(i) = out(i-1);
    end
end
fprintf('Time is  %f\n', time);

figure;
plot(out);
title('fixed timestep monte carlo');
xlabel('Time (steps)');
ylabel('Length (number of  monomers)');
figure;
histogram(out);
title('fixed timestep monte carlo (histogram)');
ylabel('Number of time steps');
xlabel('Length (number of  monomers)');

%% section 4 (Gillespie / next event)
exp = 0;
for i=1:10000
    exp = exp + exprnd(5);
end
fprintf('The mean of 10,000 random numbers made with exprnd(5) is %f\n', (exp / 10000));

kon = 70;
koff = 5;
time_total = 5;
time_step = 0.1;
kon_set = 0:time_step:kon;
out = zeros(1, length(kon_set));
for i=2:length(kon_set)
    out(i) = 1;
    time = 0;
    while (time < time_total)
        rndkon = exprnd(1/kon);
        rndkoff = exprnd(1/koff);
        if rndkon < rndkoff;
            out(i) = out(i-1) + 1;
            time = time + rndkon;
        else
            if out(i) > 1
                out(i) = out(i-1) - 1;
            end
            time = time + rndkoff;
        end
    end
end
fprintf('Time is %f\n', time);

figure;
plot(kon_set, out);
title('Gillespie');
xlabel('Time (steps)');
ylabel('Length (number of  monomers)');
figure;
histogram(out);
title('Gillespie (histogram)');
ylabel('Number of time steps');
xlabel('Length (number of  monomers)');

