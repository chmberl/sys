from matplotlib import pyplot as plt
import numpy as np
import mahotas as mh
image = mh.imread('/Users/exit0/sys/pyweb01/1.jpg')
image = mh.colors.rgb2gray(image, dtype=np.uint8)
image = image[::4,::4]
thresh = mh.sobel(image)
filtered = mh.sobel(image, just_filter=True)

thresh = mh.dilate(thresh,np.ones((7,7)))
filtered = mh.dilate(mh.stretch(filtered),np.ones((7,7)))


h,w = thresh.shape
canvas = 255*np.ones((h,w*2+64), np.uint8)
canvas[:,:w] = thresh*255
canvas[:,-w:] = filtered

mh.imsave('/Users/exit0/sys/pyweb01/5.jpg', canvas)
