import threading
import Queue
import time, random

WORKERS = 2

class Worker(threading.Thread):

    def __init__(self, queue):
        self.__queue = queue
        threading.Thread.__init__(self)

    def run(self):
        while True:
            item = self.__queue.get()
            if item is None:
                break

            time.sleep(random.randint(10, 100) / 1000.0)

            print "task", item, "finished"

queue = Queue.Queue(0)

for i in range(WORKERS):
    Worker(queue).start()

for i in range(10):
    queue.put(i)

for i in range(WORKERS):
    queue.put(None)
