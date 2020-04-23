clear
clc

% file1 = 'F:/Output files/2096-2100-d3/wrfout_d03_2100-08-01_18_00_00.nc';
% mask1 = ncread(file1,'LANDMASK');
% lat = ncread(file1,'XLAT');
% lon = ncread(file1,'XLONG');
% land1 = ncread(file1,'LU_INDEX');
% 
% %old1 =importdata('C:/Users/Yating/Desktop/output/2011-2015meanA_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2036-2040meanA_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2066-2070meanA_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2096-2100meanA_out.txt');
% 
% old1 =importdata('C:/Users/Yating/Desktop/output/2011-2015Duration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2038-2040Duration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2068-2070Duration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2098-2100Duration_out.txt');
% 
% %old1 =importdata('C:/Users/Yating/Desktop/output/2011-2015Frequency_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2038-2040Frequency_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2068-2070Frequency_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2098-2100Frequency_out.txt');
% 
% %old1 =importdata('C:/Users/Yating/Desktop/output/2011-2015AnnualDuration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2038-2040AnnualDuration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2068-2070AnnualDuration_out.txt');
% %old1 =importdata('C:/Users/Yating/Desktop/output/2098-2100AnnualDuration_out.txt');
% new1 = null(3000);
% num = 1;
% 
% for i = 1:63
%     for j = 1:54
%         if lat(i,j)>38.72096 && lat(i,j)<39.17577 && lon(i,j)<-76.7381 && lon(i,j)>-77.4614
%             continue
% 
%         elseif mask1(i,j) ~= 0
%             if land1(i,j)<22 || land1(i,j)>25
%             
%                 new1(num) = old1(i,j);
%                 num = num + 1;
%                 
%             end
%         end
%     end
% end
% 
% M = mean(new1);
% S = std(new1);
% 
% %histogram(new,20);
% %hold on;


file2 = 'F:/Output files/2096-2100-d4/wrfout_d04_2100-08-01_18_00_00.nc';
mask2 = ncread(file2,'LANDMASK');
land2 = ncread(file2,'LU_INDEX');

%old2 =importdata('C:/Users/Yating/Desktop/output/2011-2015meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2036-2040meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2066-2070meanA_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2096-2100meanA_in.txt');

%old2 =importdata('C:/Users/Yating/Desktop/output/2011-2015Duration_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2038-2040Duration_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2068-2070Duration_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2098-2100Duration_in.txt');

%old2 =importdata('C:/Users/Yating/Desktop/output/2011-2015Frequency_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2038-2040Frequency_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2068-2070Frequency_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2098-2100Frequency_in.txt');

%old2 =importdata('C:/Users/Yating/Desktop/output/2011-2015AnnualDuration_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2038-2040AnnualDuration_in.txt');
%old2 =importdata('C:/Users/Yating/Desktop/output/2068-2070AnnualDuration_in.txt');
old2 =importdata('C:/Users/Yating/Desktop/output/2098-2100AnnualDuration_in.txt');

new2 = null(1872);
num = 1;

for i = 1:48
    for j = 1:39
        if mask2(i,j) ~= 0 && land2(i,j)>21 && land2(i,j)<26

            new2(num) = old2(i,j);
            num = num + 1;
            
        end
    end
end

M2 = mean(new2);
S2 = std(new2);
Max2 = max(new2);

%histogram(new2,20);

%legend('Surroundings','Washington D.C.','Location','northwest');
%xlabel('Amplitude ()');
%ylabel('Number of grid points');

% M3 = M2 - M;
% S3 = sqrt(S*S+S2*S2);