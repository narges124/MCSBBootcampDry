% Simulate a discrete-time dynamical system

% x- population of RABBITS in thousands
% n- time in WEEKS

rNum = 300;

nMax = 500;% max number of days to simulate
x = ones(1,nMax); % population
out = ones(nMax/2, rNum);

count = 0;
k = 0.6;
for r=0:3/rNum:3-3/rNum
    x(1) = 0.5;
    
    for n=1:nMax-1
        x(n+1) = x(n) + r * (1 - (x(n) / k)) * x(n);
        if n > 150
            out(n-150, int64((r + 3/rNum)*rNum/3)) = x(n+1);
        end
    end % finished loop through days
end
figure;
x = 0:3/rNum:3-3/rNum;
plot(x, out,'o');
ylabel('N-cycle');
xlabel('r');
savefig('5.fig');