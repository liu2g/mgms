EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 3
Title "Circuit-SchDoc"
Date "13 05 2021"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	5500 6900 5500 3600
$Comp
L power:GND GND
U 1 1 609DDF08
P 9000 7750
F 0 "GND" H 9000 7890 20  0000 C CNN
F 1 "GND" H 9000 7860 30  0000 C CNN
F 2 "" H 9000 7750 70  0000 C CNN
F 3 "" H 9000 7750 70  0000 C CNN
	1    9000 7750
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_2
U 1 1 609DDF07
P 8500 9050
F 0 "GND_2" H 8500 9190 20  0000 C CNN
F 1 "GND" H 8500 9160 30  0000 C CNN
F 2 "" H 8500 9050 70  0000 C CNN
F 3 "" H 8500 9050 70  0000 C CNN
	1    8500 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_3
U 1 1 609DDF06
P 6550 7750
F 0 "GND_3" H 6550 7890 20  0000 C CNN
F 1 "GND" H 6550 7860 30  0000 C CNN
F 2 "" H 6550 7750 70  0000 C CNN
F 3 "" H 6550 7750 70  0000 C CNN
	1    6550 7750
	1    0    0    -1  
$EndComp
$Comp
L power:+5 +5
U 1 1 609DDF05
P 6550 7400
F 0 "+5" H 6550 7400 20  0000 C CNN
F 1 "+5" H 6550 7330 30  0000 C CNN
F 2 "" H 6550 7400 70  0000 C CNN
F 3 "" H 6550 7400 70  0000 C CNN
	1    6550 7400
	1    0    0    -1  
$EndComp
Text Label 8770 7540 0    70   ~ 0
S1B-13-F
$Comp
L power:+5 +5_2
U 1 1 609DDF04
P 8700 7200
F 0 "+5_2" H 8700 7200 20  0000 C CNN
F 1 "+5" H 8700 7130 30  0000 C CNN
F 2 "" H 8700 7200 70  0000 C CNN
F 3 "" H 8700 7200 70  0000 C CNN
	1    8700 7200
	1    0    0    -1  
$EndComp
Text Label 7100 9250 0    70   ~ 0
ATMEGA328P
$Comp
L power:GND GND_4
U 1 1 609DDF03
P 9300 8350
F 0 "GND_4" H 9300 8490 20  0000 C CNN
F 1 "GND" H 9300 8460 30  0000 C CNN
F 2 "" H 9300 8350 70  0000 C CNN
F 3 "" H 9300 8350 70  0000 C CNN
	1    9300 8350
	1    0    0    -1  
$EndComp
Text Label 4600 8650 0    70   ~ 0
Digi XBEE 3
Text Label 5500 7650 0    70   ~ 0
SN74LVC1G125
$Comp
L power:GND GND_5
U 1 1 609DDF02
P 6150 7750
F 0 "GND_5" H 6150 7890 20  0000 C CNN
F 1 "GND" H 6150 7860 30  0000 C CNN
F 2 "" H 6150 7750 70  0000 C CNN
F 3 "" H 6150 7750 70  0000 C CNN
	1    6150 7750
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_6
U 1 1 609DDF01
P 5500 8550
F 0 "GND_6" H 5500 8690 20  0000 C CNN
F 1 "GND" H 5500 8660 30  0000 C CNN
F 2 "" H 5500 8550 70  0000 C CNN
F 3 "" H 5500 8550 70  0000 C CNN
	1    5500 8550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 3V3
U 1 1 609DDF00
P 3500 8050
F 0 "3V3" H 3500 8050 20  0000 C CNN
F 1 "3V3" H 3500 7980 30  0000 C CNN
F 2 "" H 3500 8050 70  0000 C CNN
F 3 "" H 3500 8050 70  0000 C CNN
	1    3500 8050
	1    0    0    -1  
$EndComp
Text GLabel 9350 7550 2    60   BiDi ~ 0
Reset
Text GLabel 4050 8450 2    60   BiDi ~ 0
Reset
Text Label 7650 6600 0    70   ~ 0
LP298533
$Comp
L power:V_in V_in
U 1 1 609DDEFF
P 7450 5900
F 0 "V_in" H 7450 5900 20  0000 C CNN
F 1 "V_in" H 7450 5830 30  0000 C CNN
F 2 "" H 7450 5900 70  0000 C CNN
F 3 "" H 7450 5900 70  0000 C CNN
	1    7450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 3V3_2
U 1 1 609DDEFE
P 8650 5900
F 0 "3V3_2" H 8650 5900 20  0000 C CNN
F 1 "3V3" H 8650 5830 30  0000 C CNN
F 2 "" H 8650 5900 70  0000 C CNN
F 3 "" H 8650 5900 70  0000 C CNN
	1    8650 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_7
U 1 1 609DDEFD
P 8650 6500
F 0 "GND_7" H 8650 6640 20  0000 C CNN
F 1 "GND" H 8650 6610 30  0000 C CNN
F 2 "" H 8650 6500 70  0000 C CNN
F 3 "" H 8650 6500 70  0000 C CNN
	1    8650 6500
	1    0    0    -1  
