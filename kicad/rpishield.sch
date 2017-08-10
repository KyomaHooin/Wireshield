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
LIBS:rpishield
LIBS:rpishield-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RPi OneWire Shield"
Date "2017-02-25"
Rev "1.0.1"
Comp "Narodni Muzeum"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R2
U 1 1 58AAB225
P 2800 1800
F 0 "R2" V 2880 1800 50  0000 C CNN
F 1 "4k7" V 2800 1800 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 2730 1800 50  0001 C CNN
F 3 "" H 2800 1800 50  0000 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 58AAB2E9
P 5450 2750
F 0 "R3" V 5530 2750 50  0000 C CNN
F 1 "10k" V 5450 2750 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 5380 2750 50  0001 C CNN
F 3 "" H 5450 2750 50  0000 C CNN
	1    5450 2750
	0    1    1    0   
$EndComp
$Comp
L Crystal Crystal1
U 1 1 58AAB4F5
P 8850 2000
F 0 "Crystal1" H 8850 2150 50  0000 C CNN
F 1 "16Mhz" H 8850 1850 50  0000 C CNN
F 2 "Crystals:Resonator-2pin_w8.0mm_h3.5mm" H 8850 2000 50  0001 C CNN
F 3 "" H 8850 2000 50  0000 C CNN
	1    8850 2000
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 58AAB5B9
P 9400 2200
F 0 "C2" H 9425 2300 50  0000 L CNN
F 1 "22pF" H 9425 2100 50  0000 L CNN
F 2 "footprint:Custom_Disc_D3.0mm_W1.6mm_P3.175mm" H 9438 2050 50  0001 C CNN
F 3 "" H 9400 2200 50  0000 C CNN
	1    9400 2200
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 58AAB631
P 9400 1800
F 0 "C1" H 9425 1900 50  0000 L CNN
F 1 "22pF" H 9425 1700 50  0000 L CNN
F 2 "footprint:Custom_Disc_D3.0mm_W1.6mm_P3.175mm" H 9438 1650 50  0001 C CNN
F 3 "" H 9400 1800 50  0000 C CNN
	1    9400 1800
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 58AAB677
P 5950 2550
F 0 "C3" H 5975 2650 50  0000 L CNN
F 1 "100nF" H 5975 2450 50  0000 L CNN
F 2 "footprint:Custom_Disc_D3.0mm_W1.6mm_P3.175mm_normal" H 5988 2400 50  0001 C CNN
F 3 "" H 5950 2550 50  0000 C CNN
	1    5950 2550
	0    -1   -1   0   
$EndComp
$Comp
L LED LED1
U 1 1 58AB2805
P 8850 3600
F 0 "LED1" H 8850 3700 50  0000 C CNN
F 1 "10mA 2V" H 8850 3500 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm_FlatTop" H 8850 3600 50  0001 C CNN
F 3 "" H 8850 3600 50  0000 C CNN
	1    8850 3600
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58AB575A
P 9400 3600
F 0 "R4" V 9480 3600 50  0000 C CNN
F 1 "330" V 9400 3600 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 9330 3600 50  0001 C CNN
F 3 "" H 9400 3600 50  0000 C CNN
	1    9400 3600
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 58AB7A9E
P 2800 2850
F 0 "R1" V 2880 2850 50  0000 C CNN
F 1 "4k7" V 2800 2850 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 2730 2850 50  0001 C CNN
F 3 "" H 2800 2850 50  0000 C CNN
	1    2800 2850
	1    0    0    -1  
$EndComp
$Comp
L LED LED2
U 1 1 58ABA9E9
P 8850 4050
F 0 "LED2" H 8850 4150 50  0000 C CNN
F 1 "10mA 2V" H 8850 3950 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm_FlatTop" H 8850 4050 50  0001 C CNN
F 3 "" H 8850 4050 50  0000 C CNN
	1    8850 4050
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 58ABA9EF
P 9400 4050
F 0 "R5" V 9480 4050 50  0000 C CNN
F 1 "330" V 9400 4050 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 9330 4050 50  0001 C CNN
F 3 "" H 9400 4050 50  0000 C CNN
	1    9400 4050
	0    1    1    0   
