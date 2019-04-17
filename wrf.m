%placeholder script emulating the wrf-sfire program

cores = 13;


fprintf('Wrf starting \n')
for j = 1:cores
    % make rsl files
    system(sprintf('touch rsl.error.%0.4i',j));
    system(sprintf('touch rsl.out.%0.4i',j)); 
end
clear('j');

%clean up
% fprintf('Hit enter to clean up...\n')
% pause
% system('rm -f rsl.*')
    