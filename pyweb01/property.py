class C(object):
    def __init__(self):
        self._x = None

    def getx(self):
        return self._x

    def setx(self,value):
        self._x = value

    def delx(self):
        del self._x

    x = property(getx,setx,delx,"x property")



class Parrot(object):
    def __init__(self):
        self._voltage = 100000

    @property
    def voltage(self):
        return self._voltage


    @voltage.setter
    def voltage(self,value):
        self._voltage = value

    @voltage.deleter
    def voltage(self):
        del self._voltage
#c = C()
#c.x=45
#print c.x
p = Parrot()
print p.voltage
p.voltage = 20000
print p.voltage
