from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans
from matplotlib.colors import ListedColormap

nc_file = 'F:/Output files/2096-2100-d3/wrfout_d03_2100-09-01_00_00_00.nc'
fh = Dataset(nc_file, mode='r') 
lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
fh.close()

dura1 = np.loadtxt('C:/Users/Yating/Desktop/output/2011-2015AnnualDuration_out.txt')
#dura1 = np.loadtxt('C:/Users/Yating/Desktop/output/2038-2040AnnualDuration_out.txt')
#dura1 = np.loadtxt('C:/Users/Yating/Desktop/output/2068-2070AnnualDuration_out.txt')
#dura1 = np.loadtxt('C:/Users/Yating/Desktop/output/2098-2100AnnualDuration_out.txt')

dura = np.transpose(dura1)

fig = plt.figure(figsize=(4,2))
m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = dura.shape[0]; nx = dura.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)
mdata = maskoceans(lons, lats, dura)

m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

cMAP = ListedColormap(['#db70a6','#8080ff','#4da6ff','#4dd2ff','#4dffff','#70db70',                      
                       '#a6ff4d','#d2ff4d','#ffff4d','#ffd24d','#ffa64d',
                       '#ff794d','#ff4d4d'])

clevs = np.arange(0,65,5)
cs = m.contourf(x, y, mdata, clevs, cmap=cMAP, extend="max")
cbar = m.colorbar(cs, "right",size="5%", pad='2%')
cbar.set_label('Warm spell duration (days)')
plt.show()