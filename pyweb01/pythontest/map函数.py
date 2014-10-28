#print map(lambda x,y:(x+y,x-y), [1,3, 5], [2, 4, 6])

#print reduce(lambda x,y:(x + y),[1,2,3])

from operator import add, mul
from functools import partial

add1 = partial(add,1)

#print add1(10)

mul100 = partial(mul,100)

#print mul100(10)

baseTwo = partial(int, base=2)
baseTwo.__doc__ = 'Convert base 2 string to an int'
print baseTwo('10010')

