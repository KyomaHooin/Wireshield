#!/usr/bin/python
#
# RPi AVR Shiled OneWire bus data processing
#
# DATA[5min]: S1T000S2T000S3T000S4T000S5T000S6T000S7T000S8T000
#

import rrdtool,smtplib,serial,email,time,sys,re

from email.mime.text import MIMEText

ADMIN='foo@foobar.foo'
DATABASE='/root/avr/rpishield.rrd'
PLOT='/var/www/rpishield/plot/'
LOG='/var/log/rpishield.log'
PAYLOAD=''
UPDATE=True

#----------------

def notify(s,t):
	try:
		text = "\nRack Sensor: " + s + "\nTemperature: " + t + "\n"
		msg = MIMEText(text)
		msg['Subject'] = "Rack Sensor Alarm"
		msg['From'] = 'root@localhost'
		msg['To'] = ADMIN
		s = smtplib.SMTP('foo.foobar.foo')
		s.sendmail('root@localhost', ADMIN, msg.as_string())
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
				pattern = re.compile('S.T(.*)S.T(.*)S.T(.*)S.T(.*)S.T(.*)S.T(.*)S.T(.*)S.T(.*)')
				sensor = re.compile('S(.)T(...)')
				payload = 'N'
				if re.match(pattern, data):
					for (sid,val) in re.findall(sensor, data):
						temperature = float(re.sub('(\d\d)(\d)','\\1.\\2',val))
						payload += ':' + str(temperature)
						if temperature > 40: notify(sid,temperature)
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
						'DEF:s1=' + DATABASE + ':S1:MAX',
						'DEF:s2=' + DATABASE + ':S2:MAX',
						'DEF:s3=' + DATABASE + ':S3:MAX',
						'DEF:s4=' + DATABASE + ':S4:MAX',
						'DEF:s5=' + DATABASE + ':S5:MAX',
						'DEF:s6=' + DATABASE + ':S6:MAX',
						'DEF:s7=' + DATABASE + ':S7:MAX',
						'DEF:s8=' + DATABASE + ':S8:MAX',
						'LINE:s1#6959CD: S1',
						'LINE:s2#00FF7F: S2',
						'LINE:s3#EEEE00: S3',
						'LINE:s4#EE7621: S4',
						'LINE:s5#FF3030: S5',
						'LINE:s6#EE799F: S6',
						'LINE:s7#00CDCD: S7',
						'LINE:s8#C0FF3E: S8',
					)
			except:
				log.write('Plot error.\n')
		#reset update token
		if int(time.strftime("%M")) % 5 == 1: UPDATE=True
except Exception as e:
	print e.args[0]
log.close()

