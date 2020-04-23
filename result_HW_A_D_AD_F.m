clear
clc

old2=dlmread('E:\One Drive3\OneDrive\0My report\Project 2\output\2011-2015mean_maxA_in.txt');
new2 = null(1872);
file2 = 'H:\Output_scenarios\2040\ref\wrfout_d04_2040-07-31_12_00_00.nc';
land2 = ncread(file2,'LU_INDEX');
mask2 = ncread(file2,'LANDMASK');
num = 1;

for i = 1:48
        for j =1:39
            if  mask2(i,j) ~= 0 && old2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26
                new2(num) = old2(i,j);
                num = num + 1;
            end
        end
end

M2 = mean(new2);
S2 = std(new2);
Max2 = max(new2);
    