$EndComp
Text Label 8350 1800 2    60   ~ 0
XTAL1
Text Label 8350 2200 2    60   ~ 0
XTAL2
Text Label 9850 3600 0    60   ~ 0
LED_ACC
Text Label 9850 4050 0    60   ~ 0
LED_PWR
Text Label 3200 1950 0    60   ~ 0
BUS1_DQ
Text Label 3200 1650 0    60   ~ 0
BUS1_PWR
Text Label 3200 3000 0    60   ~ 0
BUS2_DQ
Text Label 3200 2700 0    60   ~ 0
BUS2_PWR
$Comp
L CONN_01X04 Conn1
U 1 1 58AC5222
P 6350 2400
F 0 "Conn1" H 6350 2650 50  0000 C CNN
F 1 "UART" V 6450 2400 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04_Pitch2.54mm" H 6350 2400 50  0001 C CNN
F 3 "" H 6350 2400 50  0000 C CNN
	1    6350 2400
	1    0    0    -1  
$EndComp
Text Label 4950 2750 2    60   ~ 0
VCC_ADC
Text Label 4950 2450 2    60   ~ 0
RX
Text Label 4950 2350 2    60   ~ 0
TX
Text Label 6800 1650 0    60   ~ 0
RX_RPI
$Comp
L R R7
U 1 1 58ACE900
P 5900 1650
F 0 "R7" V 5980 1650 50  0000 C CNN
F 1 "20k" V 5900 1650 50  0000 C CNN
F 2 "footprint:Custom_R3" V 5830 1650 50  0001 C CNN
F 3 "" H 5900 1650 50  0000 C CNN
	1    5900 1650
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 58ACE9F7
P 6400 1650
F 0 "R6" V 6480 1650 50  0000 C CNN
F 1 "10k" V 6400 1650 50  0000 C CNN
F 2 "footprint:Custom_R3_normal" V 6330 1650 50  0001 C CNN
F 3 "" H 6400 1650 50  0000 C CNN
	1    6400 1650
	0    -1   -1   0   
