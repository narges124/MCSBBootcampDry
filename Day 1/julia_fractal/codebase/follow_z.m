function [n, z] = follow_z(z1, c)

n = 1;
z = [];
z(1) = z1;
while (abs(z(n)) <= 2) && (n <= 22)
    z(n+1) = z(n)^2 + c;
    n = n + 1;
end
z = flip(z);
end
