import ConfigParser
import string

config = ConfigParser.ConfigParser()

config.read("/Users/exit0/sys/pyweb01/cofing.ini")

print string.upper(config.get("book", "title"))
print "by", config.get("book", "author"),

print
print config.get("ematter", "pages"), "pages"

for section in config.sections():
    print section
    for option in config.options(section):
        print option, "=", config.get(section, option)
