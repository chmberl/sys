#!/usr/bin/python
# -*- coding:utf-8 -*-

import qi
import sys
import signal
import time
import os
import almath

session = qi.Session()
session.connect("")
motion = session.service("ALMotion")
behaviorManager = session.service("ALBehaviorManager")
motion.setMoveArmsEnabled(0, 0)

def start_behavior():
    if not behaviorManager.isBehaviorRunning('chengdu'):
        behaviorManager.startBehavior("chengdu")

def handle_forward(sig, frame):
    motion.pCall("moveTo", 0.5, 0, 0)

def handle_left(sig, frame):
    motion.pCall("moveTo", 0, 0, 0.628)

def handle_right(sig, frame):
    motion.pCall("moveTo", 0, 0, -0.628)

def handle_stop(sig, frame):
    motion.stopMove()

def head(change_Yaw, change_Pitch):
    current_Yaw = motion.getAngles("HeadYaw", False)
    current_Pitch = motion.getAngles("HeadPitch", False)
    current_Yaw_Deg = current_Yaw[0] * almath.TO_DEG
    current_Pitch_Deg = current_Pitch[0] * almath.TO_DEG
    if change_Yaw > 0 and change_Yaw * 10 + current_Yaw_Deg <= 90:
        motion.changeAngles("HeadYaw", change_Yaw * 10 * almath.TO_RAD, 0.2)
    elif change_Yaw < 0 and change_Yaw * 10 + current_Yaw_Deg >= -90:
        motion.changeAngles("HeadYaw", change_Yaw * 10 * almath.TO_RAD, 0.2)
    if change_Pitch > 0 and change_Pitch * 5 + current_Pitch_Deg < 50:
        motion.changeAngles("HeadPitch", change_Pitch * 5 * almath.TO_RAD, 0.2)
    elif (change_Pitch < 0 and
          change_Pitch * 5 + current_Pitch_Deg > -50):
        motion.changeAngles("HeadPitch", change_Pitch * 5 * almath.TO_RAD, 0.2)

def handle_head_pitch_0(sig, frame):
    change_Yaw = 1
    head(0, -1)

def handle_head_pitch_1(sig, frame):
    head(0, 1)

def handle_head_yaw_0(sig, frame):
    change_Yaw = 1
    head(-1, 0)

def handle_head_yaw_1(sig, frame):
    head(1, 0)

def handle_int(sig, frame):
    sys.exit(0)

signal.signal(25, handle_forward)
signal.signal(26, handle_left)
signal.signal(27, handle_right)
signal.signal(28, handle_stop)
signal.signal(29, handle_head_pitch_0)
signal.signal(30, handle_head_pitch_1)
signal.signal(31, handle_head_yaw_0)
signal.signal(24, handle_head_yaw_1)

if __name__ == "__main__":
    print "pid: " + str(os.getpid())
    while True:
        time.sleep(3)
