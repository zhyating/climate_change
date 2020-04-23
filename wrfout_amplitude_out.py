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

#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2011-2015meanA_out.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2036-2040meanA_out.txt')
tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2066-2070meanA_out.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2096-2100meanA_out.txt')

tmax = np.transpose(tmax)


fig=plt.figure(figsize=(6,4))

m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = tmax.shape[0]; nx = tmax.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)
mdata = maskoceans(lons, lats, tmax)

m.drawcoastlines(linewidth=0.4)
m.drawcounties(linewidth=0.2)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)
cMAP = ListedColormap(['#00bfff','#00bfff','#00ffff','#00ffff','#009933','#33cc33','#33cc33','#33cc33','#c6ff1a','#ffff00','#ffff00','#ffbf00','#ffbf00','#ff8000','#ff8000','#ff4000'])
cMAP.set_over('#cc0000')
cMAP.set_under('#0080ff')

levels = [32,33,34,35,36,37,38,39,40,41]
cs = m.contourf(x, y, mdata, levels, cmap=cMAP, extend="both")

cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Amplitude ($^\circ$C)')
plt.show()