$EndComp
Text Label 5200 3950 2    60   ~ 0
RST
Text Label 5200 4050 2    60   ~ 0
RX
Text Label 5200 4150 2    60   ~ 0
TX
Text Label 5200 4750 2    60   ~ 0
XTAL1
Text Label 5200 4850 2    60   ~ 0
XTAL2
Text Label 6200 5150 0    60   ~ 0
SPI_SS
Text Label 4950 4550 2    60   ~ 0
VCC_AVR
NoConn ~ 6000 4650
NoConn ~ 5400 4250
NoConn ~ 5400 4350
NoConn ~ 5400 4450
NoConn ~ 5400 4950
NoConn ~ 5400 5050
NoConn ~ 5400 5150
Text Label 8650 5750 0    60   ~ 0
SPI_SS
Text Label 8650 5850 0    60   ~ 0
SPI_MOSI
Text Label 8650 5950 0    60   ~ 0
SPI_SCK
Text Label 8650 5350 0    60   ~ 0
VCC_SPI
Text Label 6200 3950 0    60   ~ 0
LED_PWR
Text Label 6200 4050 0    60   ~ 0
LED_ACC
Text Label 6200 4250 0    60   ~ 0
BUS2_PWR
Text Label 6200 4350 0    60   ~ 0
BUS1_DQ
Text Label 6200 4150 0    60   ~ 0
BUS2_DQ
Text Label 6200 4450 0    60   ~ 0
BUS1_PWR
Text Label 6200 4850 0    60   ~ 0
SPI_SCK
Text Label 4950 2550 2    60   ~ 0
RST
Text Label 2900 4450 0    60   ~ 0
RX_RPI
Text Label 2900 4150 0    60   ~ 0
VCC_AVR
Text Label 2900 4050 0    60   ~ 0
VCC_SPI
NoConn ~ 2050 4650
NoConn ~ 2050 4750
NoConn ~ 2050 4850
NoConn ~ 2050 4950
NoConn ~ 2050 5050
NoConn ~ 2050 5150
NoConn ~ 2050 5350
NoConn ~ 2050 5450
NoConn ~ 2050 5550
NoConn ~ 2050 5750
NoConn ~ 2050 5850
NoConn ~ 2550 5950
NoConn ~ 2550 5850
NoConn ~ 2550 5750
NoConn ~ 2550 5550
NoConn ~ 2550 5450
NoConn ~ 2550 5350
NoConn ~ 2550 5250
NoConn ~ 2550 5150
NoConn ~ 2550 5050
NoConn ~ 2550 4850
NoConn ~ 2550 4750
NoConn ~ 2550 4650
NoConn ~ 2550 4550
$Comp
L DIL28 Conn3
U 1 1 58B1B9EF
P 5700 4300
F 0 "Conn3" H 5700 4750 40  0000 C CNN
F 1 "Atmega328" V 5700 4000 40  0000 C CNN
F 2 "footprint:Custom_DIP-28_W7.62mm_Socket" H 5700 4750 60  0001 C CNN
F 3 "" H 5700 4750 60  0001 C CNN
	1    5700 4300
	1    0    0    -1  
$EndComp
$Comp
L CONN220 Conn2
U 1 1 58B1D1E8
P 2300 5000
F 0 "Conn2" H 2300 6050 50  0000 C CNN
F 1 "RPi" V 2300 5000 50  0000 C CNN
F 2 "footprint:Custom_Header_2x20_Pitch2.54mm" H 2300 4050 50  0001 C CNN
F 3 "" H 2300 4050 50  0000 C CNN
	1    2300 5000
	1    0    0    -1  
$EndComp
NoConn ~ 2550 4950
NoConn ~ 2550 4250
$Comp
L PWR_FLAG #FLG01
U 1 1 58B35079
P 5800 6950
F 0 "#FLG01" H 5800 7045 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 7130 50  0000 C CNN
F 2 "" H 5800 6950 50  0000 C CNN
F 3 "" H 5800 6950 50  0000 C CNN
	1    5800 6950
	0    1    1    0   
$EndComp
Text Label 5200 6950 2    60   ~ 0
VCC_AVR
Text Label 5200 6500 2    60   ~ 0
VCC_SPI
$Comp
L PWR_FLAG #FLG02
U 1 1 58B37185
P 5800 6250
F 0 "#FLG02" H 5800 6345 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 6430 50  0000 C CNN
F 2 "" H 5800 6250 50  0000 C CNN
F 3 "" H 5800 6250 50  0000 C CNN
	1    5800 6250
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 58B371F9
P 5800 6500
F 0 "#FLG03" H 5800 6595 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 6680 50  0000 C CNN
F 2 "" H 5800 6500 50  0000 C CNN
F 3 "" H 5800 6500 50  0000 C CNN
	1    5800 6500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 58B37806
P 5200 6250
F 0 "#PWR04" H 5200 6000 50  0001 C CNN
F 1 "GND" H 5200 6100 50  0000 C CNN
F 2 "" H 5200 6250 50  0000 C CNN
F 3 "" H 5200 6250 50  0000 C CNN
	1    5200 6250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 58B37918
P 1600 5950
F 0 "#PWR05" H 1600 5700 50  0001 C CNN
F 1 "GND" H 1600 5800 50  0000 C CNN
F 2 "" H 1600 5950 50  0000 C CNN
F 3 "" H 1600 5950 50  0000 C CNN
	1    1600 5950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 58B379CE
