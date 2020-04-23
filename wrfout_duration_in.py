from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans
from matplotlib.colors import ListedColormap

nc_file = 'F:/Output files/wrfout_d04_2100-09-01_00_00_00.nc'
fh = Dataset(nc_file, mode='r') 
lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
fh.close()

dura = np.loadtxt('C:/Users/Yating/Desktop/output/2098-2100Duration_in.txt')
dura =  np.transpose(dura)

#dura2 = np.loadtxt('C:/Users/Yating/Desktop/Duration 2005.txt')
#dura = dura1 - dura2

fig=plt.figure(figsize=(4,2))
m = Basemap(projection='merc',llcrnrlon=-77.4614,llcrnrlat=38.72096,urcrnrlon=-76.7381,urcrnrlat=39.17577,resolution='h')
ny = dura.shape[0]; nx = dura.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)

mdata = maskoceans(lons, lats, dura)
m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.1)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,0.2)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

cMAP = ListedColormap(['#00bfff','#00ffff','#009933','#33cc33','#c6ff1a','#ffff00',                       
                       '#ffcc00','#ffcc00','#ffcc00','#ff9933','#ff9933','#ff9933',                    
                       '#ff8000','#ff8000','#ff8000','#ff6600','#ff6600','#ff6600',
                       '#ff4000','#ff4000','#ff4000'])
cMAP.set_under('#0080ff')
cMAP.set_over('#cc0000')
clevs = np.arange(6,28,1)
cs = m.contourf(x, y, mdata, clevs, cmap=cMAP, extend="both")
cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Duration (days/event)')
plt.show()

