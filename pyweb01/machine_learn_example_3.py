from matplotlib import pyplot as plt
from sklearn.datasets import load_iris
import numpy as np

data = load_iris()
features = data['data']
feature_names = data['feature_names']
target = data['target']
print target
for t,marker,c in zip(xrange(3), ">ox","rgb"):
    plt.scatter(features[target == t,0],
                features[target == t,1],
                marker = marker,
                c = c)

plength = features[:, 2]
is_setosa = (labels == 'setosa')

max_setosa = plength[is_setosa].max()
min_non_setosa = plength[~is_setosa].min()
print 'Maximum of setosa: {0}.'.format(max_setosa)
print 'Minimum of setosa: {0}.'.format(min_non_setosa)
