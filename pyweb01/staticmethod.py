class C(object):
    y = 0

    def __init__(self):
        self._x = 5

    @classmethod
    def f(cls,value):
        print value
        y=value
        print y

c = C()
print c.y
C.f(4)
print C.y
