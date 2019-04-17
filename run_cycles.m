function output = run_cycles(num_cycles)
% output = run_cycles(num_cycles)
% function runs the cycling routine
% Inputs:
%   num_cycles - Integer number of cycles to run
% Output:
%   output - integer indicating success or failure

%default is failure
output = 0;

%struct for holding all information
sim_struct = [];

for i = 1:num_cycles
    
    fprintf("Starting  cycle %i \n",i);
    
    %running cycles script
    %cycles(i);
    
    %starting wrf-sfire
    %system('qsub run_wrf.colibri')
    fprintf("Running wrf-sfire\n");
    wrf;
    
    
    %monitoring wrf to check for success... 
    % how to best do this
    d_e = dir('rsl.err*');
    fprintf('Monitoring wrf. %i rsl.error.* files detected \n',length(d_e));
    for j = 1:length(d_e)
        check = system(sprintf('grep SUCCESS %s',d_e(j).name));
    end
        
    
    %book keeping
    make_dir = sprintf('mkdir cycle_%0.2i',i);
    sim_struct(i).directory = sprintf('cycle_%0.2i',i);
    system(make_dir);
    
    fprintf('Moving rsl files into cycle directory\n');
    mv_rsl = sprintf('mv rsl* %s/.',sim_struct(i).directory);
    system(mv_rsl);
    
    fprintf('Moving wrfout file into cycle directory\n');
    
end
end