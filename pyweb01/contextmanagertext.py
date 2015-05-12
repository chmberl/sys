
from __future__ import with_statement
import logging
from contextlib import contextmanager

@contextmanager
def logged(klass, logger):

    def _log(f):
        def __log(*args, **kw):
            logger(f, args, kw)
            return f(*args, **kw)
        return __log

    for attribute in dir(klass):
        if attribute.startswith('_'):
            continue
        element = getattr(klass, attribute)
        setattr(klass, '__logged_%s' % attribute, element)
        setattr(klass, attribute, _log(element))

    yield klass

    for attribute in dir(klass):
        if not attribute.startswith('__logged_'):
            continue

        element = getattr(klass, attribute)
        setattr(klass, attribute[len('__logged_'):], element)
        delattr(klass, attribute)


class One(object):
    def _private(self):
        pass

    def one(self, other):
        self.two()
        other.thing(self)
        self._private()

    def two(self):
        pass

class Two(object):
    def thing(self, other):
        other.two()

calls = []

def called(meth, args, kw):

    calls.append(meth.im_func.func_name)

with logged(One, called):
    one = One()
    two = Two()
    one.one(two)

print calls
