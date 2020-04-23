from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans


nc_file = 'F:/Output files/wrfout_d03_2100-09-01_00_00_00.nc'
fh = Dataset(nc_file, mode='r') 

freq1 = np.loadtxt('C:/Users/Yating/Desktop/output/2068-2070Frequency_out.txt')
freq = np.transpose(freq1)

lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
fh.close()

#freq = freq - 0.9728
#freq = freq - 1.5727
#freq = freq - 4.2209
freq = freq - 3.1323

fig=plt.figure(figsize=(4,2))
m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = freq.shape[0]; nx = freq.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)

mdata = maskoceans(lons, lats, freq)

m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

clevs = np.arange(-3,3.5,0.5)
cs = m.contourf(x, y, mdata, clevs, cmap='bwr', extend='min')
cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Frequency difference\n (events/year)')
plt.show()