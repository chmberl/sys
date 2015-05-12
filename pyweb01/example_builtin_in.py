
import glob, os

modules = []
print "hello world"
for module_file in glob.glob("*-plugin.py"):
    try:
        print "world"
        module_name,ext = os.path.splitext(os.path.basename(module_file))
        module = __import__(module_name)
        modules.append(module)
    except ImportError:
        print "hello"
        pass

for module in modules:
    module.hello()
print "end"
