#!/usr/bin/python
#
# RPi AVR Shiled OneWire bus RRD database
#

import rrdtool

DATABASE='/root/avr/rpishield.rrd'

rrdtool.create(DATABASE,
	"--step", "300", "--start", "now",# 5min update from now
	"DS:S1:GAUGE:600:-55:125",# Data Source 30s heartbeat,  min/max DS18B20 spec.
	"DS:S2:GAUGE:600:-55:125",
	"DS:S3:GAUGE:600:-55:125",
	"DS:S4:GAUGE:600:-55:125",
	"DS:S5:GAUGE:600:-55:125",
	"DS:S6:GAUGE:600:-55:125",
	"DS:S7:GAUGE:600:-55:125",
	"DS:S8:GAUGE:600:-55:125",
	"RRA:MAX:0.5:1:288",	# 1-day "Roud Robin Archive"
	"RRA:MAX:0.5:3:672",	# 1-week
	"RRA:MAX:0.5:12:744",	# 1-month
	"RRA:MAX:0.5:72:1480",	# 1-year
)