$EndComp
NoConn ~ 7450 6400
$Comp
L power:GND GND_8
U 1 1 609DDEFC
P 3500 8550
F 0 "GND_8" H 3500 8690 20  0000 C CNN
F 1 "GND" H 3500 8660 30  0000 C CNN
F 2 "" H 3500 8550 70  0000 C CNN
F 3 "" H 3500 8550 70  0000 C CNN
	1    3500 8550
	1    0    0    -1  
$EndComp
Text GLabel 6100 8350 2    60   Input ~ 0
THERM200_out
Text GLabel 6250 8450 2    60   Input ~ 0
VH400_out
Text GLabel 6400 8950 2    60   BiDi ~ 0
SDA
Text GLabel 6400 9050 2    60   BiDi ~ 0
SCL
Text Label 6300 9950 0    70   ~ 0
ALS-PT19
$Comp
L power:+5 +5_3
U 1 1 609DDEFB
P 6900 9750
F 0 "+5_3" H 6900 9750 20  0000 C CNN
F 1 "+5" H 6900 9680 30  0000 C CNN
F 2 "" H 6900 9750 70  0000 C CNN
F 3 "" H 6900 9750 70  0000 C CNN
	1    6900 9750
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_9
U 1 1 609DDEFA
P 5500 9750
F 0 "GND_9" H 5500 9890 20  0000 C CNN
F 1 "GND" H 5500 9860 30  0000 C CNN
F 2 "" H 5500 9750 70  0000 C CNN
F 3 "" H 5500 9750 70  0000 C CNN
	1    5500 9750
	1    0    0    -1  
$EndComp
Text Label 1300 9900 0    70   ~ 0
105313-2304
Text Label 1300 9000 0    70   ~ 0
105313-2304
Text Label 1300 8050 0    70   ~ 0
105313-2304
$Comp
L power:GND GND_10
U 1 1 609DDEF9
P 1900 7850
F 0 "GND_10" H 1900 7990 20  0000 C CNN
F 1 "GND" H 1900 7960 30  0000 C CNN
F 2 "" H 1900 7850 70  0000 C CNN
F 3 "" H 1900 7850 70  0000 C CNN
	1    1900 7850
	1    0    0    -1  
$EndComp
$Comp
L power:+5 +5_4
U 1 1 609DDEF8
P 2250 7750
F 0 "+5_4" H 2250 7750 20  0000 C CNN
F 1 "+5" H 2250 7680 30  0000 C CNN
F 2 "" H 2250 7750 70  0000 C CNN
F 3 "" H 2250 7750 70  0000 C CNN
	1    2250 7750
	1    0    0    -1  
$EndComp
Text GLabel 1700 7550 2    60   BiDi ~ 0
SCL
Text GLabel 1700 7650 2    60   BiDi ~ 0
SDA
Text Notes 1250 8050 1    60   ~ 0
SHT-35 Breakout
$Comp
L power:GND GND_11
U 1 1 609DDEF7
P 1900 8800
F 0 "GND_11" H 1900 8940 20  0000 C CNN
F 1 "GND" H 1900 8910 30  0000 C CNN
F 2 "" H 1900 8800 70  0000 C CNN
F 3 "" H 1900 8800 70  0000 C CNN
	1    1900 8800
	1    0    0    -1  
$EndComp
$Comp
L power:+5 +5_5
U 1 1 609DDEF6
P 2600 8700
F 0 "+5_5" H 2600 8700 20  0000 C CNN
F 1 "+5" H 2600 8630 30  0000 C CNN
F 2 "" H 2600 8700 70  0000 C CNN
F 3 "" H 2600 8700 70  0000 C CNN
	1    2600 8700
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_12
U 1 1 609DDEF5
P 1900 9700
F 0 "GND_12" H 1900 9840 20  0000 C CNN
F 1 "GND" H 1900 9810 30  0000 C CNN
F 2 "" H 1900 9700 70  0000 C CNN
F 3 "" H 1900 9700 70  0000 C CNN
	1    1900 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5 +5_6
U 1 1 609DDEF4
P 2400 9600
F 0 "+5_6" H 2400 9600 20  0000 C CNN
F 1 "+5" H 2400 9530 30  0000 C CNN
F 2 "" H 2400 9600 70  0000 C CNN
F 3 "" H 2400 9600 70  0000 C CNN
	1    2400 9600
	1    0    0    -1  
$EndComp
Text GLabel 1700 8600 2    60   Output ~ 0
THERM200_out
Text GLabel 1700 9500 2    60   Output ~ 0
VH400_out
NoConn ~ 1700 8500
NoConn ~ 1700 9400
Text Notes 1250 9700 1    60   ~ 0
VH400
Text Notes 1250 8900 1    60   ~ 0
THERM200
Text Notes 850  5300 1    60   ~ 0
Solar Panel
$Comp
L power:GND GND_13
U 1 1 609DDEF3
P 1500 5200
F 0 "GND_13" H 1500 5340 20  0000 C CNN
F 1 "GND" H 1500 5310 30  0000 C CNN
F 2 "" H 1500 5200 70  0000 C CNN
F 3 "" H 1500 5200 70  0000 C CNN
	1    1500 5200
	1    0    0    -1  
