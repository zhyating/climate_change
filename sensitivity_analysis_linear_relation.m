clear
clc

file1 = 'H:\Output_scenarios\my2040\ref\wrfout_d04_2040-07-31_19_00_00.nc';
file2 = 'H:\Output_scenarios\my2070\ref\wrfout_d04_2067-08-01_20_00_00.nc';
file3 = 'H:\Output_scenarios\my2100\ref\wrfout_d04_2099-07-23_20_00_00.nc';

old1 = ncread(file1,'TSK'); old2 = ncread(file2,'TSK'); old3 = ncread(file3,'TSK');
ref1 = old1; ref2 = old2; ref3 = old3;
clear old1 file1 old2 file2 old3 file3;

file1 = 'H:\Output_scenarios\my2040\arw\wrfout_d04_2040-07-31_19_00_00.nc';
file2 = 'H:\Output_scenarios\my2040\ap1\wrfout_d04_2040-07-31_19_00_00.nc';
file3 = 'H:\Output_scenarios\my2040\ap2\wrfout_d04_2040-07-31_19_00_00.nc';
file4 = 'H:\Output_scenarios\my2040\gr1\wrfout_d04_2040-07-31_19_00_00.nc';
file5 = 'H:\Output_scenarios\my2040\gr2\wrfout_d04_2040-07-31_19_00_00.nc';


%file1 = 'H:\Output_scenarios\my2040_arw45\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_arw75\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_arw90\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_ap60\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_ap75\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_ap90\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_gr25\wrfout_d04_2040-07-31_19_00_00.nc';
%file1 = 'H:\Output_scenarios\my2040_gr75\wrfout_d04_2040-07-31_19_00_00.nc';
% 

%file1 = 'H:\Output_scenarios\my2067_arw45\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_arw75\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_arw90\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_ap60\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_ap75\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_ap90\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_gr25\wrfout_d04_2067-08-01_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2067_gr75\wrfout_d04_2067-08-01_20_00_00.nc';
% 

%file1 = 'H:\Output_scenarios\my2099_arw45\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_arw75\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_arw90\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_ap60\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_ap75\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_ap90\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_gr25\wrfout_d04_2099-07-23_20_00_00.nc';
%file1 = 'H:\Output_scenarios\my2099_gr75\wrfout_d04_2099-07-23_20_00_00.nc';

mask = ncread(file1,'LANDMASK');
lat = ncread(file1,'XLAT');
lon = ncread(file1,'XLONG');
land = ncread(file1,'LU_INDEX');

old1 = ncread(file1,'TSK');
old1 = ref1 - old1;
new1 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old1(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new1(num) = old1(i,j);
                num = num + 1;
            end
        end
end

old2 = ncread(file2,'TSK');
old2 = ref1 - old2;
new2 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old2(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
end  

old3 = ncread(file3,'TSK');
old3 = ref1 - old3;
new3 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old3(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new3(num) = old3(i,j);
                num = num + 1;
            end
        end
end  

old4 = ncread(file4,'TSK');
old4 = ref1 - old4;
new4 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old4(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new4(num) = old4(i,j);
                num = num + 1;
            end
        end
end  

old5 = ncread(file5,'TSK');
old5 = ref1 - old5;
new5 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old5(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new5(num) = old5(i,j);
                num = num + 1;
            end
        end
end  

new11 = new1; new12 = new2; new13 = new3; new14 = new4; new15 = new5;
clear new1 new2 new3 new4 new5

file1 = 'H:\Output_scenarios\my2070\arw\wrfout_d04_2067-08-01_20_00_00.nc';
file2 = 'H:\Output_scenarios\my2070\ap1\wrfout_d04_2067-08-01_20_00_00.nc';
file3 = 'H:\Output_scenarios\my2070\ap2\wrfout_d04_2067-08-01_20_00_00.nc';
file4 = 'H:\Output_scenarios\my2070\gr1\wrfout_d04_2067-08-01_20_00_00.nc';
file5 = 'H:\Output_scenarios\my2070\gr2\wrfout_d04_2067-08-01_20_00_00.nc';

old1 = ncread(file1,'TSK');
old1 = ref2 - old1;
new1 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old1(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new1(num) = old1(i,j);
                num = num + 1;
            end
        end
end

old2 = ncread(file2,'TSK');
old2 = ref2 - old2;
new2 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old2(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
end  

old3 = ncread(file3,'TSK');
old3 = ref2 - old3;
new3 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old3(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new3(num) = old3(i,j);
                num = num + 1;
            end
        end
end  

old4 = ncread(file4,'TSK');
old4 = ref2 - old4;
new4 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old4(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new4(num) = old4(i,j);
                num = num + 1;
            end
        end
end  

old5 = ncread(file5,'TSK');
old5 = ref2 - old5;
new5 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old5(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new5(num) = old5(i,j);
                num = num + 1;
            end
        end
end  

new6 = new1; new7 = new2; new8 = new3; new9 = new4; new10 = new5;
clear new1 new2 new3 new4 new5

file1 = 'H:\Output_scenarios\my2100\arw\wrfout_d04_2099-07-23_20_00_00.nc';
file2 = 'H:\Output_scenarios\my2100\ap1\wrfout_d04_2099-07-23_20_00_00.nc';
file3 = 'H:\Output_scenarios\my2100\ap2\wrfout_d04_2099-07-23_20_00_00.nc';
file4 = 'H:\Output_scenarios\my2100\gr1\wrfout_d04_2099-07-23_20_00_00.nc';
file5 = 'H:\Output_scenarios\my2100\gr2\wrfout_d04_2099-07-23_20_00_00.nc';

old1 = ncread(file1,'TSK');
old1 = ref3 - old1;
new1 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old1(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new1(num) = old1(i,j);
                num = num + 1;
            end
        end
end

old2 = ncread(file2,'TSK');
old2 = ref3 - old2;
new2 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old2(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
end  

old3 = ncread(file3,'TSK');
old3 = ref3 - old3;
new3 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old3(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new3(num) = old3(i,j);
                num = num + 1;
            end
        end
end  

old4 = ncread(file4,'TSK');
old4 = ref3 - old4;
new4 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old4(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new4(num) = old4(i,j);
                num = num + 1;
            end
        end
end  

old5 = ncread(file5,'TSK');
old5 = ref3 - old5;
new5 = null(1872);

num = 1;
for i = 1:48
        for j =1:39
            if  mask(i,j) ~= 0 && old5(i,j) ~= 0 && land(i,j)>21 && land(i,j)<26
                new5(num) = old5(i,j);
                num = num + 1;
            end
        end
end  

%M1 = mean(new1);
%S1 = std(new1);

