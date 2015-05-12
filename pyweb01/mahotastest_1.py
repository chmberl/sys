from matplotlib import pyplot as plt
import numpy as np
import mahotas as mh
image = mh.imread('/Users/exit0/sys/pyweb01/1.jpg')
image = mh.colors.rgb2gray(image)
im8 = mh.gaussian_filter(image,8)
im16 = mh.gaussian_filter(image,16)
im32 = mh.gaussian_filter(image,32)
h,w = im8.shape
canvas = np.ones((h,3*w+256), np.uint8)
canvas *= 255
canvas[:,:w] = im8
canvas[:,w+128:2*w+128] = im16
canvas[:,-w:] = im32
mh.imsave('/Users/exit0/sys/pyweb01/2.jpg', canvas[:,::2])

im32 = mh.stretch(im32)
ot32 = mh.otsu(im32)
mh.imsave('/Users/exit0/sys/pyweb01/3.jpg', (im32 > ot32).astype(np.uint8)*255)