$EndComp
NoConn ~ 1850 5500
$Comp
L power:GND GND_14
U 1 1 609DDEF2
P 3050 5500
F 0 "GND_14" H 3050 5640 20  0000 C CNN
F 1 "GND" H 3050 5610 30  0000 C CNN
F 2 "" H 3050 5500 70  0000 C CNN
F 3 "" H 3050 5500 70  0000 C CNN
	1    3050 5500
	1    0    0    -1  
$EndComp
Text Notes 850  4550 1    60   ~ 0
3.7V LiPO
$Comp
L power:GND GND_15
U 1 1 609DDEF1
P 1500 4450
F 0 "GND_15" H 1500 4590 20  0000 C CNN
F 1 "GND" H 1500 4560 30  0000 C CNN
F 2 "" H 1500 4450 70  0000 C CNN
F 3 "" H 1500 4450 70  0000 C CNN
	1    1500 4450
	1    0    0    -1  
$EndComp
Text Label 4150 5900 0    70   ~ 0
AP9101CAK
Text Label 4700 6600 0    70   ~ 0
TSM6968
$Comp
L power:GND GND_16
U 1 1 609DDEF0
P 3550 5500
F 0 "GND_16" H 3550 5640 20  0000 C CNN
F 1 "GND" H 3550 5610 30  0000 C CNN
F 2 "" H 3550 5500 70  0000 C CNN
F 3 "" H 3550 5500 70  0000 C CNN
	1    3550 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_17
U 1 1 609DDEEF
P 5150 6500
F 0 "GND_17" H 5150 6640 20  0000 C CNN
F 1 "GND" H 5150 6610 30  0000 C CNN
F 2 "" H 5150 6500 70  0000 C CNN
F 3 "" H 5150 6500 70  0000 C CNN
	1    5150 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_18
U 1 1 609DDEEE
P 5150 5350
F 0 "GND_18" H 5150 5490 20  0000 C CNN
F 1 "GND" H 5150 5460 30  0000 C CNN
F 2 "" H 5150 5350 70  0000 C CNN
F 3 "" H 5150 5350 70  0000 C CNN
	1    5150 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_19
U 1 1 609DDEED
P 3950 4550
F 0 "GND_19" H 3950 4690 20  0000 C CNN
F 1 "GND" H 3950 4660 30  0000 C CNN
F 2 "" H 3950 4550 70  0000 C CNN
F 3 "" H 3950 4550 70  0000 C CNN
	1    3950 4550
	1    0    0    -1  
$EndComp
$Comp
L power:V_in V_in_2
U 1 1 609DDEEC
P 3550 4250
F 0 "V_in_2" H 3550 4250 20  0000 C CNN
F 1 "V_in" H 3550 4180 30  0000 C CNN
F 2 "" H 3550 4250 70  0000 C CNN
F 3 "" H 3550 4250 70  0000 C CNN
	1    3550 4250
	1    0    0    -1  
$EndComp
Text Label 7600 5500 0    70   ~ 0
TPS61200DR
$Comp
L power:GND GND_20
U 1 1 609DDEEB
P 6800 4550
F 0 "GND_20" H 6800 4690 20  0000 C CNN
F 1 "GND" H 6800 4660 30  0000 C CNN
F 2 "" H 6800 4550 70  0000 C CNN
F 3 "" H 6800 4550 70  0000 C CNN
	1    6800 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_21
U 1 1 609DDEEA
P 8900 5300
F 0 "GND_21" H 8900 5440 20  0000 C CNN
F 1 "GND" H 8900 5410 30  0000 C CNN
F 2 "" H 8900 5300 70  0000 C CNN
F 3 "" H 8900 5300 70  0000 C CNN
	1    8900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5 +5_7
U 1 1 609DDEE9
P 9700 4350
F 0 "+5_7" H 9700 4350 20  0000 C CNN
F 1 "+5" H 9700 4280 30  0000 C CNN
F 2 "" H 9700 4350 70  0000 C CNN
F 3 "" H 9700 4350 70  0000 C CNN
	1    9700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND GND_22
U 1 1 609DDEE8
P 9700 4700
F 0 "GND_22" H 9700 4840 20  0000 C CNN
F 1 "GND" H 9700 4810 30  0000 C CNN
F 2 "" H 9700 4700 70  0000 C CNN
F 3 "" H 9700 4700 70  0000 C CNN
	1    9700 4700
	1    0    0    -1  
$EndComp
$Comp
L power:V_in V_in_3
U 1 1 609DDEE7
P 6650 4250
F 0 "V_in_3" H 6650 4250 20  0000 C CNN
F 1 "V_in" H 6650 4180 30  0000 C CNN
F 2 "" H 6650 4250 70  0000 C CNN
F 3 "" H 6650 4250 70  0000 C CNN
	1    6650 4250
	1    0    0    -1  
