
z = 4.*rand(10e6,1) - 2;
n = 4i.*rand(10e6,1) - 2i;
namx = [];
for i=1:11e2
    tmp = follow_z(z(i), n(i));
    nmax(i) = tmp(length(tmp));
end