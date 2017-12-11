#!/usr/bin/python
#
# RPi GPIO 32 RST/PWR button
#

import time,sys,os

try:
	import RPi.GPIO as GPIO
except:
	print "Missing GPIO library."
	sys.exit(1)

GPIO.setmode(GPIO.BOARD)
GPIO.setup(32,GPIO.IN, pull_up_down=GPIO.PUD_UP)# pull-up

def rstpwr():
	counter = 0
	while 1:
		if not GPIO.input(32):# pressed = 0
			counter += 1
		else:
			if 6 > counter > 2:
				os.system('reboot')
				return
			elif counter >= 6:
				os.system('halt')
				return
		time.sleep(1)

while 1:
	pressed = GPIO.wait_for_edge(32,GPIO.FALLING)
	if pressed: rstpwr()

GPIO.clenup()

