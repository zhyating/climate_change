from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans


#nc_file1 = 'F:/Output files/wrfout_d03_2003-07-21_21_00_00.nc'
nc_file1 = 'F:/Output files/wrfout_d03_2040-07-31_20_00_00.nc'
#nc_file1 = 'F:/Output files/wrfout_d03_2067-08-01_21_00_00.nc'
#nc_file1 = 'F:/Output files/wrfout_d03_2100-06-29_21_00_00.nc'

fh = Dataset(nc_file1, mode='r') 
lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
tmax = fh.variables['T2'][:].squeeze()
tmax = tmax - 273.15
fh.close()

#tmax = tmax - 35.6557
tmax = tmax - 37.7885
#tmax = tmax - 39.5262
#tmax = tmax - 42.5948

fig=plt.figure(figsize=(4,2))

m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = tmax.shape[0]; nx = tmax.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)
mdata = maskoceans(lons, lats, tmax)

m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

clevs = np.arange(-6,7,1)
cs = m.contourf(x, y, mdata, clevs, cmap='bwr', extend='min')

cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Amplitude difference\n ($^\circ$C)')
plt.show()
