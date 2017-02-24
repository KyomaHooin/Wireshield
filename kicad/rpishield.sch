EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:dil28
LIBS:rpishield-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RPi OneWire Bus Shield"
Date "2017-02-20"
Rev "1.0.0"
Comp "Narodni Muzeum"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R2
U 1 1 58AAB225
P 2950 1950
F 0 "R2" V 3030 1950 50  0000 C CNN
F 1 "4k7" V 2950 1950 50  0000 C CNN
F 2 "Discret:R3" V 2880 1950 50  0001 C CNN
F 3 "" H 2950 1950 50  0000 C CNN
	1    2950 1950
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58AAB2E9
P 5250 2800
F 0 "R3" V 5330 2800 50  0000 C CNN
F 1 "10k" V 5250 2800 50  0000 C CNN
F 2 "Discret:R3" V 5180 2800 50  0001 C CNN
F 3 "" H 5250 2800 50  0000 C CNN
	1    5250 2800
	0    1    1    0   
$EndComp
$Comp
L Crystal Crystal1
U 1 1 58AAB4F5
P 8950 2150
F 0 "Crystal1" H 8950 2300 50  0000 C CNN
F 1 "16Mhz" H 8950 2000 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 8950 2150 50  0001 C CNN
F 3 "" H 8950 2150 50  0000 C CNN
	1    8950 2150
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 58AAB5B9
P 9500 2350
F 0 "C2" H 9525 2450 50  0000 L CNN
F 1 "22pF" H 9525 2250 50  0000 L CNN
F 2 "Discret:C1V8" H 9538 2200 50  0001 C CNN
F 3 "" H 9500 2350 50  0000 C CNN
	1    9500 2350
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 58AAB631
P 9500 1950
F 0 "C1" H 9525 2050 50  0000 L CNN
F 1 "22pF" H 9525 1850 50  0000 L CNN
F 2 "Discret:C1V8" H 9538 1800 50  0001 C CNN
F 3 "" H 9500 1950 50  0000 C CNN
	1    9500 1950
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 58AAB677
P 5750 2600
F 0 "C3" H 5775 2700 50  0000 L CNN
F 1 "100nF" H 5775 2500 50  0000 L CNN
F 2 "Discret:C1V8" H 5788 2450 50  0001 C CNN
F 3 "" H 5750 2600 50  0000 C CNN
	1    5750 2600
	0    -1   -1   0   
$EndComp
$Comp
L JACK_2P OneWireBus1
U 1 1 58AB2646
P 1900 1950
F 0 "OneWireBus1" H 1550 1750 50  0000 C CNN
F 1 "JACK_2P" H 1750 2200 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 1900 1950 50  0001 C CNN
F 3 "" H 1900 1950 50  0000 C CNN
	1    1900 1950
	1    0    0    -1  
$EndComp
$Comp
L LED LED1
U 1 1 58AB2805
P 9050 3650
F 0 "LED1" H 9050 3750 50  0000 C CNN
F 1 "10mA 2V" H 9050 3550 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 9050 3650 50  0001 C CNN
F 3 "" H 9050 3650 50  0000 C CNN
	1    9050 3650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58AB575A
P 9600 3650
F 0 "R4" V 9680 3650 50  0000 C CNN
F 1 "330" V 9600 3650 50  0000 C CNN
F 2 "Discret:R3" V 9530 3650 50  0001 C CNN
F 3 "" H 9600 3650 50  0000 C CNN
	1    9600 3650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 58AB5E07
P 2550 1600
F 0 "#PWR01" H 2550 1350 50  0001 C CNN
F 1 "GND" H 2550 1450 50  0000 C CNN
F 2 "" H 2550 1600 50  0000 C CNN
F 3 "" H 2550 1600 50  0000 C CNN
	1    2550 1600
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 58AB7A9E
P 2950 3000
F 0 "R1" V 3030 3000 50  0000 C CNN
F 1 "4k7" V 2950 3000 50  0000 C CNN
F 2 "Discret:R3" V 2880 3000 50  0001 C CNN
F 3 "" H 2950 3000 50  0000 C CNN
	1    2950 3000
	1    0    0    -1  
