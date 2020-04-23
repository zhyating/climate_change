
ncfile = 'C:\Users\Yating\Desktop\wrfinput_d01.nc';
lat = ncread(ncfile,'XLAT') ;
lon = ncread(ncfile,'XLONG') ;
A = ncread(ncfile,'LU_INDEX');
lon = double(lon) ;
lat = double(lat) ;
R = georasterref('RasterSize',[89 79],'LatitudeLimits',[lat(1,1),lat(1,79)],........
          'LongitudeLimits',[lon(1,1),lon(89,1)]);
tiffile = strcat('LU_d01.tif') ;
geotiffwrite(tiffile,A,R)