$EndComp
Text Label 2050 5700 0    70   ~ 0
STC4054GR
Wire Notes Line
	3100 10300 3100 6900
Wire Notes Line
	7100 9800 7100 10300
Wire Notes Line
	10600 9800 7100 9800
Text Notes 5700 6800 0    108  ~ 0
Power Regulation
Text Notes 600  6800 0    108  ~ 0
Solar Panel and Battery Charger
Text Notes 3300 7200 0    108  ~ 0
MCU and Wireless Communication
Text Notes 600  7200 0    108  ~ 0
Sensor Input
$Sheet
S 2000 3000 600  500 
U 609DE42A
F0 "NC" 60
F1 "No_Connects-SchDoc.sch" 60
$EndSheet
$Sheet
S 2900 3000 600  500 
U 609DE42C
F0 "PWR" 60
F1 "PWR_GND-SchDoc.sch" 60
$EndSheet
Text Label 900  4650 0    70   ~ 0
0532610271
Wire Wire Line
	9000 7750 8600 7750
Wire Wire Line
	6800 7450 6900 7450
Wire Wire Line
	6800 7550 6800 7450
Wire Wire Line
	6900 7550 6800 7550
Wire Wire Line
	8400 7200 8400 7250
Wire Wire Line
	8700 7200 8400 7200
Wire Wire Line
	8400 7750 8300 7750
Wire Wire Line
	8300 7550 8400 7550
Wire Wire Line
	8300 9050 8500 9050
Wire Wire Line
	8880 8150 8880 8160
Wire Wire Line
	8600 8150 8880 8150
Wire Wire Line
	8400 8150 8600 8150
Wire Wire Line
	8400 8250 8400 8150
Wire Wire Line
	8300 8250 8400 8250
Wire Wire Line
	8980 8450 8980 8460
Wire Wire Line
	8600 8450 8980 8450
Wire Wire Line
	8400 8450 8600 8450
Wire Wire Line
	8400 8350 8400 8450
Wire Wire Line
	8300 8350 8400 8350
Wire Wire Line
	9300 8310 9100 8310
Wire Wire Line
	9300 8350 9300 8310
Wire Wire Line
	6900 8050 6150 8050
Wire Wire Line
	6300 8250 5500 8250
Wire Wire Line
	6300 8150 6300 8250
Wire Wire Line
	6900 8150 6300 8150
Wire Wire Line
	8700 7550 8400 7550
Wire Wire Line
	9350 7550 8700 7550
Wire Wire Line
	8650 6000 8650 6100
Wire Wire Line
	8650 5900 8650 6000
Wire Wire Line
	8650 6400 8650 6300
Wire Wire Line
	8650 6500 8650 6400
Wire Wire Line
	3500 8050 3500 8150
Wire Wire Line
	3800 8050 3800 8150
Wire Wire Line
	3500 8450 3500 8350
Wire Wire Line
	3800 8450 3500 8450
Wire Wire Line
	3800 8350 3800 8450
Wire Wire Line
	3500 8550 3500 8450
Wire Wire Line
	5500 8450 5500 8550
Wire Wire Line
	6150 9750 5950 9750
Wire Wire Line
	6200 9750 6150 9750
Wire Wire Line
	6900 9750 6760 9750
Wire Wire Line
	5500 9750 5650 9750
Wire Wire Line
	6150 8550 6150 9750
Wire Wire Line
	6900 8550 6150 8550
Wire Wire Line
	1900 7850 1700 7850
Wire Wire Line
	2250 7750 1700 7750
Wire Wire Line
	1900 8800 1700 8800
Wire Wire Line
	2600 8700 1700 8700
Wire Wire Line
	1900 9700 1700 9700
Wire Wire Line
	2400 9600 1700 9600
Wire Wire Line
	1500 5200 1300 5200
Wire Wire Line
	2950 5200 3050 5200
Wire Wire Line
	2950 5500 3050 5500
Wire Wire Line
	1300 4450 1500 4450
Wire Wire Line
	3800 8050 3500 8050
Wire Wire Line
	4400 8050 3800 8050
Wire Wire Line
	7450 6000 7450 6200
Wire Wire Line
	7450 5900 7450 6000
Wire Wire Line
	3550 5300 3950 5300
Wire Wire Line
	3950 6000 3950 5700
Wire Wire Line
	4350 6000 3950 6000
Wire Wire Line
	4150 6200 4150 6300
Wire Wire Line
	3850 6200 4150 6200
Wire Wire Line
	3850 5600 3850 6200
Wire Wire Line
	3950 5600 3850 5600
Wire Wire Line
	5150 6300 5150 6200
Wire Wire Line
	5150 6500 5150 6300
Wire Wire Line
	3950 4250 3950 4300
Wire Wire Line
	3550 4250 3950 4250
Wire Wire Line
	3950 4550 3950 4500
Wire Wire Line
	7350 4350 7400 4350
Wire Wire Line
	7350 4250 7350 4350
Wire Wire Line
	7100 4550 7400 4550
Wire Wire Line
	7350 3900 7350 4250
Wire Wire Line
	7750 3900 7350 3900
