#!/usr/bin/python
#
# RPi GPIO RST/PWR button
#

import time,sys,os

try:
	import RPI.GPIO as GPIO
except:
	print "Missing GPIO library."
	sys.exit(1)

GPIO.setmode(GPIO.BOARD)
GPIO.setup(32, GPIO.IN, pull_up_down=GPIO.PUD_UP)# pull-up

#-------------------------

def pwrrst():
	counter = 0
	while 1:
		if not GPIO.input(32):# pressed..
			counter += 1
		else:
			if 7 > counter > 2:
				print "System reboot..."
				#os.system('reboot')
				return
			if counter > 7:
				print "System halt..."
				#os.system('halt')
				return
			counter = 0# reset counter..
		sleep(1)
			
#-------------------------

while 1:
	GPIO.wait_for_edge(32, GPIO.FALLING)
GPIO.clenup()

