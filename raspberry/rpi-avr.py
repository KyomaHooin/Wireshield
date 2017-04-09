#!/usr/bin/python
#
# RPi AVR Shiled OneWire bus data processing
#
# DATA[5min]: S1T000S2T000S3T000S4T000S5T000S6T000S7T000S8T000
#
#rrdtool.create(DATABASE,
#	"--step", "300", "--start", '0',# 5min update from now
#	"DS:S1:GAUGE:400:-55:125",# min/max DS18B20 spec.
#	"DS:S2:GAUGE:400:-55:125",
#	"DS:S3:GAUGE:400:-55:125",
#	"DS:S4:GAUGE:400:-55:125",
#	"DS:S5:GAUGE:400:-55:125",
#	"DS:S6:GAUGE:400:-55:125",
#	"DS:S7:GAUGE:400:-55:125",
#	"DS:S8:GAUGE:400:-55:125",
#	"RRA:MAX:0.5:1:1d",	# 1-day "Roud Robin Archive"
#	"RRA:MAX:0.5:3:1w",	# 1-week
#	"RRA:MAX:0.5:12:1m",	# 1-month
#	"RRA:MAX:0.5:72:1y",	# 1-year
#)
#

import rrdtool,smtplib,serial,email,time,re

from email.mime.text import MIMEText

ADMIN='foo@bar.cz'
DATABASE='/root/avr/rpishield.rrd'
PLOT='/var/www/rpishield/plot/'
PAYLOAD=''
UPDATE=True

#----------------


def notify(s,t):
	try:
		text = "Sensor: " + s + "\n\nTemeperature: " + t + "\n\n"
		msg = MIMEText(text)
		msg['Subject'] = "Rack Sensor Alarm"
		msg['From'] = 'root@xxx.xx.cz'
		msg['To'] = ADMIN
		s = smtplib.SMTP('xx.xx.cz')
		s.sendmail('root@xxx.xx.xx', ADMIN, msg.as_string())
		s.quit()
	except: pass

#----------------	

try:
	while 1:# MAIN
		try:# SERIAL
			s = serial.Serial('/dev/ttyAMA0',9600,xonxoff=0,timeout=5)# 8,N,1; 5s scan..
			data = s.readline()
			if data: print data,
	#		if data:
	#			pattern = re.compile('^S1T(*)S2T(*)S3T(*)S4T(*)S5T(*)S6T(*)S7T(*)S8T(*)$')
	#			value = re.compile('S(\d)T(\d{3})')
	#			if re.match(pattern, data):
	#				rrdtool.update('DATABASE', re.sub(pattern, time.gmtime()
	#					+ ':\\1:\\2:\\3:\\4:\\5:\\6:\\7:\\8', data))
	#			for (sid,val) in re.findall(value, data):
	#				if val >= 40:# 40C
	#					notify(sid,val)
		except serial.SerialException:
			print 'Serial error.'
			time.sleep(5)
	#	#15 min graph plot update..
	#	if int(time.strftime("%M")) % 15 == 0 and UPDATE:
	#		UPDATE=False
	#		for interval in ['1d','1w','1m','1y']:			
	#			rrdtool.graph(PLOT + 'rack_plot_' + ;interval +'.png',
	#				'--title','NM Rack Temeprature',
	#				'--start','now-' + interval,# substraction
	#				'--end','now',
	#				'--width','600',
	#				'--height','150',
	#				'--step','60',
	#				'DEF:s1=' + DATABASE + 'S1:MAX',
	#				'DEF:s2=' + DATABASE + 'S2:MAX',
	#				'DEF:s3=' + DATABASE + 'S3:MAX',
	#				'DEF:s4=' + DATABASE + 'S4:MAX',
	#				'DEF:s5:' + DATABASE + 'S5:MAX',
	#				'DEF:s6:' + DATABASE + 'S6:MAX',
	#				'DEF:s7:' + DATABASE + 'S7:MAX',
	#				'DEF:s8:' + DATABASE + 'S8:MAX',
	#				...
	#	#reset update token
	#	if int(time.strftime("%M")) % 15 == 1: UPDATE=True
except Exception as e:
	print e.args[0]

