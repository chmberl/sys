
class WrapMe(object):
    def __init__(self, obj):
        self.__data = obj

    def get(self):
        return self.__data

    def __repr__(self):
        return 'self.__data'

    def __str__(self):
        return str(self.__data)

    def __getattr__(self, attr):
        return getattr(self.__data, attr)

com = WrapMe(2.5+45.2j)
print com
print com.real
print com.imag
print com.conjugate()