Wire Wire Line
	8650 3900 8250 3900
Wire Wire Line
	8650 4250 8650 3900
Wire Wire Line
	8600 4250 8650 4250
Wire Wire Line
	6800 4250 6800 4300
Wire Wire Line
	6500 4550 6500 4500
Wire Wire Line
	6800 4550 6500 4550
Wire Wire Line
	6800 4500 6800 4550
Wire Wire Line
	8700 4550 8600 4550
Wire Wire Line
	8700 4350 8700 4550
Wire Wire Line
	8900 4750 8600 4750
Wire Wire Line
	8900 4800 8900 4750
Wire Wire Line
	9050 4350 9050 4400
Wire Wire Line
	9700 4300 9700 4350
Wire Wire Line
	9700 4700 9700 4650
Wire Wire Line
	8700 4350 8600 4350
Wire Wire Line
	9050 4350 8700 4350
Wire Wire Line
	9400 4350 9050 4350
Wire Wire Line
	9700 4350 9400 4350
Wire Wire Line
	9700 4400 9700 4350
Wire Wire Line
	9050 4650 9050 4600
Wire Wire Line
	9400 4650 9050 4650
Wire Wire Line
	9700 4650 9400 4650
Wire Wire Line
	9700 4600 9700 4650
Wire Wire Line
	9400 4600 9400 4650
Wire Wire Line
	9400 4350 9400 4400
Wire Wire Line
	3550 4250 1300 4250
Wire Wire Line
	3550 5000 3550 4250
Wire Wire Line
	2950 5000 3550 5000
Wire Wire Line
	1850 5000 1300 5000
Wire Wire Line
	6550 7500 6550 7450
Wire Wire Line
	6550 7450 6800 7450
Wire Wire Line
	6550 7400 6550 7450
Wire Wire Line
	6550 7700 6550 7750
Wire Wire Line
	8700 7250 8700 7200
Wire Wire Line
	8650 5050 8600 5050
Wire Wire Line
	8650 5150 8650 5050
Wire Wire Line
	8650 5250 8650 5150
Wire Wire Line
	8600 5250 8650 5250
Wire Wire Line
	8600 5150 8650 5150
Wire Wire Line
	8900 5250 8900 5300
Wire Wire Line
	8900 5250 8650 5250
Wire Wire Line
	8900 5000 8900 5250
Wire Wire Line
	4950 6000 4950 5700
Wire Wire Line
	5150 5300 4950 5300
Wire Wire Line
	5150 5350 5150 5300
Wire Wire Line
	6500 4250 6500 4300
Wire Wire Line
	7100 4250 6800 4250
Wire Wire Line
	7350 4250 7100 4250
Wire Wire Line
	7400 4250 7350 4250
Text Label 900  5400 0    70   ~ 0
0532610271
Wire Wire Line
	11000 2500 11000 8900
Connection ~ 3050 5500
Connection ~ 3500 8450
Connection ~ 3500 8050
Connection ~ 3550 5300
Connection ~ 3550 5000
Connection ~ 3550 4250
Connection ~ 3800 8050
Connection ~ 4150 6200
Connection ~ 5150 6300
Connection ~ 6150 9750
Connection ~ 6550 7450
Connection ~ 6800 7450
Connection ~ 6800 4550
Connection ~ 6800 4250
Connection ~ 7100 4250
Connection ~ 7350 4250
Connection ~ 7450 6000
Connection ~ 8400 7550
Connection ~ 8600 8450
Connection ~ 8600 8150
Connection ~ 8650 6400
Connection ~ 8650 6000
Connection ~ 8650 5250
Connection ~ 8650 5150
Connection ~ 8700 7550
Connection ~ 8700 4350
Connection ~ 8900 5250
Connection ~ 9050 4350
Connection ~ 9400 4650
Connection ~ 9400 4350
Connection ~ 9700 4650
Connection ~ 9700 4350
$Comp
L Circuit-SchDoc-rescue:RES_1.00M_0.1%_0.1W_0603- R3
U 1 1 609DDEE6
P 8600 8150
F 0 "R3" H 8640 7990 60  0000 L BNN
F 1 "1M" H 8640 7910 60  0000 L BNN
F 2 "" H 8640 7910 60  0000 C CNN
F 3 "" H 8640 7910 60  0000 C CNN
	1    8600 8150
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:LP298533DBVR_Voltage_Regulator- U4
U 1 1 609DDEE5
P 7650 6500
F 0 "U4" H 7650 7100 60  0000 L BNN
F 1 "" H 7650 6500 50  0001 C CNN
F 2 "" H 7650 6500 50  0001 C CNN
F 3 "" H 7650 6500 50  0001 C CNN
F 4 "LP298533" V 1400 2000 60  0001 C CNN "Part Number"
	1    7650 6500
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_1.0uF_50V_10%_X7R_0603(1608M)- C1
U 1 1 609DDEE4
P 8650 6100
F 0 "C1" H 8730 5960 60  0000 L BNN
F 1 "1uF" H 8730 5880 60  0000 L BNN
F 2 "" H 8730 5880 60  0000 C CNN
F 3 "" H 8730 5880 60  0000 C CNN
	1    8650 6100
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_10uF_10V_15%_X5R_0603(1608M)- C4
U 1 1 609DDEE3
P 3500 8150
F 0 "C4" H 3580 8010 60  0000 L BNN
F 1 "10uF" H 3580 7930 60  0000 L BNN
F 2 "" H 3580 7930 60  0000 C CNN
F 3 "" H 3580 7930 60  0000 C CNN
	1    3500 8150
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_0.1uF_25V_10%_X7R_0402(1005M)- C5
U 1 1 609DDEE2
P 3800 8150
F 0 "C5" H 3880 8010 60  0000 L BNN
F 1 "0.1uF" H 3880 7930 60  0000 L BNN
F 2 "" H 3880 7930 60  0000 C CNN
F 3 "" H 3880 7930 60  0000 C CNN
	1    3800 8150
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:ALS-PT19_Phototransistor- Q1
U 1 1 609DDEE1
P 6200 9950
F 0 "Q1" H 6358 10430 60  0000 L BNN
F 1 "" H 6200 9950 50  0001 C CNN
F 2 "" H 6200 9950 50  0001 C CNN
F 3 "" H 6200 9950 50  0001 C CNN
F 4 "ALS-PT19" V 1400 2000 60  0001 C CNN "Pat Number"
	1    6200 9950
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:RES_10.0K_1%_0.33W_0603- R4
U 1 1 609DDEE0
P 5650 9750
F 0 "R4" V 5690 9690 60  0000 R TNN
F 1 "10K0" V 5530 9690 60  0000 R TNN
F 2 "" H 5530 9690 60  0000 C CNN
F 3 "" H 5530 9690 60  0000 C CNN
	1    5650 9750
	0    -1   -1   0   
