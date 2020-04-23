year = 2029;
month = '07';
day = '23';
lat = 71;
lon = 80;

filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_00_00_00.nc'];
temp = ncread(filename,'T2');
Tlat1 = temp(:,lat) - temp(lon,lat);
Tlon1 = temp(lon,:) - temp(lon,lat);

filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_03_00_00.nc'];
temp = ncread(filename,'T2');
Tlat2 = temp(:,lat) - temp(lon,lat);
Tlon2 = temp(lon,:) - temp(lon,lat);


filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_06_00_00.nc'];
temp = ncread(filename,'T2');
Tlat3 = temp(:,lat) - temp(lon,lat);
Tlon3 = temp(lon,:) - temp(lon,lat);


filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_09_00_00.nc'];
temp = ncread(filename,'T2');
Tlat4 = temp(:,lat) - temp(lon,lat);
Tlon4 = temp(lon,:) - temp(lon,lat);


filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_12_00_00.nc'];
temp = ncread(filename,'T2');
Tlat5 = temp(:,lat) - temp(lon,lat);
Tlon5 = temp(lon,:) - temp(lon,lat);

filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_15_00_00.nc'];
temp = ncread(filename,'T2');
Tlat6 = temp(:,lat) - temp(lon,lat);
Tlon6 = temp(lon,:) - temp(lon,lat);

filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_18_00_00.nc'];
temp = ncread(filename,'T2');
Tlat7 = temp(:,lat) - temp(lon,lat);
Tlon7 = temp(lon,:) - temp(lon,lat);


filename = ['D:/',num2str(year),' reference/wrfout_d02_',num2str(year),'-',month,'-',day,'_21_00_00.nc'];
temp = ncread(filename,'T2');
Tlat8 = temp(:,lat) - temp(lon,lat);
Tlon8 = temp(lon,:) - temp(lon,lat);


lat = ncread(filename,'XLAT');
lon = ncread(filename,'XLONG');
LAT = lat(1,:)';
LON = lon(:,1)';

%figure
subplot(3,2,5)
Tlat_day = (Tlat7 + Tlat6 + Tlat5 + Tlat4)/4;
Tlat_night = (Tlat1 + Tlat2 + Tlat3 + Tlat8)/4;
plot(-LON',Tlat_day,-LON',Tlat_night)
xlabel('Longitude (^{\circ}W)','FontSize',14)
ylabel('2-m temperature (^{\circ}C)','FontSize',14)
hline(0);
vline(77);

subplot(3,2,6)
Tlon_day = (Tlon7 + Tlon6 + Tlon5 + Tlon4)/4;
Tlon_night = (Tlon1 + Tlon2 + Tlon3 + Tlon8)/4;
plot(LAT',Tlon_day,LAT',Tlon_night)
xlabel('Latitude (^{\circ}N)','FontSize',14)
ylabel('2-m temperature (^{\circ}C)','FontSize',14)
hline(0);
vline(38.9);

%legend('daytime','nighttime','Orientation','horizontal')
