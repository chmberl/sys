
class HTTPError(Exception):

    def __init__(self, url, errcode, errmsg):
        self.url = url
        self.errcode = errcode
        self.errmsg = errmsg

    def __str__(self):
        return ("<HTTPError for %s: %s %s>" % (self.url, self.errcode, self.errmsg))

try:
    raise HTTPError("http://www.python.org",200,"not found")
except HTTPError,error:
    print "url", error.url
    print "errcode", error.errcode
    print "errmsg", error.errmsg





