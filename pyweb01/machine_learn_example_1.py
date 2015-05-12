f = file("/Users/exit0/sys/pyweb01/web_traffic_2.tsv", "w")
import random
import os
for i in xrange(743):
    v = random.randint(2500,3000)
    k = random.randint(3000,4000)
    j = random.randint(4000,6000)
    if i <343:
        f.write(str(i+1)+"\t" + str(v) + os.linesep)
    elif 343<= i <600:
        f.write(str(i+1)+"\t" + str(k) + os.linesep)
    else:
        f.write(str(i+1)+"\t" + str(j) + os.linesep)

f.close()
