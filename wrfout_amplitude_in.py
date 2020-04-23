from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans
from matplotlib.colors import ListedColormap


nc_file = 'H:/Output_scenarios/2100/ref/wrfout_d03_2099-07-23_18_00_00.nc'
fh = Dataset(nc_file, mode='r') 
lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
fh.close()

tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2011-2015meanA_in.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2036-2040meanA_in.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2066-2070meanA_in.txt')
#tmax = np.loadtxt('C:/Users/Yating/Desktop/output/2096-2100meanA_in.txt')

tmax = np.transpose(tmax)


fig=plt.figure(figsize=(4,2))

m = Basemap(projection='merc',llcrnrlon=-77.4614,llcrnrlat=38.72096,urcrnrlon=-76.7381,urcrnrlat=39.17577,resolution='h')
ny = tmax.shape[0]; nx = tmax.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)
mdata = maskoceans(lons, lats, tmax)

m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.1)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,0.2)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

cMAP = ListedColormap(['#00bfff','#00bfff','#00ffff','#00ffff','#009933','#33cc33','#33cc33','#33cc33','#c6ff1a','#ffff00','#ffff00','#ffbf00','#ffbf00','#ff8000','#ff8000','#ff4000'])
cMAP.set_over('#cc0000')
cMAP.set_under('#0080ff')

levels = [31,32,33,34,35,36,37,38,39,40]
cs = m.contourf(x, y, mdata, levels, cmap=cMAP, extend="both")
cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Amplitude ($^\circ$C)')
plt.show()
