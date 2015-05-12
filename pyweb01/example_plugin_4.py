def dump(value):
    print value, "=>", dir(value)

book = 'library2'
pages = 250
scripts = 350

print "the %(book)s book contains more than %(scripts)s" % vars()
