function freq = nex_freq(filename)

nvar = 0;
names = [];
types = [];

if(nargin ~= 1)
   disp('1 input arguments are required')
   return
end

if(isempty(filename))
   [fname, pathname] = uigetfile('*.nex', 'Select a Nex file');
	filename = strcat(pathname, fname);
end

fid = fopen(filename, 'r');
if(fid == -1)
	disp('cannot open file');
   return
end

magic = fread(fid, 1, 'int32');
version = fread(fid, 1, 'int32');
comment = fread(fid, 256, 'char');
freq = fread(fid, 1, 'double');
tbeg = fread(fid, 1, 'int32');
tend = fread(fid, 1, 'int32');
nvar = fread(fid, 1, 'int32');
fseek(fid, 260, 'cof');

names = zeros(1, 64);
for i=1:nvar
	types(i) = fread(fid, 1, 'int32');
	var_version = fread(fid, 1, 'int32');
	names(i, :) = fread(fid, [1 64], 'char');
	dummy = fread(fid, 128+8, 'char');
end
names = setstr(names);
fclose(fid);