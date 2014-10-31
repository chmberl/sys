#!/usr/bin/env python
# coding:utf-8
from socket import *
from time import ctime

HOST = 'localhost'
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST, PORT)

udpSerSock = socket(AF_INET, SOCK_DGRAM)
udpSerSock.bind(ADDR)


try:

    while True:
        print 'waiting for message...'
        data, addr = udpSerSock.recvfrom(BUFSIZ)

        udpSerSock.sendto('[%s] %s' % (ctime(),data), addr)

        print '...received from and returned to:',addr
except KeyboardInterrupt:
    print "error"
finally:
    udpSerSock.close()
    print "\n服务端已经关闭"
