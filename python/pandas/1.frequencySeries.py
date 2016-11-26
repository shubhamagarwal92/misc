## To check the frequency of Y (Labels) in supervised learning

import pandas as pd

y_value = pd.Series([1,1,0,0,0,2,0,2,1,1])
print "Y values in series as in a classical machine learning problem"
print y_value

freq = y_value.value_counts()
print "Computing the frequency distribution to check for imbalance in data" 
print freq