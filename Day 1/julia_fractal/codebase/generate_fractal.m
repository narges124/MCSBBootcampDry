
z = 4.*rand(10e5,1) - 2;
n = 4i.*rand(10e5,1) - 2i;
p = z + n;
namx_arr = [];
for i=1:10e1
    [nmax, ~] = follow_z(p(i), c);
    nmax_arr(i) = nmax;
end