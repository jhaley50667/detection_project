function [ x ] = tester( varargin )
%x = tester
%x =tester(a1,a2,a3,a4)
%tests the varargin input argument
%arguments
% a1 : some number
% a2 : some number
% a3 : some number
% a4 : some number

clc

a1 = 1; if nargin>=1, a1 = varargin{1}; end
a2 = 2; if nargin>=2, a2 = varargin{2}; end
a3 = 3; if nargin>=3, a3 = varargin{3}; end
a4 = 5; if nargin>=4, a4 = varargin{4}; end

x = a1*a2*a3*a4;

% start system call
system('./code.sh');
prefix = '../scratch';
d=dir(['namelist.input_*']);d={d.name};

display('printing namelist file names');
for i = 1:length(d)
    display(d{i})
end


%start clean up
%system('ls -lh namelist.input_*')

delspec = 'rm %s';
for i=1:length(d)
    %fprintf('Will be deleting file %s\n',d{i})
    delstr = sprintf(delspec,d{i});
    %display(delstr);
    system(delstr)
end

[status, output] = system('ls -lah namelist*')
length(output)

[status, putput] = system('top &')


end

