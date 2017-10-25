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
GPIO.setup(32,GPIO.IN, pull_up_down=GPIO.PUD_UP)# pull-up

def rstpwr():
	counter = 0
	while 1:
		if not GPIO.input(32):# pressed
			counter += 1
		else:
			if 6 > counter > 2:
				print "System reboot..."
				#os.system('reboot')
			elif counter >= 6:
				print "System halt..."
				#os.system('halt')
			else: return
		time.sleep(1)

while 1:
	pressed = GPIO.wait_for_edge(32,GPIO.FALLING)
	if pressed: rstpwr()

GPIO.clenup()

