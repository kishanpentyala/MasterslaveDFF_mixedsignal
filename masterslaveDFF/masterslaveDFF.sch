EESchema Schematic File Version 2
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
LIBS:power
LIBS:eSim_Plot
LIBS:transistors
LIBS:conn
LIBS:eSim_User
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:eSim_Analog
LIBS:eSim_Devices
LIBS:eSim_Digital
LIBS:eSim_Hybrid
LIBS:eSim_Miscellaneous
LIBS:eSim_Power
LIBS:eSim_Sources
LIBS:eSim_Subckt
LIBS:eSim_Nghdl
LIBS:eSim_Ngveri
LIBS:eSim_SKY130
LIBS:eSim_SKY130_Subckts
LIBS:3stcmringosci13
LIBS:smttrigger21
LIBS:masterslaveDFF-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L kishan_masterslavedff U1
U 1 1 633A9263
P 4150 5150
F 0 "U1" H 7000 6950 60  0000 C CNN
F 1 "kishan_masterslavedff" H 7000 7150 60  0000 C CNN
F 2 "" H 7000 7100 60  0000 C CNN
F 3 "" H 7000 7100 60  0000 C CNN
	1    4150 5150
	1    0    0    -1  
$EndComp
$Comp
L pulse v3
U 1 1 633A9475
P 5050 4350
F 0 "v3" H 4850 4450 60  0000 C CNN
F 1 "pulse" H 4850 4300 60  0000 C CNN
F 2 "R1" H 4750 4350 60  0000 C CNN
F 3 "" H 5050 4350 60  0000 C CNN
	1    5050 4350
	1    0    0    -1  
$EndComp
$Comp
L pulse v2
U 1 1 633ADB2C
P 4700 4050
F 0 "v2" H 4500 4150 60  0000 C CNN
F 1 "pulse" H 4500 4000 60  0000 C CNN
F 2 "R1" H 4400 4050 60  0000 C CNN
F 3 "" H 4700 4050 60  0000 C CNN
	1    4700 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 633ADF86
P 4850 4850
F 0 "#PWR01" H 4850 4600 50  0001 C CNN
F 1 "GND" H 4850 4700 50  0000 C CNN
F 2 "" H 4850 4850 50  0001 C CNN
F 3 "" H 4850 4850 50  0001 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
$Comp
L adc_bridge_3 U2
U 1 1 633AE42D
P 5700 3300
F 0 "U2" H 5700 3300 60  0000 C CNN
F 1 "adc_bridge_3" H 5700 3450 60  0000 C CNN
F 2 "" H 5700 3300 60  0000 C CNN
F 3 "" H 5700 3300 60  0000 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
Text GLabel 8950 3250 2    60   Output ~ 0
Q
Text GLabel 4350 3000 0    60   Input ~ 0
clk
Text GLabel 4650 3400 0    60   Input ~ 0
rst
Text GLabel 5000 3550 0    60   Input ~ 0
D
$Comp
L dac_bridge_1 U3
U 1 1 633AE776
P 8300 3300
F 0 "U3" H 8300 3300 60  0000 C CNN
F 1 "dac_bridge_1" H 8300 3450 60  0000 C CNN
F 2 "" H 8300 3300 60  0000 C CNN
F 3 "" H 8300 3300 60  0000 C CNN
	1    8300 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4500 4700 4800
Wire Wire Line
	4700 4800 5050 4800
Wire Wire Line
	4850 4850 4850 4800
Connection ~ 4850 4800
Wire Wire Line
	6250 3250 6300 3250
Wire Wire Line
	6250 3350 6300 3350
Wire Wire Line
	6250 3450 6300 3450
Wire Wire Line
	5050 3000 5050 3900
Wire Wire Line
	5050 3450 5100 3450
Wire Wire Line
	5100 3350 4700 3350
Wire Wire Line
	4700 3350 4700 3600
Wire Wire Line
	4350 3000 4450 3000
Wire Wire Line
	4450 2950 4450 3250
Wire Wire Line
	5000 3550 5050 3550
Connection ~ 5050 3550
Wire Wire Line
	8850 3250 8950 3250
$Comp
L plot_v1 U7
U 1 1 633ADF85
P 8900 3350
F 0 "U7" H 8900 3850 60  0000 C CNN
F 1 "plot_v1" H 8650 3850 60  0000 C CNN
F 2 "" H 8900 3350 60  0000 C CNN
F 3 "" H 8900 3350 60  0000 C CNN
	1    8900 3350
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U4
U 1 1 633AE0BC
P 4450 3150
F 0 "U4" H 4450 3650 60  0000 C CNN
F 1 "plot_v1" H 4650 3500 60  0000 C CNN
F 2 "" H 4450 3150 60  0000 C CNN
F 3 "" H 4450 3150 60  0000 C CNN
	1    4450 3150
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U5
U 1 1 633AE18F
P 4750 3500
F 0 "U5" H 4750 4000 60  0000 C CNN
F 1 "plot_v1" H 4950 3850 60  0000 C CNN
F 2 "" H 4750 3500 60  0000 C CNN
F 3 "" H 4750 3500 60  0000 C CNN
	1    4750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3300 4750 3350
