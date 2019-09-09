% Matt Bovyn, mbovyn@uci.edu
% Drive generate_fractal.m

% Set model parameter
c = -0.8 - 0.156*1i;

%set the path to the repo
absolutePathToRepo='C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal';
localpath=pwd;

%run generate_fractal script
run(['C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal\codebase\generate_fractal.m'])

%save the unique identifier of the git commit used to generate the data
system(['cd "' absolutePathToRepo '";' ...
    ' git log -1 --pretty=format:%H > "CommitUsedHash.txt";' ...
    'mv CommitUsedHash.txt "' localpath '"']);

% Save to file
save('C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal\juliaSet.mat', 'p', 'nmax');