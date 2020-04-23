clear
clc

num = [31,30,31,31,26];
name1 = '2096-2100-d4';
%name2 = '2066-2070-d4';
initial = 2095;

daily_Temp = null(92);
max_value = null(10);

for year = 1:5 
    d = 1;
    for i = 6:8            
        for k = 1:num(i-4)          
            if k > 9  
                filename06 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_06_00_00.nc'];
                filename09 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_09_00_00.nc'];
                filename18 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_18_00_00.nc'];
                filename21 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_21_00_00.nc'];
            else
                filename06 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_06_00_00.nc'];
                filename09 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_09_00_00.nc'];
                filename18 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_18_00_00.nc'];
                filename21 = ['F:/Output files/',name1,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_21_00_00.nc'];
            end

            
            if exist(filename06,'file') == 0
                fprintf('%d-%d-%d-06 dose not exit\n',year,i,k);
                continue;
            else
                temp = ncread(filename06,'T2');
                T06 = temp - 273.15;
            end 

            
            if exist(filename09,'file') == 0
                fprintf('%d-%d-%d-09 dose not exit\n',year,i,k);
                continue;
            else
                temp = ncread(filename09,'T2');
                T09 = temp - 273.15;
            end
            
            if exist(filename18,'file') == 0
                fprintf('%d-%d-%d-18 dose not exit\n',year,i,k);
                continue;
            else
                temp = ncread(filename18,'T2');
                T18 = temp - 273.15;
            end 

            
            if exist(filename21,'file') == 0
                fprintf('%d-%d-%d-21 dose not exit\n',year,i,k);
                continue;
            else
                temp = ncread(filename21,'T2');
                T21 = temp - 273.15;
            end               
            
            T = (max(T18, T21) + min(T06, T09)) / 2;
            daily_Temp(d) = max(max(T));
            d = d + 1;            
        end
    end
    max_value(year) = max(daily_Temp);
end

% initial = initial + 5;
% 
% for year = 1:5
%     d = 1;
%     for i = 6:8            
%         for k = 1:num(i-4)          
%             if k > 9  
%                 filename06 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_06_00_00.nc'];
%                 filename09 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_09_00_00.nc'];
%                 filename18 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_18_00_00.nc'];
%                 filename21 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-',num2str(k),'_21_00_00.nc'];
%             else
%                 filename06 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_06_00_00.nc'];
%                 filename09 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_09_00_00.nc'];
%                 filename18 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_18_00_00.nc'];
%                 filename21 = ['F:/Output files/',name2,'/wrfout_d04_',num2str(initial+year),'-0',num2str(i),'-0',num2str(k),'_21_00_00.nc'];
%             end
% 
%             
%             if exist(filename06,'file') == 0
%                 fprintf('%d-%d-%d-06 dose not exit\n',year+5,i,k);
%                 continue;
%             else
%                 temp = ncread(filename06,'T2');
%                 T06 = temp - 273.15;
%             end 
% 
%             
%             if exist(filename09,'file') == 0
%                 fprintf('%d-%d-%d-09 dose not exit\n',year+5,i,k);
%                 continue;
%             else
%                 temp = ncread(filename09,'T2');
%                 T09 = temp - 273.15;
%             end
%             
%             if exist(filename18,'file') == 0
%                 fprintf('%d-%d-%d-18 dose not exit\n',year+5,i,k);
%                 continue;
%             else
%                 temp = ncread(filename18,'T2');
%                 T18 = temp - 273.15;
%             end 
% 
%             
%             if exist(filename21,'file') == 0
%                 fprintf('%d-%d-%d-21 dose not exit\n',year+5,i,k);
%                 continue;
%             else
%                 temp = ncread(filename21,'T2');
%                 T21 = temp - 273.15;
%             end               
%             
%             T = (max(T18, T21) + min(T06, T09)) / 2;           
%             daily_Temp(d) = max(max(T));
%             d = d + 1;            
%         end
%     end
%     max_value(year+5) = max(daily_Temp);
% end
% 
% M = mean(max_value);
% V = var(max_value);
