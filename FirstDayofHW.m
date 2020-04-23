num = [31,30,31,31,29];
year = 2038;
Temperature = null(152);
lat = 16;
lon = 31;

n = 1;
for i = 5:9          
    for k = 1:num(i-4)                 
        if k > 9                    
            filename21 = ['E:/output/',num2str(year),'/wrfout_d04_',num2str(year),'-0',num2str(i),'-',num2str(k),'_','21_00_00.nc'];
        else
            filename21 = ['E:/output/',num2str(year),'/wrfout_d04_',num2str(year),'-0',num2str(i),'-0',num2str(k),'_','21_00_00.nc'];
        end


        if exist(filename21,'file') == 0
            T21 = -99;
        else
            temp21 = ncread(filename21,'T2');
            T21 = temp21(lon,lat,1)-273.15;
        end               
        Temperature(n) = T21;
        n = n + 1;
       
    end
end

for j = 1:147
    if min(Temperature(j:j+5)) > 33.2                
          fprintf('j = %d', j);
          break;
    end
end

 

