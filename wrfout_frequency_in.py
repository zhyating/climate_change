from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans
from matplotlib.colors import ListedColormap

nc_file = 'F:/Output files/wrfout_d04_2100-06-01_00_00_00.nc'
fh = Dataset(nc_file, mode='r') 

freq2 = np.loadtxt('C:/Users/Yating/Desktop/output/2098-2100Frequency_in.txt')
freq = np.transpose(freq2)

lons2 = fh.variables['XLONG'][:]
lats2 = fh.variables['XLAT'][:]
fh.close()


fig2=plt.figure(figsize=(4,2))
m2 = Basemap(projection='merc',llcrnrlon=-77.4614,llcrnrlat=38.72096,urcrnrlon=-76.7381,urcrnrlat=39.17577,resolution='h')
ny2 = freq.shape[0]; nx2 = freq.shape[1]
lons2, lats2 = m2.makegrid(nx2, ny2) # get lat/lons of ny by nx evenly space grid.
x2, y2 = m2(lons2, lats2)
mdata2 = maskoceans(lons2, lats2, freq)

cMAP = ListedColormap(['#0080ff','#00bfff','#00ffff','#009933','#33cc33','#c6ff1a','#ffff00','#ffbf00','#ff8000','#ff4000'])
clevs = np.arange(0,5.5,0.5)
cMAP.set_over('#cc0000')

m2.drawcoastlines()
m2.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.1)
m2.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,0.2)
m2.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

cs2 = m2.contourf(x2, y2, mdata2, clevs, cmap=cMAP, extend='max')
cbar = m2.colorbar(cs2, "right", size="5%", pad='2%')
cbar.set_label('Frequency (events/year)')
plt.show()