$EndComp
$Comp
L JACK_2P OneWireBus2
U 1 1 58AB7AA4
P 1900 3000
F 0 "OneWireBus2" H 1550 2800 50  0000 C CNN
F 1 "JACK_2P" H 1750 3250 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 1900 3000 50  0001 C CNN
F 3 "" H 1900 3000 50  0000 C CNN
	1    1900 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58AB7AAA
P 2550 2650
F 0 "#PWR02" H 2550 2400 50  0001 C CNN
F 1 "GND" H 2550 2500 50  0000 C CNN
F 2 "" H 2550 2650 50  0000 C CNN
F 3 "" H 2550 2650 50  0000 C CNN
	1    2550 2650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 58AB9E08
P 8650 3650
F 0 "#PWR03" H 8650 3400 50  0001 C CNN
F 1 "GND" H 8650 3500 50  0000 C CNN
F 2 "" H 8650 3650 50  0000 C CNN
F 3 "" H 8650 3650 50  0000 C CNN
	1    8650 3650
	0    1    1    0   
$EndComp
$Comp
L LED LED2
U 1 1 58ABA9E9
P 9050 4100
F 0 "LED2" H 9050 4200 50  0000 C CNN
F 1 "10mA 2V" H 9050 4000 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 9050 4100 50  0001 C CNN
F 3 "" H 9050 4100 50  0000 C CNN
	1    9050 4100
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58ABA9EF
P 9600 4100
F 0 "R5" V 9680 4100 50  0000 C CNN
F 1 "330" V 9600 4100 50  0000 C CNN
F 2 "Discret:R3" V 9530 4100 50  0001 C CNN
F 3 "" H 9600 4100 50  0000 C CNN
	1    9600 4100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 58ABA9F5
P 8650 4100
F 0 "#PWR04" H 8650 3850 50  0001 C CNN
F 1 "GND" H 8650 3950 50  0000 C CNN
F 2 "" H 8650 4100 50  0000 C CNN
F 3 "" H 8650 4100 50  0000 C CNN
	1    8650 4100
	0    1    1    0   
$EndComp
NoConn ~ 250  5350
Text Label 8450 1950 0    60   ~ 0
XTAL1
Text Label 8450 2350 0    60   ~ 0
XTAL2
Text Label 10050 3650 2    60   ~ 0
A4
Text Label 10050 4100 2    60   ~ 0
A5
Text Label 3350 1800 2    60   ~ 0
A1
Text Label 3350 2100 2    60   ~ 0
A0
Text Label 3350 2850 2    60   ~ 0
A3
Text Label 3350 3150 2    60   ~ 0
A2
$Comp
L CONN_01X04 Conn1
U 1 1 58AC5222
P 6150 2450
F 0 "Conn1" H 6150 2700 50  0000 C CNN
F 1 "UART" V 6250 2450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04_Pitch2.54mm" H 6150 2450 50  0001 C CNN
F 3 "" H 6150 2450 50  0000 C CNN
	1    6150 2450
	1    0    0    -1  