$EndComp
$Comp
L Circuit-SchDoc-rescue:CON_105313-2304- J5
U 1 1 609DDEDF
P 1600 9300
F 0 "J5" H 1900 9300 60  0000 R TNN
F 1 "" H 1600 9300 50  0001 C CNN
F 2 "" H 1600 9300 50  0001 C CNN
F 3 "" H 1600 9300 50  0001 C CNN
F 4 "105313-2304" V 1400 2000 60  0001 C CNN "Manf P/N"
	1    1600 9300
	-1   0    0    1   
$EndComp
$Comp
L Circuit-SchDoc-rescue:CON_105313-2304- J4
U 1 1 609DDEDE
P 1600 8400
F 0 "J4" H 1900 8400 60  0000 R TNN
F 1 "" H 1600 8400 50  0001 C CNN
F 2 "" H 1600 8400 50  0001 C CNN
F 3 "" H 1600 8400 50  0001 C CNN
F 4 "105313-2304" V 1400 2000 60  0001 C CNN "Manf P/N"
	1    1600 8400
	-1   0    0    1   
$EndComp
$Comp
L Circuit-SchDoc-rescue:CON_105313-2304- J3
U 1 1 609DDEDD
P 1600 7450
F 0 "J3" H 1900 7450 60  0000 R TNN
F 1 "" H 1600 7450 50  0001 C CNN
F 2 "" H 1600 7450 50  0001 C CNN
F 3 "" H 1600 7450 50  0001 C CNN
F 4 "105313-2304" V 1400 2000 60  0001 C CNN "Manf P/N"
	1    1600 7450
	-1   0    0    1   
$EndComp
$Comp
L Circuit-SchDoc-rescue:RES_1.2K_0.1%_0.1W_0603- R1
U 1 1 609DDEDC
P 3050 5200
F 0 "R1" H 3090 5040 60  0000 L BNN
F 1 "1K20" H 3090 4960 60  0000 L BNN
F 2 "" H 3090 4960 60  0000 C CNN
F 3 "" H 3090 4960 60  0000 C CNN
	1    3050 5200
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_100nF_100V_10%_X7R_0603(1608M)- C3
U 1 1 609DDEDB
P 8400 7750
F 0 "C3" V 8480 7710 60  0000 R TNN
F 1 "100nF" V 8240 7710 60  0000 R TNN
F 2 "" H 8240 7710 60  0000 C CNN
F 3 "" H 8240 7710 60  0000 C CNN
	1    8400 7750
	0    -1   -1   0   
