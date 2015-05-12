import Queue
import bisect

Empty = Queue.Empty

class PriorityQueue(Queue.Queue):

    def __put__(self, item):
        bisect.insort(self.queue, item)

queue = PriorityQueue(0)

queue.put((20, "seconde"))
queue.put((10, "first"))
queue.put((30, "third"))

try:
    while 1:
        print queue.get_nowait()
except Empty:
    pass
