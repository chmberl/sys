class RoundFloatManual(object):
    def __init__(self,val):
        assert isinstance(val, float), "Value must be a float"
        self.value = round(val, 2)

    def __str__(self):
        return '{0}'.format(self.value)

    def __repr__(self):
        return __str__()

rfm = RoundFloatManual(42.2)
print rfm