P 2400 2400
F 0 "#PWR06" H 2400 2150 50  0001 C CNN
F 1 "GND" H 2400 2250 50  0000 C CNN
F 2 "" H 2400 2400 50  0000 C CNN
F 3 "" H 2400 2400 50  0000 C CNN
	1    2400 2400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR07
U 1 1 58B37AD6
P 2400 1350
F 0 "#PWR07" H 2400 1100 50  0001 C CNN
F 1 "GND" H 2400 1200 50  0000 C CNN
F 2 "" H 2400 1350 50  0000 C CNN
F 3 "" H 2400 1350 50  0000 C CNN
	1    2400 1350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR08
U 1 1 58B37B8C
P 5400 1650
F 0 "#PWR08" H 5400 1400 50  0001 C CNN
F 1 "GND" H 5400 1500 50  0000 C CNN
F 2 "" H 5400 1650 50  0000 C CNN
F 3 "" H 5400 1650 50  0000 C CNN
	1    5400 1650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR09
U 1 1 58B37F60
P 10000 2000
F 0 "#PWR09" H 10000 1750 50  0001 C CNN
F 1 "GND" H 10000 1850 50  0000 C CNN
F 2 "" H 10000 2000 50  0000 C CNN
F 3 "" H 10000 2000 50  0000 C CNN
	1    10000 2000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR010
U 1 1 58B3816A
P 8300 3600
F 0 "#PWR010" H 8300 3350 50  0001 C CNN
F 1 "GND" H 8300 3450 50  0000 C CNN
F 2 "" H 8300 3600 50  0000 C CNN
F 3 "" H 8300 3600 50  0000 C CNN
	1    8300 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 58B381FA
P 8300 4050
F 0 "#PWR011" H 8300 3800 50  0001 C CNN
F 1 "GND" H 8300 3900 50  0000 C CNN
F 2 "" H 8300 4050 50  0000 C CNN
F 3 "" H 8300 4050 50  0000 C CNN
	1    8300 4050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 58B38264
P 4800 4650
F 0 "#PWR012" H 4800 4400 50  0001 C CNN
F 1 "GND" H 4800 4500 50  0000 C CNN
F 2 "" H 4800 4650 50  0000 C CNN
F 3 "" H 4800 4650 50  0000 C CNN
	1    4800 4650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 58B38684
P 8500 5150
F 0 "#PWR013" H 8500 4900 50  0001 C CNN
F 1 "GND" H 8500 5000 50  0000 C CNN
F 2 "" H 8500 5150 50  0000 C CNN
F 3 "" H 8500 5150 50  0000 C CNN
	1    8500 5150
	0    1    1    0   
$EndComp
NoConn ~ 2050 4350
NoConn ~ 2050 4450
Text Label 6200 4750 0    60   ~ 0
VCC_ADC
$Comp
L GND #PWR014
U 1 1 58C975B0
P 6500 4550
F 0 "#PWR014" H 6500 4300 50  0001 C CNN
F 1 "GND" H 6500 4400 50  0000 C CNN
F 2 "" H 6500 4550 50  0000 C CNN
F 3 "" H 6500 4550 50  0000 C CNN
	1    6500 4550
	0    -1   -1   0   
$EndComp
Text Label 5200 7150 2    60   ~ 0
VCC_ADC
Text Label 5500 7150 0    60   ~ 0
VCC_AVR
Text Label 5200 5250 2    60   ~ 0
TFT_DC
Text Label 6200 5250 0    60   ~ 0
TFT_RST
Text Label 8650 5650 0    60   ~ 0
TFT_RST
Text Label 8650 5550 0    60   ~ 0
TFT_DC
$Comp
L GND #PWR015
U 1 1 58C9B41F
P 5400 2250
F 0 "#PWR015" H 5400 2000 50  0001 C CNN
F 1 "GND" H 5400 2100 50  0000 C CNN
F 2 "" H 5400 2250 50  0000 C CNN
F 3 "" H 5400 2250 50  0000 C CNN
	1    5400 2250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR016
