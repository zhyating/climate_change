clear
clc

file = 'H:\Output_scenarios\2040\ref\wrfout_d04_2040-07-31_08_00_00.nc';
ref1 = ncread(file,'T2');
file = 'H:\Output_scenarios\2040\arw\wrfout_d04_2040-07-31_08_00_00.nc';
s1 = ncread(file,'T2');
file = 'H:\Output_scenarios\2040\ap1\wrfout_d04_2040-07-31_08_00_00.nc';
s2 = ncread(file,'T2');
file = 'H:\Output_scenarios\2040\ap2\wrfout_d04_2040-07-31_08_00_00.nc';
s3 = ncread(file,'T2');
file = 'H:\Output_scenarios\2040\gr1\wrfout_d04_2040-07-31_08_00_00.nc';
s4 = ncread(file,'T2');
file = 'H:\Output_scenarios\2040\gr2\wrfout_d04_2040-07-31_08_00_00.nc';
s5 = ncread(file,'T2');

file = 'H:\Output_scenarios\2070\ref\wrfout_d04_2067-08-02_08_00_00.nc';
ref2 = ncread(file,'T2');
file = 'H:\Output_scenarios\2070\arw\wrfout_d04_2067-08-02_08_00_00.nc';
s6 = ncread(file,'T2');
file = 'H:\Output_scenarios\2070\ap1\wrfout_d04_2067-08-02_08_00_00.nc';
s7 = ncread(file,'T2');
file = 'H:\Output_scenarios\2070\ap2\wrfout_d04_2067-08-02_08_00_00.nc';
s8 = ncread(file,'T2');
file = 'H:\Output_scenarios\2070\gr1\wrfout_d04_2067-08-02_08_00_00.nc';
s9 = ncread(file,'T2');
file = 'H:\Output_scenarios\2070\gr2\wrfout_d04_2067-08-02_08_00_00.nc';
s10 = ncread(file,'T2');

file = 'H:\Output_scenarios\2100\ref\wrfout_d04_2099-07-23_08_00_00.nc';
ref3 = ncread(file,'T2');
file = 'H:\Output_scenarios\2100\arw\wrfout_d04_2099-07-23_08_00_00.nc';
s11 = ncread(file,'T2');
file = 'H:\Output_scenarios\2100\ap1\wrfout_d04_2099-07-23_08_00_00.nc';
s12 = ncread(file,'T2');
file = 'H:\Output_scenarios\2100\ap2\wrfout_d04_2099-07-23_08_00_00.nc';
s13 = ncread(file,'T2');
file = 'H:\Output_scenarios\2100\gr1\wrfout_d04_2099-07-23_08_00_00.nc';
s14 = ncread(file,'T2');
file = 'H:\Output_scenarios\2100\gr2\wrfout_d04_2099-07-23_08_00_00.nc';
s15 = ncread(file,'T2');


new1 = null(1872); new2 = null(1872); new3 = null(1872); new4 = null(1872); new5 = null(1872);
new6 = null(1872); new7 = null(1872); new8 = null(1872); new9 = null(1872); new10 = null(1872);
new11 = null(1872); new12 = null(1872); new13 = null(1872); new14 = null(1872); new15 = null(1872);

mask = ncread(file,'LANDMASK');
land = ncread(file,'LU_INDEX');

old = ref1 - s1;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new11(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref1 - s2;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new12(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref1 - s3;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new13(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref1 - s4;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new14(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref1 - s5;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new15(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref2 - s6;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new6(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref2 - s7;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new7(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref2 - s8;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new8(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref2 - s9;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new9(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref2 - s10;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0  && land(i,j) > 21 && land(i,j) < 26
            new10(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref3 - s11;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new1(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref3 - s12;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new2(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref3 - s13;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new3(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref3 - s14;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new4(num) = old(i,j);
            num = num + 1;
        end
    end
end

old = ref3 - s15;
num = 1;
for i = 1:48
    for j =1:39
        if  mask(i,j) ~= 0 && land(i,j) > 21 && land(i,j) < 26
            new5(num) = old(i,j);
            num = num + 1;
        end
    end
end

mask = ncread(file,'LANDMASK');
land = ncread(file,'LU_INDEX');
num = 1;




