% Matt Bovyn, mbovyn@uci.edu
% Drive generate_fractal.m

% Set model parameter
c = -0.8 - 0.156*1i;

%set the path to the repo
<<<<<<< HEAD
absolutePathToRepo='C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal';
localpath=pwd;

%run generate_fractal script
run(['C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal\codebase\generate_fractal.m'])
=======
absolutePathToRepo='/Users/matthewbovyn/project_code/BootCampDry_allardjun/MCSBBootCampDry/Day 1/julia_fractal';
localpath=pwd;

%run generate_fractal script
run([absolutePathToRepo '/codebase/generate_fractal.m'])
>>>>>>> b2669ee3326c79c3b5000a215f991dc6d3b6e9b6

%save the unique identifier of the git commit used to generate the data
cd(absolutePathToRepo);
system('git log -1 --pretty=format:%H > "CommitUsedHash.txt"');
movefile('CommitUsedHash.txt',[ localpath '/CommitUsedHash.txt'])
cd(localpath);

% Save to file
save('C:\MCSB_boot_camp\MCSBBootcampDry\Day 1\julia_fractal\juliaSet.mat', 'p', 'nmax');