U 1 1 58C9B593
P 1600 5250
F 0 "#PWR016" H 1600 5000 50  0001 C CNN
F 1 "GND" H 1600 5100 50  0000 C CNN
F 2 "" H 1600 5250 50  0000 C CNN
F 3 "" H 1600 5250 50  0000 C CNN
	1    1600 5250
	0    1    1    0   
$EndComp
$Comp
L CONN_01X09 Conn4
U 1 1 58CA67C7
P 9450 5550
F 0 "Conn4" H 9450 6050 50  0000 C CNN
F 1 "SPI" V 9550 5550 50  0000 C CNN
F 2 "footprint:Custom_Pin_Header_Straight_1x09_Pitch2.54mm" H 9450 5550 50  0001 C CNN
F 3 "" H 9450 5550 50  0001 C CNN
	1    9450 5550
	1    0    0    -1  
$EndComp
Text Label 8650 5450 0    60   ~ 0
VCC_LED
Text Label 5200 6750 2    60   ~ 0
VCC_LED
Text Label 6200 5050 0    60   ~ 0
SPI_MOSI
$Comp
L GND #PWR017
U 1 1 58DD8A95
P 8500 5250
F 0 "#PWR017" H 8500 5000 50  0001 C CNN
F 1 "GND" H 8500 5100 50  0000 C CNN
F 2 "" H 8500 5250 50  0000 C CNN
F 3 "" H 8500 5250 50  0000 C CNN
	1    8500 5250
	0    1    1    0   
$EndComp
$Comp
L JACK_4P OneWireBus1
U 1 1 58F3E798
P 1800 1700
F 0 "OneWireBus1" H 1750 1350 60  0000 C CNN
F 1 "JACK_4P" H 1750 1950 60  0000 C CNN
F 2 "footprint:Custom_Barrel_Jack" H 1750 1350 60  0001 C CNN
F 3 "" H 1750 1350 60  0001 C CNN
	1    1800 1700
	1    0    0    -1  
$EndComp
$Comp
L JACK_4P OneWireBus2
U 1 1 58F3E92F
P 1800 2750
F 0 "OneWireBus2" H 1750 2400 60  0000 C CNN
F 1 "JACK_4P" H 1750 3000 60  0000 C CNN
F 2 "footprint:Custom_Barrel_Jack" H 1750 2400 60  0001 C CNN
F 3 "" H 1750 2400 60  0001 C CNN
	1    1800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2350 6150 2350
Wire Wire Line
	6150 2450 4950 2450
Wire Wire Line
	6150 2250 5400 2250
Wire Wire Line
	4950 2550 5800 2550
Wire Wire Line
	5600 2550 5600 2750
Connection ~ 5600 2550
Wire Wire Line
	4950 2750 5300 2750
Wire Wire Line
	6100 2550 6150 2550
Wire Wire Line
	6000 4850 6200 4850
Wire Wire Line
	9250 5950 8650 5950
Wire Wire Line
	9250 5850 8650 5850
Wire Wire Line
	9250 5750 8650 5750
Wire Wire Line
	9250 5650 8650 5650
Wire Wire Line
	6000 4450 6200 4450
Wire Wire Line
	6000 4150 6200 4150
Wire Wire Line
	6000 4350 6200 4350
Wire Wire Line
	6000 4250 6200 4250
Wire Wire Line
	6000 4050 6200 4050
Wire Wire Line
	6000 3950 6200 3950
Connection ~ 2800 3000
Wire Wire Line
	2200 3000 3200 3000
Connection ~ 2800 2700
Wire Wire Line
	2200 2700 3200 2700
Connection ~ 2800 1950
Wire Wire Line
	2200 1950 3200 1950
