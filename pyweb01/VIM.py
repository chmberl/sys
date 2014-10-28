class HideX(object):
    def __init__(self, x):
        self.x = x

    #def get_x(self):
    #   return ~self.__x

    #def set_x(self, x):
    #   assert isinstance(x, int),'"x" must be an integer'
    #   self.__x = ~x

    #x = property(get_x, set_x)

    #@property
    def x():
        def fget(self):
            return ~self.__x

        def fset(self, x):
            self.__x = ~x

        return locals()
    x=property(**x())
cx = HideX(3)
print cx.x
cx.x=45
print cx.x