$EndComp
$Comp
L Circuit-SchDoc-rescue:AP9101CAK-ABTRG1- U2
U 1 1 609DDEDA
P 4150 5800
F 0 "U2" H 4150 6400 60  0000 L BNN
F 1 "" H 4150 5800 50  0001 C CNN
F 2 "" H 4150 5800 50  0001 C CNN
F 3 "" H 4150 5800 50  0001 C CNN
F 4 "AP9101CAK" V 1400 2000 60  0001 C CNN "Part Number"
	1    4150 5800
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:TSM6968DCA- U3
U 1 1 609DDED9
P 4250 6500
F 0 "U3" H 4200 6400 60  0000 L BNN
F 1 "" H 4250 6500 50  0001 C CNN
F 2 "" H 4250 6500 50  0001 C CNN
F 3 "" H 4250 6500 50  0001 C CNN
F 4 "TSM6968" V 1400 2000 60  0001 C CNN "Parameter 1"
	1    4250 6500
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:RES_100_0.5%_1_16W_0603- R6
U 1 1 609DDED8
P 3550 5000
F 0 "R6" H 3590 4840 60  0000 L BNN
F 1 "100R" H 3590 4760 60  0000 L BNN
F 2 "" H 3590 4760 60  0000 C CNN
F 3 "" H 3590 4760 60  0000 C CNN
	1    3550 5000
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_100nF_100V_10%_X7R_0603(1608M)- C13
U 1 1 609DDED7
P 3550 5300
F 0 "C13" H 3630 5160 60  0000 L BNN
F 1 "100nF" H 3630 5080 60  0000 L BNN
F 2 "" H 3630 5080 60  0000 C CNN
F 3 "" H 3630 5080 60  0000 C CNN
	1    3550 5300
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_100nF_100V_10%_X7R_0603(1608M)- C6
U 1 1 609DDED6
P 3950 4300
F 0 "C6" H 4030 4160 60  0000 L BNN
F 1 "100nF" H 4030 4080 60  0000 L BNN
F 2 "" H 4030 4080 60  0000 C CNN
F 3 "" H 4030 4080 60  0000 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:TPS61200DR_Voltage_Boost_Regulator_1- U8
U 1 1 609DDED5
P 7600 5350
F 0 "U8" H 7600 6550 60  0000 L BNN
F 1 "" H 7600 5350 50  0001 C CNN
F 2 "" H 7600 5350 50  0001 C CNN
F 3 "" H 7600 5350 50  0001 C CNN
F 4 "TPS61200DR" V 1400 2000 60  0001 C CNN "Part Number"
	1    7600 5350
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:RES_100K_0.1%_0.1W_0603- R5
U 1 1 609DDED4
P 7100 4250
F 0 "R5" H 7140 4090 60  0000 L BNN
F 1 "100K" H 7140 4010 60  0000 L BNN
F 2 "" H 7140 4010 60  0000 C CNN
F 3 "" H 7140 4010 60  0000 C CNN
	1    7100 4250
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:IND_2.2uH_WireWound- L1
U 1 1 609DDED3
P 7750 3900
F 0 "L1" H 7850 3950 60  0000 L BNN
F 1 "2.2uH" H 7850 3770 60  0000 L BNN
F 2 "" H 7850 3770 60  0000 C CNN
F 3 "" H 7850 3770 60  0000 C CNN
	1    7750 3900
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_10uF_10V_15%_X5R_0603(1608M)- C7
U 1 1 609DDED2
P 6500 4300
F 0 "C7" H 6580 4160 60  0000 L BNN
F 1 "10uF" H 6580 4080 60  0000 L BNN
F 2 "" H 6580 4080 60  0000 C CNN
F 3 "" H 6580 4080 60  0000 C CNN
	1    6500 4300
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_0.1uF_25V_10%_X7R_0402(1005M)- C8
U 1 1 609DDED1
P 6800 4300
F 0 "C8" H 6880 4160 60  0000 L BNN
F 1 "0.1uF" H 6880 4080 60  0000 L BNN
F 2 "" H 6880 4080 60  0000 C CNN
F 3 "" H 6880 4080 60  0000 C CNN
	1    6800 4300
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_100nF_100V_10%_X7R_0603(1608M)- C2
U 1 1 609DDED0
P 6550 7500
F 0 "C2" H 6630 7360 60  0000 L BNN
F 1 "100nF" H 6630 7280 60  0000 L BNN
F 2 "" H 6630 7280 60  0000 C CNN
F 3 "" H 6630 7280 60  0000 C CNN
	1    6550 7500
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_0.1uF_25V_10%_X7R_0402(1005M)- C12
U 1 1 609DDECF
P 8900 4800
F 0 "C12" H 8980 4660 60  0000 L BNN
F 1 "0.1uF" H 8980 4580 60  0000 L BNN
F 2 "" H 8980 4580 60  0000 C CNN
F 3 "" H 8980 4580 60  0000 C CNN
	1    8900 4800
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_10uF_10V_15%_X5R_0603(1608M)- C9
U 1 1 609DDECE
P 9050 4400
F 0 "C9" H 9130 4260 60  0000 L BNN
F 1 "10uF" H 9130 4180 60  0000 L BNN
F 2 "" H 9130 4180 60  0000 C CNN
F 3 "" H 9130 4180 60  0000 C CNN
	1    9050 4400
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_1.0uF_50V_10%_X7R_0603(1608M)- C10
U 1 1 609DDECD
P 9400 4400
F 0 "C10" H 9480 4260 60  0000 L BNN
F 1 "1uF" H 9480 4180 60  0000 L BNN
F 2 "" H 9480 4180 60  0000 C CNN
F 3 "" H 9480 4180 60  0000 C CNN
	1    9400 4400
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CAP_0.1uF_25V_10%_X7R_0402(1005M)- C11
U 1 1 609DDECC
P 9700 4400
F 0 "C11" H 9780 4260 60  0000 L BNN
F 1 "0.1uF" H 9780 4180 60  0000 L BNN
F 2 "" H 9780 4180 60  0000 C CNN
F 3 "" H 9780 4180 60  0000 C CNN
	1    9700 4400
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:STC4054GR- U1
U 1 1 609DDECB
P 2050 5500
F 0 "U1" H 2050 6100 60  0000 L BNN
F 1 "" H 2050 5500 50  0001 C CNN
F 2 "" H 2050 5500 50  0001 C CNN
F 3 "" H 2050 5500 50  0001 C CNN
F 4 "STC4054GR" V 1400 2000 60  0001 C CNN "Part Number"
	1    2050 5500
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:0532610271_1- J1
U 1 1 609DDECA
P 1100 4150
F 0 "J1" H 1300 4150 60  0000 R TNN
F 1 "" H 1100 4150 50  0001 C CNN
F 2 "" H 1100 4150 50  0001 C CNN
F 3 "" H 1100 4150 50  0001 C CNN
F 4 "0532610271" V 1400 2000 60  0001 C CNN "Part Number"
	1    1100 4150
	-1   0    0    1   
