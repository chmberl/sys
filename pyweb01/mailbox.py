#!/usr/bin/env python
#coding:utf-8
from smtplib import SMTP
from poplib import POP3
from time import sleep

STMPSVR = 'smtp.163.com'
POP3SVR = 'pop.163.com'

origHdrs = ['From:oremail@163.com', 'To:oremail@163.com', 'Subject:test msg']

origBody = u"I'm sorry, 这又是一个测试程序。"
origMsg = '\r\n\r\n'.join(['\r\n'.join(origHdrs), '\r\n'.join(origBody)]).encode('utf-8')

sendSvr = SMTP(STMPSVR)
rtnval = sendSvr.login('oremail@163.com','')
print rtnval
errs = sendSvr.sendmail('oremail@163.com',('oremail@163.com','997339763@qq.com'), origMsg)
sendSvr.quit()

assert len(errs) == 0, errs
sleep(10)

recvSvr = POP3(POP3SVR)
recvSvr.user('oremail@163.com')
recvSvr.pass_('')
rsp, msg, siz = recvSvr.retr(recvSvr.stat()[0])
sep = msg.index('')
recvBody =msg[sep+1:]
print recvBody
assert origBody == recvBody

