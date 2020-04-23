from netCDF4 import Dataset
dataset = Dataset('CMIP5 daily temp/regridded_1deg_tasmax_day_CanESM2_rcp26_r1i1p1_20460101-20551231.nc')


print dataset.dimensions.keys()
"""
[u'latitude', u'longitude', u'time']
"""

"""
print dataset.dimensions['bnds']
>> 
<type 'netCDF4._netCDF4.Dimension'>: name = 'bnds', size = 2
"""

"""
print dataset.variables.keys()
>>>
[u'latitude', u'longitude', u'tasmax', u'time']
"""

"""
print dataset.variables['time']
>>
<type 'netCDF4._netCDF4.Variable'>
float64 time(time)
    bounds: time_bnds
    units: days since 2005-01-01 00:00:00
    calendar: noleap
    axis: T
    long_name: time
    standard_name: time
unlimited dimensions: time
current shape = (95,)
filling on, default _FillValue of 9.96920996839e+36 used
"""

"""
print dataset['time'].shape
>>
(95,)
"""

"""
print dataset['tasmax']
>>>
<type 'netCDF4._netCDF4.Variable'>
float32 tasmax(time, latitude, longitude)
    associated_files: baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_atmos_fx_bcc-csm1-1_rcp26_r0i0p0.nc areacella: areacella_fx_bcc-csm1-1_rcp26_r0i0p0.nc
    missing_value: 1e+20
    coordinates: height
    history: 2011-06-28T03:10:36Z altered by CMOR: Treated scalar dimension: 'height'.
    cell_measures: area: areacella
    cell_methods: time: maximum (interval: 20 mintues)
    original_name: TREFHTMX
    units: C
    long_name: Daily Maximum Near-Surface Air Temperature
    standard_name: air_temperature
    _FillValue: 1e+20
unlimited dimensions: time
current shape = (3653, 30, 60)
filling on
"""

"""
print dataset['tn90pETCCDI'][:]
"""

"""
print dataset['latitude'].units
>>
degrees_north
"""

"""
print dataset['longitude'].units
>>
degrees_east
"""

"""
print dataset['time'][:]
"""
print dataset['latitude'][:]
print dataset['longitude'][:]

"""
y = dataset['tasmax'][:,15,49]
for item in y:
    print item
"""