from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap, maskoceans


nc_file = 'C:\Users\Yating\Dropbox\geo_em.d02.nc'
fh = Dataset(nc_file, mode='r') 

lons = fh.variables['XLONG_M'][:]
lats = fh.variables['XLAT_M'][:]
ALBEDO = fh.variables['ALBEDO12M'][:].squeeze()
Albedo = ALBEDO[8,:,:]

fh.close()


m = Basemap(projection='merc',llcrnrlon=-78.5239,llcrnrlat=37.8515,urcrnrlon=-76.3441,urcrnrlat=39.7752,resolution='h')
xi, yi = m(lons, lats)

mdata = maskoceans(lons, lats, Albedo)

fig=plt.figure(figsize=(3,3))

m.drawcoastlines()
m.drawstates()
m.drawcountries()
m.drawcounties()

# meridians on bottom and left
parallels = np.arange(37.,40.,1.)
# labels = [left,right,top,bottom]
m.drawparallels(parallels,labels=[True,False,False,False])
meridians = np.arange(-79.,-76.,1.)
m.drawmeridians(meridians,labels=[False,False,False,True])

cs = m.pcolor(np.squeeze(xi),np.squeeze(yi),np.squeeze(mdata),cmap='pink')
cbar = m.colorbar(cs, "right", size="5%", pad='2%')
cbar.set_label('Percent of albedo (%)')
plt.show()
plt.savefig('Albedo.png')
