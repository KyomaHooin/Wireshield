#!/usr/bin/python
#
# AVR RX/TX GPIO
#

import serial,time,sys

try:
	while 1:# MAIN
		try:# SERIAL
			s = serial.Serial('/dev/ttyAMA0',9600,timeout=5)# 8,N,1; 5s scan..
			data = s.readline()
			if data: print data
		except serial.SerialException:
			print 'Serial error.'
			time.sleep(5)
except Exception as e:
	print 'Something bad: ' + e.args[0]
	sys.exit(1)

