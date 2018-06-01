#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# RPi AVR Shiled OneWire bus data processing
#
# DATA[5min]: S0T000S1T000S2T000S3T000S4T000S5T000S6T000S7T000
#

import rrdtool,smtplib,serial,email,time,sys,re

from email.mime.text import MIMEText

ADMIN='foo@foobar.foo'
ROOT='root@local-domain.tld'
RELAY='relay.mx.tld'
MAXTEMP=30

DATABASE='/root/avr/rpishield.rrd'
PLOT='/var/www/rpishield/plot/'
LOG='/var/log/rpishield.log'
UPDATE=True

#----------------

def notify(s,t):
	try:
		text = "\nRack Sensor: " + s + "\nTemperature: " + str(t) + "\n"
		msg = MIMEText(text)
		msg['Subject'] = "Rack Sensor Alarm"
		msg['From'] = 'Wireshield <' + ROOT + '>'
		msg['To'] = ADMIN
		s = smtplib.SMTP(RELAY)
		s.sendmail(ROOT, ADMIN, msg.as_string())
		s.quit()
	except: pass

#----------------

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
				pattern = re.compile('(S.T...){8}')
				sensor = re.compile('S(.)T(...)')
				payload = 'N'
				if re.match(pattern, data):
					for (sid,val) in re.findall(sensor, data):
						temperature = float(re.sub('(\d\d)(\d)','\\1.\\2',val))
						if temperature > 50: temperature = 'U'# errorneous sensor
						elif temperature > MAXTEMP: notify(sid,temperature)
						payload += ':' + str(temperature)
					rrdtool.update(DATABASE, payload)
		except:
			log.write('Update error.\n')
			time.sleep(300)
		# 5 min graph plot update..
		if int(time.strftime("%M")) % 5 == 0 and UPDATE:
			UPDATE=False
			try:
				for interval in ['1d','1w','1m','1y']:			
					rrdtool.graph(PLOT + 'rack_plot_' + interval +'.png',
						'--title', 'NM Rack Temperature',
						'--start', 'now-' + interval,# substraction
						'--end','now',
						'--width','600',
						'--height','150',
						'--vertical-label','Temperature °C',
						'DEF:s0last=' + DATABASE + ':S0:LAST',
						'DEF:s1last=' + DATABASE + ':S1:LAST',
						'DEF:s2last=' + DATABASE + ':S2:LAST',
						'DEF:s3last=' + DATABASE + ':S3:LAST',
						'DEF:s4last=' + DATABASE + ':S4:LAST',
						'DEF:s5last=' + DATABASE + ':S5:LAST',
						'DEF:s6last=' + DATABASE + ':S6:LAST',
						'DEF:s7last=' + DATABASE + ':S7:LAST',
						'COMMENT:\s',
						'COMMENT:            Curr    Max    Avg                 Curr    Max    Avg',
						'COMMENT:\s',
						'COMMENT:\s',
						'COMMENT:\s',
						'LINE2:s0last#F3C300:R1\t',
						'GPRINT:s0last:LAST:%5.1lf',
						'GPRINT:s0last:MAX:%5.1lf',
						'GPRINT:s0last:AVERAGE:%5.1lf\t',
						'LINE2:s4last#875692:R5\t',
						'GPRINT:s4last:LAST:%5.1lf',
						'GPRINT:s4last:MAX:%5.1lf',
						'GPRINT:s4last:AVERAGE:%5.1lf\\n',
						'LINE2:s1last#F38400:R2\t',
						'GPRINT:s1last:LAST:%5.1lf',
						'GPRINT:s1last:MAX:%5.1lf',
						'GPRINT:s1last:AVERAGE:%5.1lf\t',
						'LINE2:s5last#A1CAF1:R6\t',
						'GPRINT:s5last:LAST:%5.1lf',
						'GPRINT:s5last:MAX:%5.1lf',
						'GPRINT:s5last:AVERAGE:%5.1lf\\n',
						'LINE2:s2last#BE0032:R3\t',
						'GPRINT:s2last:LAST:%5.1lf',
						'GPRINT:s2last:MAX:%5.1lf',
						'GPRINT:s2last:AVERAGE:%5.1lf\t',
						'LINE2:s6last#C2B280:R7\t',
						'GPRINT:s6last:LAST:%5.1lf',
						'GPRINT:s6last:MAX:%5.1lf',
						'GPRINT:s6last:AVERAGE:%5.1lf\\n',
						'LINE2:s3last#848482:R4\t',
						'GPRINT:s3last:LAST:%5.1lf',
						'GPRINT:s3last:MAX:%5.1lf',
						'GPRINT:s3last:AVERAGE:%5.1lf\t',
						'LINE2:s7last#008856:R8\t',
						'GPRINT:s7last:LAST:%5.1lf',
						'GPRINT:s7last:MAX:%5.1lf',
						'GPRINT:s7last:AVERAGE:%5.1lf\\n'
					)
			except:
				log.write('Plot error.\n')
		#reset update token
		if int(time.strftime("%M")) % 5 == 1: UPDATE=True
except Exception as e:
	print e.args[0]
log.close()

