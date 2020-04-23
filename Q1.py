import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from collections import Counter
import statistics
import operator
from math import pi

df = pd.read_csv('C:/Users/Yating/Desktop/Arrest_Data_from_2010_to_Present.csv',parse_dates=True)
#df.info()
df['date'] = pd.to_datetime(df['Arrest Date'])
df['year'] = df['date'].dt.year

num = 0
age_list = []

for index, row in df.iterrows():
    if row['year'] == 2018:
        num = num + 1
        if row['Charge Group Description'] == 'Vehicle Theft' or 'Robbery' or 'Burglary' or 'Receive Stolen Property':
            age_list.append(row['Age'])

print(num) 
#####################################################################################################################      
age_95 = np.percentile(age_list, 95)
print(age_95)
#####################################################################################################################
year_list = []
        
for index, row in df.iterrows():
     if row['Charge Description'] == 'VIOLATION OF PAROLE:FELONY':
         if row['year'] >= 2010 and row['year'] <= 2018:
             year_list.append(row['year'])
             
z = Counter(sorted(year_list))
keys = np.fromiter(z.keys(), dtype=float).reshape((-1, 1))
values = np.fromiter(z.values(), dtype=float)
model = LinearRegression().fit(keys, values)
#model.intercept_
#model.coef_
x = np.array([2019]).reshape(-1,1)
y_pred = model.predict(x)
print(y_pred)
###################################################################################################################
sub = 'PICO' 
df["Indexes"]= df["Address"].str.find(sub) 

latitude = []
longitude = []
location = []
for index, row in df.iterrows():
    if row['Indexes'] > -1:
        location.append(row['Location'])
        lat, lng = map(float, row['Location'].strip('()').split(','))
        latitude.append(lat)
        longitude.append(lng)

lat_mean = statistics.mean(latitude)
lon_mean = statistics.mean(longitude) 
lat_std = statistics.stdev(latitude)
lon_std = statistics.stdev(longitude)

lat_1 = lat_mean - 2 * lat_std
lat_2 = lat_mean + 2 * lat_std 
lon_1 = lon_mean - 2 * lon_std
lon_2 = lon_mean + 2 * lon_std 

t = 0
lat_min = lat_mean
lat_max = lat_mean
lon_min = lon_mean
lon_max = lon_mean
for i in latitude:
    if i > lat_1 and i < lat_2 and longitude[t] > lon_1 and longitude[t] < lon_2:
        if i > lat_max:
            lat_max = i
            lon_max = longitude[t]
        if i < lat_min:
            lat_min = i
            lon_min = longitude[t]
    t = t + 1           

delta_lat = (lat_max - lat_min) / 180 * pi
delta_lon = (lon_max - lon_min) / 180 * pi
D = 6371 * np.sqrt(np.square(delta_lat) + np.square(np.cos((lon_max + lon_min) /2 /180 * pi) * delta_lon))

s = 0
for index, row in df.iterrows():
    if row['Indexes'] > -1 and row['year'] == 2018:
        s = s + 1
arrest = s/D
print(arrest)
##################################################################################################################  
area = []
for index, row in df.iterrows():
    if row['year'] == 2018:
        area.append(row['Area ID'])

zz = Counter(area)
sorted(zz.items(),key=operator.itemgetter(1),reverse=True)
##################################################################################################################
group = []
for index, row in df.iterrows():
    if row['year'] == 2018:
        if row['Charge Group Description'] != 'Pre-Delinquency' and row['Charge Group Description'] != 'Non-Criminal Detention':
            group.append(row['Charge Group Description'])
        
zzz = Counter(group)
keys = zzz.keys()
type_list = [x for x in keys if str(x) != 'nan']

age = []
age_mean = []
for i in type_list:
    for index, row in df.iterrows():
        if row['Charge Group Description'] == i:
            age.append(row['Age'])
    age_mean.append(statistics.mean(age))

z_score = []
for i in age_mean:
    z_score.append((i - statistics.mean(age_mean))/statistics.stdev(age_mean))
    
np.amax(z_score)
#################################################################################################################    
location = []
latitude = []
longitude = []
for index, row in df.iterrows():
    if row['year'] == 2018:
        location.append(row['Location'])
        lat, lng = map(float, row['Location'].strip('()').split(','))
        latitude.append(lat)
        longitude.append(lng)

t = 0
num = 0
for i in latitude:
    delta_lat = (i - 34.050536) / 180 * pi
    delta_lon = (longitude[t] + 118.247861) / 180 * pi
    D = 6371 * np.sqrt(np.square(delta_lat) + np.square(np.cos((longitude[t] - 118.247861) / 2 /180 * pi) * delta_lon))
    if D < 2:
        num = num + 1
    t = t + 1
print(num)
#################################################################################################################        
group_ID = []
for index, row in df.iterrows():
    if row['year'] < 2019 and row['Charge Group Code'] != 99:
        group_ID.append(row['Charge Group Code'])
        
zzzz = Counter(group_ID)
keys = zzzz.keys()
type_list = [x for x in keys if str(x) != 'nan']

num_arrest = []
for i in type_list:
    num = 0
    for index, row in df.iterrows():
        if row['Charge Group Code'] == i:
            num = num + 1
    num_arrest.append(num)

mean_arrest = statistics.mean(num_arrest)
ratio = []
for i in num_arrest:
    ratio.append(i / mean_arrest)
    
ratio_sort = sorted(ratio, reverse=True)
sumup = 0
for i in ratio_sort[0:4]:
    sumup = sumup + i
    
print(sumup/5)   







