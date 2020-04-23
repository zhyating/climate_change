import pandas as pd
import numpy as np
from sklearn.cross_validation import cross_val_score 
from sklearn import svm


data = pd.read_csv('Book1.csv', index_col=0)

x = data.Day1
x = np.asarray(x, dtype="|S6")

y = data.CMIP1
y = np.asarray(y, dtype="|S6")

      
                  
model = svm.SVC(kernel='linear', C=1)

scores = cross_val_score(model, y, x, cv=6)  

print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))