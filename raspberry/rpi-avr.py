#!/usr/bin/python
#
# AVR RX/TX GPIO
#

import serial,time

try:
	while 1:# MAIN
		try:# SERIAL
			s = serial.Serial('/dev/ttyAMA0',9600,xonxoff=0,timeout=5)# 8,N,1; 5s scan..
			data = s.readline()
			if data: print data
		except serial.SerialException:
			print 'Serial error.'
			time.sleep(5)
except Exception as e:
	print e.args[0]