$EndComp
$Comp
L Circuit-SchDoc-rescue:0532610271_1- J2
U 1 1 609DDEC9
P 1100 4900
F 0 "J2" H 1300 4900 60  0000 R TNN
F 1 "" H 1100 4900 50  0001 C CNN
F 2 "" H 1100 4900 50  0001 C CNN
F 3 "" H 1100 4900 50  0001 C CNN
F 4 "0532610271" V 1400 2000 60  0001 C CNN "Part Number"
	1    1100 4900
	-1   0    0    1   
$EndComp
$Comp
L Circuit-SchDoc-rescue:Diode_S1B-13-F- D1
U 1 1 609DDEC8
P 8900 7650
F 0 "D1" V 9110 7780 60  0000 R TNN
F 1 "" H 8900 7650 50  0001 C CNN
F 2 "" H 8900 7650 50  0001 C CNN
F 3 "" H 8900 7650 50  0001 C CNN
F 4 "S1B-13-F" V 1400 2000 60  0001 C CNN "Part Number"
	1    8900 7650
	0    -1   -1   0   
$EndComp
$Comp
L Circuit-SchDoc-rescue:RES_10.0K_1%_0.33W_0603- R2
U 1 1 609DDEC7
P 8400 7250
F 0 "R2" H 8440 7090 60  0000 L BNN
F 1 "10K0" H 8440 7010 60  0000 L BNN
F 2 "" H 8440 7010 60  0000 C CNN
F 3 "" H 8440 7010 60  0000 C CNN
	1    8400 7250
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:ATMEGA328P_SMD_1- U5
U 1 1 609DDEC6
P 7100 9150
F 0 "U5" H 7100 10950 60  0000 L BNN
F 1 "" H 7100 9150 50  0001 C CNN
F 2 "" H 7100 9150 50  0001 C CNN
F 3 "" H 7100 9150 50  0001 C CNN
F 4 "ATMEGA328P" V 1400 2000 60  0001 C CNN "Part Number"
	1    7100 9150
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:CX3225SB16000D0GZJC1_1- XTAL1
U 1 1 609DDEC5
P 8730 8660
F 0 "XTAL1" H 9120 9120 60  0000 L BNN
F 1 "16MHz" H 9120 9020 60  0000 L BNN
F 2 "" H 9120 9020 60  0000 C CNN
F 3 "" H 9120 9020 60  0000 C CNN
	1    8730 8660
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:XBEE_3_SMD_1- U7
U 1 1 609DDEC4
P 4600 8550
F 0 "U7" H 4600 9150 60  0000 L BNN
F 1 "" H 4600 8550 50  0001 C CNN
F 2 "" H 4600 8550 50  0001 C CNN
F 3 "" H 4600 8550 50  0001 C CNN
F 4 "Digi XBEE 3" V 1400 2000 60  0001 C CNN "Part Number"
	1    4600 8550
	1    0    0    -1  
$EndComp
$Comp
L Circuit-SchDoc-rescue:SN74LVC1G125DCKR_1- U6
U 1 1 609DDEC3
P 6300 8350
F 0 "U6" H 7000 8800 60  0000 R BNN
F 1 "" H 6300 8350 50  0001 C CNN
F 2 "" H 6300 8350 50  0001 C CNN
F 3 "" H 6300 8350 50  0001 C CNN
F 4 "SN74LVC1G125" V 1400 2000 60  0001 C CNN "Part Number"
	1    6300 8350
	-1   0    0    -1  
$EndComp
Wire Notes Line
	500  6900 10600 6900
Wire Notes Line
	500  3600 10600 3600
Wire Notes Line
	10600 3600 10600 9800
Wire Notes Line
	500  3600 500  10300
Wire Notes Line
	500  10300 7100 10300
Wire Wire Line
	6500 4250 6800 4250
$EndSCHEMATC
