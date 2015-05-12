from random import choice

class RandSeq(object):
    def __init__(self, seq):
        self.data = seq

    def __iter__(self):
        return self

    def next(self):
        print self.data
        return choice(self.data)

seq = [i for i in range(10)]
print choice(seq)
rand = RandSeq(seq)
print iter(rand).next()