$EndComp
Text Label 4750 2800 0    60   ~ 0
A5
Text Label 4750 2500 0    60   ~ 0
RX
Text Label 4750 2400 0    60   ~ 0
TX
Text Label 6750 2850 2    60   ~ 0
TX_RPi
Text Label 6750 1950 2    60   ~ 0
RX_RPI
$Comp
L R R7
U 1 1 58ACE900
P 5700 1950
F 0 "R7" V 5780 1950 50  0000 C CNN
F 1 "20k" V 5700 1950 50  0000 C CNN
F 2 "Discret:R3" V 5630 1950 50  0001 C CNN
F 3 "" H 5700 1950 50  0000 C CNN
	1    5700 1950
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 58ACE9F7
P 6200 1950
F 0 "R6" V 6280 1950 50  0000 C CNN
F 1 "10k" V 6200 1950 50  0000 C CNN
F 2 "Discret:R3" V 6130 1950 50  0001 C CNN
F 3 "" H 6200 1950 50  0000 C CNN
	1    6200 1950
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR05
U 1 1 58AD1776
P 5400 1950
F 0 "#PWR05" H 5400 1700 50  0001 C CNN
F 1 "GND" H 5400 1800 50  0000 C CNN
F 2 "" H 5400 1950 50  0000 C CNN
F 3 "" H 5400 1950 50  0000 C CNN
	1    5400 1950
	0    1    1    0   
$EndComp
$Comp
L CONN_02X20 Conn2
U 1 1 58ADA3AF
P 2300 5950
F 0 "Conn2" H 2300 7000 50  0000 C CNN
F 1 "RPi" V 2300 5950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x20_Pitch2.54mm" H 2300 5000 50  0001 C CNN
F 3 "" H 2300 5000 50  0000 C CNN
	1    2300 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58AE0C72
P 1550 5400
F 0 "#PWR06" H 1550 5150 50  0001 C CNN
F 1 "GND" H 1550 5250 50  0000 C CNN
F 2 "" H 1550 5400 50  0000 C CNN
F 3 "" H 1550 5400 50  0000 C CNN
	1    1550 5400
	0    1    1    0   
$EndComp
Text Label 3200 5400 2    60   ~ 0
RX_RPI
Text Label 3200 5300 2    60   ~ 0
TX_RPI
$Comp
L DIL28 Conn3
U 1 1 58AE5DAD
P 5600 5350
F 0 "Conn3" H 5600 5800 40  0000 C CNN
F 1 "Atmega328" V 5600 5050 40  0000 C CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_Socket" H 5600 5800 60  0001 C CNN
F 3 "" H 5600 5800 60  0001 C CNN
	1    5600 5350
	1    0    0    -1  
$EndComp
Text Label 4850 5000 0    60   ~ 0
RST
Text Label 4850 5100 0    60   ~ 0
RX
Text Label 4850 5200 0    60   ~ 0
TX
Text Label 4850 5800 0    60   ~ 0
XTAL1
Text Label 4850 5900 0    60   ~ 0
XTAL2
Text Label 6250 6200 2    60   ~ 0
D10
Text Label 6250 6100 2    60   ~ 0
D11
Text Label 4850 5600 0    60   ~ 0
VCC
Text Label 3200 5000 2    60   ~ 0
VCC
NoConn ~ 5900 5600
NoConn ~ 5900 5700
NoConn ~ 5900 5800
NoConn ~ 5300 5300
NoConn ~ 5300 5400
NoConn ~ 5300 5500
NoConn ~ 5300 6000
NoConn ~ 5300 6100
NoConn ~ 5300 6200
NoConn ~ 5300 6300
NoConn ~ 2050 5100
NoConn ~ 2050 5500
NoConn ~ 2050 5600
NoConn ~ 2050 5700
NoConn ~ 2050 5800
NoConn ~ 2050 6300
NoConn ~ 2050 6400
NoConn ~ 2050 6500
NoConn ~ 2050 6600
NoConn ~ 2050 6700
NoConn ~ 2050 6800
NoConn ~ 2550 6900
NoConn ~ 2550 6800
NoConn ~ 2550 6700
NoConn ~ 2550 6600
NoConn ~ 2550 6500
NoConn ~ 2550 6400
NoConn ~ 2550 6300
NoConn ~ 2550 6200
NoConn ~ 2550 6000
NoConn ~ 2550 5900
NoConn ~ 2550 5800
NoConn ~ 2550 5700
NoConn ~ 2550 5600
NoConn ~ 2550 5500
NoConn ~ 2550 5100
$Comp
L CONN_01X06 Conn4
U 1 1 58AC58DD
P 9300 5600
F 0 "Conn4" H 9300 5950 50  0000 C CNN
F 1 "SPI" V 9400 5600 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06_Pitch2.54mm" H 9300 5600 50  0001 C CNN
F 3 "" H 9300 5600 50  0000 C CNN
	1    9300 5600
	1    0    0    -1  
