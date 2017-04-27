#!/usr/bin/python
#
# Serial debug
#

import serial,time,sys

LOG='/root/avr/debug.log'

try:
	try:
		log = open(LOG,'a',0)
		log.write('Program start: ' + time.strftime("%d.%m.%Y %H:%M") + '\n')
	except IOError:
		print 'Read only FS exiting...'
		sys.exit(1)
	while 1:# MAIN
		try:# SERIAL
			s = serial.Serial('/dev/ttyAMA0',9600,xonxoff=0,timeout=5)# 8,N,1; 5s scan..
			data = s.readline()
			if data:
				log.write(time.strftime("%d.%m.%Y %H:%M") + data)
		except:
			log.write('Update error.\n')
			time.sleep(5)
except Exception as e:
	print e.args[0]
log.close()

