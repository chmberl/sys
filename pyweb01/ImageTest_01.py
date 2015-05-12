#!/usr/bin/env python
#encoding=utf-8

import Image,ImageEnhance,ImageFilter
import sys

image_name = "/Users/exit0/sys/pyweb01/D.png"

im = Image.open(image_name)
im = im.filter(ImageFilter.MedianFilter())
enhancer = ImageEnhance.Contrast(im)
im = enhancer.enhance(2)
im = im.convert('1')
#im.show()

s = 12
w = 10
h = 15
t = 2

im_new = []
for i in range(4):
    im1 = im.crop((s+w*i+i*2,t,s+w*(i+1)+i*2,h))
    im_new.append(im1)

f = file("/Users/exit0/sys/pyweb01/data.txt","a")

for k in range(4):
    l = []
    for i in range(13):
        for j in range(10):
            if (im_new[k].getpixel((j,i)) == 255):
                l.append(0)
            else:
                l.append(1)
    f.write("l=[")
    n = 0
    for i in l:
        if (n%10==0):
            f.write("\n")
        f.write(str(i) + ",")
        n+=1

    f.write("]\n")