$EndComp
Text Label 8500 5550 0    60   ~ 0
D10
Text Label 8500 5650 0    60   ~ 0
D11
Text Label 8500 5750 0    60   ~ 0
D12
Text Label 8500 5850 0    60   ~ 0
D13
$Comp
L GND #PWR07
U 1 1 58AC5EC1
P 8950 5350
F 0 "#PWR07" H 8950 5100 50  0001 C CNN
F 1 "GND" H 8950 5200 50  0000 C CNN
F 2 "" H 8950 5350 50  0000 C CNN
F 3 "" H 8950 5350 50  0000 C CNN
	1    8950 5350
	0    1    1    0   
$EndComp
Text Label 8500 5450 0    60   ~ 0
D9
$Comp
L GND #PWR08
U 1 1 58AE9494
P 4700 5700
F 0 "#PWR08" H 4700 5450 50  0001 C CNN
F 1 "GND" H 4700 5550 50  0000 C CNN
F 2 "" H 4700 5700 50  0000 C CNN
F 3 "" H 4700 5700 50  0000 C CNN
	1    4700 5700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 58ABC46D
P 10100 2150
F 0 "#PWR09" H 10100 1900 50  0001 C CNN
F 1 "GND" H 10100 2000 50  0000 C CNN
F 2 "" H 10100 2150 50  0000 C CNN
F 3 "" H 10100 2150 50  0000 C CNN
	1    10100 2150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 58AC7B71
P 5400 2300
F 0 "#PWR010" H 5400 2050 50  0001 C CNN
F 1 "GND" H 5400 2150 50  0000 C CNN
F 2 "" H 5400 2300 50  0000 C CNN
F 3 "" H 5400 2300 50  0000 C CNN
	1    5400 2300
	0    1    1    0   
$EndComp
Text Label 6300 5000 2    60   ~ 0
A5
Text Label 6300 5100 2    60   ~ 0
A4
Text Label 6300 5300 2    60   ~ 0
A2
Text Label 6300 5400 2    60   ~ 0
A1
Text Label 6300 5200 2    60   ~ 0
A3
Text Label 6300 5500 2    60   ~ 0
A0
Text Label 6250 6300 2    60   ~ 0
D9
Text Label 6250 6000 2    60   ~ 0
D12
Text Label 6250 5900 2    60   ~ 0
D13
NoConn ~ 2550 6100
NoConn ~ 2050 6100
NoConn ~ 2050 6000
Text Label 4750 2600 0    60   ~ 0
RST
NoConn ~ 2050 5900
Wire Wire Line
	5950 2400 4750 2400
Wire Wire Line
	5950 2500 4750 2500
Wire Wire Line
	5950 2850 6750 2850
Wire Wire Line
	5950 2500 5950 2850
Wire Wire Line
	5950 1950 5950 2400
Wire Wire Line
	5950 2300 5400 2300
Wire Wire Line
	4750 2600 5600 2600
Wire Wire Line
	5400 2600 5400 2800
Connection ~ 5400 2600
Wire Wire Line
	4750 2800 5100 2800
Wire Wire Line
	5900 2600 5950 2600
Wire Wire Line
	5900 6300 6250 6300
Wire Wire Line
	5900 6000 6250 6000
Wire Wire Line
	5900 5900 6250 5900
Wire Wire Line
	9100 5850 8500 5850
Wire Wire Line
	9100 5750 8500 5750
Wire Wire Line
	9100 5650 8500 5650
Wire Wire Line
	9100 5550 8500 5550
