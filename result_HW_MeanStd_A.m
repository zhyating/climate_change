%Compare heat waves in Washington D.C. and is surroundings
hold off

clear
clc

file1 = 'F:/Output files/2096-2100-d3/wrfout_d03_2100-08-01_18_00_00.nc';
mask1 = ncread(file1,'LANDMASK');
lat = ncread(file1,'XLAT');
lon = ncread(file1,'XLONG');
land1 = ncread(file1,'LU_INDEX');

old1 =importdata('C:/Users/Yating/Desktop/output/2011-2015meanA_out.txt');
%old1 =importdata('C:/Users/Yating/Desktop/output/2036-2040meanA_out.txt');
%old1 =importdata('C:/Users/Yating/Desktop/output/2066-2070meanA_out.txt');
%old1 =importdata('C:/Users/Yating/Desktop/output/2096-2100meanA_out.txt');
new1 = null(3000);
num = 1;

for i = 1:63
    for j =1:54
        if lat(i,j)>38.72096 && lat(i,j)<39.17577 && lon(i,j)<-76.7381 && lon(i,j)>-77.4614
            continue
            
        elseif land1(i,j) ~= 17 && old1(i,j) > 0
            if land1(i,j)<22 || land1(i,j)>25
                
                new1(num) = old1(i,j);
                num = num + 1; 
                
            end
        end
    end
end

M1 = mean(new1);
S1 = std(new1);

histogram(new1,25);
hold on;


file2 = 'F:/Output files/2096-2100-d4/wrfout_d04_2100-08-01_18_00_00.nc';
mask2 = ncread(file2,'LANDMASK');
land2 = ncread(file2,'LU_INDEX');

old2 =importdata('C:/Users/Yating/Desktop/output/2011-2015meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2036-2040meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2066-2070meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2096-2100meanA_in.txt');
new2 = null(1872);
num = 1;

for i = 1:48
    for j =1:39
        if  land2(i,j) ~= 17 && old2(i,j)>0 && land2(i,j)>21 && land2(i,j)<26
            new2(num) = old2(i,j);
            num = num + 1;
        end
    end
end

M2 = mean(new2);
S2 = std(new2);
            
histogram(new2,7);
%legend('Surroundings','Washington D.C.','Location','northeast');
xlabel('Amplitude (\circC)');
ylabel('Number of grid points');

M3 = M2 - M1;
S3 = sqrt(S1*S1+S2*S2);

[h,p] = ttest2(new1, new2)