from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap


nc_file1 = 'H:/Output/2040/ref/wrfout_d04_2040-08-01_00_00_00.nc'

fh = Dataset(nc_file1, mode='r') 
lons = fh.variables['XLONG'][:]
lats = fh.variables['XLAT'][:]
fh.close()

land = np.loadtxt('C:/Users/Yating/Desktop/output/land_use.txt')
land =  np.transpose(land)

fig=plt.figure(figsize=(7,5))

m = Basemap(projection='merc',llcrnrlon=-78.5079,llcrnrlat=38.00905,urcrnrlon=-75.6454,urcrnrlat=39.91155,resolution='h')
ny = land.shape[0]; nx = land.shape[1]
lons, lats = m.makegrid(nx, ny) # get lat/lons of ny by nx evenly space grid.
x, y = m(lons, lats)

m.drawcoastlines()
m.drawcounties(linewidth=0.4)

parallels = np.arange(0.,90,0.5)
m.drawparallels(parallels,labels=[1,0,0,0],dashes=[2,900],fontsize=10,linewidth=0.4)
meridians = np.arange(180.,360.,1)
m.drawmeridians(meridians,labels=[0,0,0,1],dashes=[2,900],fontsize=10,linewidth=0.4)

clevs = np.arange(1,15,1)
cs = m.contourf(x, y, land, clevs, cmap='terrain')
cbar = m.colorbar(cs, "right", size="5%", pad='2%')

x1, y1 = m(-77.4614, 38.72096)
plt.plot(x1, y1, 'ok', markersize=1)
x2, y2 = m(-77.4614, 39.17577)
plt.plot(x2, y2, 'ok', markersize=1)
x3, y3 = m(-76.7381, 38.72096)
plt.plot(x3, y3, 'ok', markersize=1)

plt.show()