Connection ~ 2800 1650
Wire Wire Line
	2200 1650 3200 1650
Wire Wire Line
	8350 1800 9250 1800
Wire Wire Line
	9600 2200 9550 2200
Wire Wire Line
	9550 1800 9600 1800
Wire Wire Line
	6000 5150 6200 5150
Wire Wire Line
	5200 4850 5400 4850
Wire Wire Line
	5400 4750 5200 4750
Wire Wire Line
	4800 4650 5400 4650
Wire Wire Line
	4950 4550 5400 4550
Wire Wire Line
	5200 4150 5400 4150
Wire Wire Line
	5200 4050 5400 4050
Wire Wire Line
	5200 3950 5400 3950
Wire Wire Line
	6550 1650 6800 1650
Connection ~ 6150 1650
Wire Wire Line
	6050 1650 6250 1650
Wire Wire Line
	8850 1800 8850 1850
Connection ~ 8850 2200
Connection ~ 8850 1800
Wire Wire Line
	9600 1800 9600 2200
Wire Wire Line
	8700 4050 8300 4050
Wire Wire Line
	9250 4050 9000 4050
Wire Wire Line
	9850 4050 9550 4050
Wire Wire Line
	8700 3600 8300 3600
Wire Wire Line
	9250 3600 9000 3600
Wire Wire Line
	9850 3600 9550 3600
Wire Wire Line
	1600 5950 2050 5950
Wire Wire Line
	5750 1650 5400 1650
Wire Wire Line
	8350 2200 9250 2200
Wire Wire Line
	8850 2200 8850 2150
Connection ~ 9600 2000
Wire Wire Line
	10000 2000 9600 2000
Wire Wire Line
	2550 4450 2900 4450
Wire Wire Line
	5800 6250 5200 6250
Wire Wire Line
	5200 6500 5800 6500
Wire Wire Line
	5800 6950 5200 6950
Wire Wire Line
	2050 5250 1600 5250
Wire Wire Line
	6000 4750 6200 4750
Wire Wire Line
	6000 4550 6500 4550
Wire Wire Line
	2550 4050 2900 4050
Wire Wire Line
	2550 4150 2900 4150
Wire Wire Line
	5200 7150 5500 7150
Wire Wire Line
	6000 5250 6200 5250
Wire Wire Line
	5400 5250 5200 5250
Wire Wire Line
	9250 5450 8650 5450
Wire Wire Line
	9250 5550 8650 5550
Wire Wire Line
	8650 5350 9250 5350
Wire Wire Line
	8500 5250 9250 5250
Wire Wire Line
	8500 5150 9250 5150
Wire Wire Line
	5200 6750 5500 6750
Wire Wire Line
	5500 6750 5500 6500
Connection ~ 5500 6500
Wire Wire Line
	2200 1550 2400 1550
Wire Wire Line
	2400 1550 2400 1350
Wire Wire Line
	2200 2600 2400 2600
Wire Wire Line
	2400 2600 2400 2400
NoConn ~ 2200 2900
NoConn ~ 2200 2800
NoConn ~ 2200 1850
NoConn ~ 2200 1750
NoConn ~ 2050 4150
NoConn ~ 2050 5650
NoConn ~ 2550 5650
Wire Wire Line
	6000 5050 6200 5050
NoConn ~ 6000 4950
$Comp
L Jumper_NC_Small JP1
U 1 1 59887C25
P 6150 2000
F 0 "JP1" H 6150 2080 50  0000 C CNN
F 1 "Jumper" H 6160 1940 50  0000 C CNN
F 2 "footprint:Custom_Pin_Header_Straight_1x02_Pitch2.54mm" H 6150 2000 50  0001 C CNN
F 3 "" H 6150 2000 50  0001 C CNN
	1    6150 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 1900 6150 1650
Wire Wire Line
	6150 2350 6150 2100
NoConn ~ 2550 4350
$EndSCHEMATC
