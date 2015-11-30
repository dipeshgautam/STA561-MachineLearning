
import numpy as np
from sklearn import mixture

FILENAME = "mcdonalds-normalized-data.txt"

x = np.loadtxt(open(FILENAME, "rb"), delimiter = "\t", skiprows = 1, usecols = range(14))
dpgmm = mixture.DPGMM(n_components = 25)
dpgmm.fit(x)
clusters = np.transpose(np.matrix(dpgmm.predict(x)))
x =np.hstack((x, clusters))
np.savetxt("clusters-dpgmm.txt", clusters, delimiter=",", newline="\n")