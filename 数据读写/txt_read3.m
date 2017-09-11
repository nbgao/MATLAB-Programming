filename = 'beltway.dat';
fid = fopen(filename, 'r');
tline = fgetl(fid);
while ischar(tline)
   data = regexp(tline, ',', 'split');
   [data, lat, long] = data{:};
   time = datenum(date, 'dd/mm/yyyy');
   lat = str2num(lat);
   long = str2num(long);
   tline = fgetl(fid);
end
fclose(fid);