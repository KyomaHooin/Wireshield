#!/usr/bin/python
#
# RPi AVR Shiled OneWire bus RRD database
#

import rrdtool

DATABASE='/root/avr/rpishield.rrd'

rrdtool.create(DATABASE,
	"--step", "300", "--start", "0",# 5min update from now
	"DS:S1:GAUGE:330:-55:125",# Data Source 30s heartbeat,  min/max DS18B20 spec.
	"DS:S2:GAUGE:330:-55:125",
	"DS:S3:GAUGE:330:-55:125",
	"DS:S4:GAUGE:330:-55:125",
	"DS:S5:GAUGE:330:-55:125",
	"DS:S6:GAUGE:330:-55:125",
	"DS:S7:GAUGE:330:-55:125",
	"DS:S8:GAUGE:330:-55:125",
	"RRA:MAX:0.5:1:1d",	# 1-day "Roud Robin Archive"
	"RRA:MAX:0.5:3:1w",	# 1-week
	"RRA:MAX:0.5:12:1m",	# 1-month
	"RRA:MAX:0.5:72:1y",	# 1-year
)