Connection ~ 4750 3350
$Comp
L plot_v1 U6
U 1 1 633AE2A9
P 5050 3200
F 0 "U6" H 5050 3700 60  0000 C CNN
F 1 "plot_v1" H 5250 3550 60  0000 C CNN
F 2 "" H 5050 3200 60  0000 C CNN
F 3 "" H 5050 3200 60  0000 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
Connection ~ 5050 3450
Connection ~ 4450 3000
Wire Wire Line
	8900 3150 8900 3250
Connection ~ 8900 3250
$Comp
L SKY130mode scmode1
U 1 1 633AF2EF
P 6950 4450
F 0 "scmode1" H 6950 4600 98  0000 C CNB
F 1 "SKY130mode" H 6950 4350 118 0000 C CNB
F 2 "" H 6950 4600 60  0001 C CNN
F 3 "" H 6950 4600 60  0001 C CNN
	1    6950 4450
	1    0    0    -1  
$EndComp
$Comp
L 3stcmringosci13 X1
U 1 1 63401542
P 2450 4150
F 0 "X1" H 2100 4650 60  0000 C CNN
F 1 "3stcmringosci13" H 2400 3800 60  0000 C CNN
F 2 "" H 2450 4150 60  0001 C CNN
F 3 "" H 2450 4150 60  0001 C CNN
	1    2450 4150
	1    0    0    -1  
$EndComp
$Comp
L smttrigger21 X2
U 1 1 63401763
P 3750 4000
F 0 "X2" H 3500 4300 60  0000 C CNN
F 1 "smttrigger21" H 3750 3850 60  0000 C CNN
F 2 "" H 3750 4000 60  0001 C CNN
F 3 "" H 3750 4000 60  0001 C CNN
	1    3750 4000
	1    0    0    -1  
$EndComp
Connection ~ 4450 3250
Wire Wire Line
	3050 3800 3250 3800
$Comp
L DC v1
U 1 1 63401977
P 1750 4450
F 0 "v1" H 1550 4550 60  0000 C CNN
F 1 "DC" H 1550 4400 60  0000 C CNN
F 2 "R1" H 1450 4450 60  0000 C CNN
F 3 "" H 1750 4450 60  0000 C CNN
	1    1750 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 63401AA9
P 1750 4950
F 0 "#PWR02" H 1750 4700 50  0001 C CNN
F 1 "GND" H 1750 4800 50  0000 C CNN
F 2 "" H 1750 4950 50  0001 C CNN
F 3 "" H 1750 4950 50  0001 C CNN
	1    1750 4950
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U10
U 1 1 63401B66
P 3150 3800
F 0 "U10" H 3150 4300 60  0000 C CNN
F 1 "plot_v1" H 3350 4150 60  0000 C CNN
F 2 "" H 3150 3800 60  0000 C CNN
F 3 "" H 3150 3800 60  0000 C CNN
	1    3150 3800
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U9
U 1 1 63401BFF
P 3050 4400
F 0 "U9" H 3050 4900 60  0000 C CNN
F 1 "plot_v1" H 3250 4750 60  0000 C CNN
F 2 "" H 3050 4400 60  0000 C CNN
F 3 "" H 3050 4400 60  0000 C CNN
	1    3050 4400
	0    1    1    0   
$EndComp
$Comp
L plot_v1 U8
U 1 1 63401DF2
P 3050 4350
F 0 "U8" H 3050 4850 60  0000 C CNN
F 1 "plot_v1" H 3250 4700 60  0000 C CNN
F 2 "" H 3050 4350 60  0000 C CNN
F 3 "" H 3050 4350 60  0000 C CNN
	1    3050 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 3600 3150 3800
Connection ~ 3150 3800
Wire Wire Line
	3150 4400 3250 4400
Wire Wire Line
	3050 4350 3050 4550
Wire Wire Line
	3050 4050 3150 4050
Wire Wire Line
	3150 4050 3150 4400
Wire Wire Line
	1750 4000 1850 4000
Wire Wire Line
	1750 4900 1750 4950
Wire Wire Line
	3250 4000 3250 3600
Wire Wire Line
	3250 3600 1800 3600
Wire Wire Line
	1800 3600 1800 4000
Connection ~ 1800 4000
Wire Wire Line
	4650 3400 4700 3400
Connection ~ 4700 3400
Wire Wire Line
	4350 3250 5100 3250
Wire Wire Line
	4350 3250 4350 3900
$EndSCHEMATC