Wire Wire Line
	9100 5350 8950 5350
Wire Wire Line
	9100 5450 8500 5450
Wire Wire Line
	5900 5500 6300 5500
Wire Wire Line
	5900 5200 6300 5200
Wire Wire Line
	5900 5400 6300 5400
Wire Wire Line
	5900 5300 6300 5300
Wire Wire Line
	5900 5100 6300 5100
Wire Wire Line
	5900 5000 6300 5000
Connection ~ 2950 3150
Wire Wire Line
	2350 3150 3350 3150
Connection ~ 2950 2850
Wire Wire Line
	2350 2850 3350 2850
Connection ~ 2950 2100
Wire Wire Line
	2350 2100 3350 2100
Connection ~ 2950 1800
Wire Wire Line
	2350 1800 3350 1800
Wire Wire Line
	9700 2150 10100 2150
Wire Wire Line
	8450 2350 9350 2350
Wire Wire Line
	8450 1950 9350 1950
Wire Wire Line
	9700 2350 9650 2350
Wire Wire Line
	9650 1950 9700 1950
Wire Wire Line
	6250 6100 5900 6100
Wire Wire Line
	5900 6200 6250 6200
Wire Wire Line
	5300 5900 4850 5900
Wire Wire Line
	5300 5800 4850 5800
Wire Wire Line
	4700 5700 5300 5700
Wire Wire Line
	5300 5600 4850 5600
Wire Wire Line
	4850 5200 5300 5200
Wire Wire Line
	4850 5100 5300 5100
Wire Wire Line
	4850 5000 5300 5000
Wire Wire Line
	5550 1950 5400 1950
Wire Wire Line
	2550 3000 2550 2650
Wire Wire Line
	2350 3100 2350 3150
Wire Wire Line
	2350 3000 2550 3000
Wire Wire Line
	2350 2050 2350 2100
Wire Wire Line
	2550 1950 2550 1600
Wire Wire Line
	2350 1950 2550 1950
Wire Wire Line
	6350 1950 6750 1950
Connection ~ 5950 1950
Wire Wire Line
	5850 1950 6050 1950
Wire Wire Line
	8950 2350 8950 2300
Wire Wire Line
	8950 1950 8950 2000
Connection ~ 9700 2150
Connection ~ 8950 2350
Connection ~ 8950 1950
Wire Wire Line
	9700 1950 9700 2350
Wire Wire Line
	8900 4100 8650 4100
Wire Wire Line
	9450 4100 9200 4100
Wire Wire Line
	10050 4100 9750 4100
Wire Wire Line
	8900 3650 8650 3650
Wire Wire Line
	9450 3650 9200 3650
Wire Wire Line
	10050 3650 9750 3650
NoConn ~ 2550 5200
NoConn ~ 2050 5200
NoConn ~ 2050 5300
$Comp
L GND #PWR011
U 1 1 58B08096
P 1550 6200
F 0 "#PWR011" H 1550 5950 50  0001 C CNN
F 1 "GND" H 1550 6050 50  0000 C CNN
F 2 "" H 1550 6200 50  0000 C CNN
F 3 "" H 1550 6200 50  0000 C CNN
	1    1550 6200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 58B0812F
P 1550 6900
F 0 "#PWR012" H 1550 6650 50  0001 C CNN
F 1 "GND" H 1550 6750 50  0000 C CNN
F 2 "" H 1550 6900 50  0000 C CNN
F 3 "" H 1550 6900 50  0000 C CNN
	1    1550 6900
	0    1    1    0   
$EndComp
NoConn ~ 2050 5000
Wire Wire Line
	3200 5000 2550 5000
Wire Wire Line
	3200 5300 2550 5300
Wire Wire Line
	3200 5400 2550 5400
Wire Wire Line
	1550 5400 2050 5400
Wire Wire Line
	1550 6200 2050 6200
Wire Wire Line
	1550 6900 2050 6900
$EndSCHEMATC
