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

#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2011-2015SummerT.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2036-2040SummerT.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2066-2070SummerT.txt')
tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2096-2100SummerT.txt')

tmax = np.transpose(tmax)


fig=plt.figure(figsize=(6,4))

m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = tmax.shape[0]; nx = tmax.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)
mdata = maskoceans(lons, lats, tmax)

m.drawcoastlines(linewidth=0.4)
m.drawstates(linewidth=0.2)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)
cMAP = ListedColormap(['#0080ff','#00bfff','#00bfff','#00ffff','#00ffff','#009933','#33cc33','#33cc33','#33cc33','#c6ff1a','#ffff00','#ffff00','#ffbf00','#ffbf00','#ff8000','#ff8000','#ff4000'])
#cMAP.set_over('#cc0000')
#cMAP.set_under()

levels = [25,26,27,28,29,30,31,32,33,34,35]
cs = m.contourf(x, y, mdata, levels, cmap=cMAP)

cbar = m.colorbar(cs, "bottom", size="5%", pad='2%')
cbar.set_label('Temperature ($^\circ$C)')
plt.show()
