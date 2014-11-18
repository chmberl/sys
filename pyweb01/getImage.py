#!/usr/bin/env python

import re
import urllib

def getHTML(HTML):
    f = urllib.urlopen(HTML)
    pattern = r'<img src="(\S*?\.jpg)"'
    imgre = re.compile(pattern)
    imglist=[]
    for eachline in f.readlines():
        img = re.findall(imgre, eachline)
        if len(img) != 0:
            imglist=img
    return imglist

def getImg(imglist):
    i=4
    for img in imglist:
        print img
        urllib.urlretrieve(img, '/Users/exit0/Downloads/img/m%s.jpg' % i)
        i += 1
HTML= "http://911-sss.com/html/pics/126884.html"
page = getHTML(HTML)
getImg(page)
