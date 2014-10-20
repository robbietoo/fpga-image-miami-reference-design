# Clk in is a 98 Mhz clock
create_clock -period 10.204 -name clk_in -add [get_ports {clk_in}]

# Set false path from PS clock 0 (processing_system7_0_FCLK_CLK0) to clk_in of GPIO IP
set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks clk_in]

################# 			IO BANK 13 				####################
# {IO_0_13} user LED
set_property IOSTANDARD 	LVCMOS33 	[get_ports {div_clk_out}]		
set_property PACKAGE_PIN	T16 			[get_ports {div_clk_out}]
# IO_L1P_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[0]}]
set_property PACKAGE_PIN	V13				[get_ports {gpio_signals[0]}]
# IO_L1N_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[1]}]
set_property PACKAGE_PIN 	V14			 	[get_ports {gpio_signals[1]}]
# IO_L2P_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[2]}]
set_property PACKAGE_PIN 	V15			 	[get_ports {gpio_signals[2]}]
# IO_L2N_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[3]}]
set_property PACKAGE_PIN 	W15			 	[get_ports {gpio_signals[3]}]
# IO_L3P_T0_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[4]}]
set_property PACKAGE_PIN 	W12			 	[get_ports {gpio_signals[4]}]
# IO_L3N_T0_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[5]}]
set_property PACKAGE_PIN 	W13				[get_ports {gpio_signals[5]}]
# IO_L4P_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[6]}]
set_property PACKAGE_PIN 	V11			 	[get_ports {gpio_signals[6]}]
# IO_L4N_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[7]}]
set_property PACKAGE_PIN 	W11			 	[get_ports {gpio_signals[7]}]
# IO_L5P_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[8]}]
set_property PACKAGE_PIN 	U11			 	[get_ports {gpio_signals[8]}]
# IO_L5N_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[9]}]
set_property PACKAGE_PIN 	U12			 	[get_ports {gpio_signals[9]}]
# IO_L6P_T0_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[10]}]
set_property PACKAGE_PIN 	U13			 	[get_ports {gpio_signals[10]}]
# IO_L6N_T0_VREF_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[11]}]
set_property PACKAGE_PIN 	U14			 	[get_ports {gpio_signals[11]}]
# IO_L7P_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[12]}]
set_property PACKAGE_PIN 	AA11			[get_ports {gpio_signals[12]}]
# IO_L7N_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[13]}]
set_property PACKAGE_PIN 	AB11			[get_ports {gpio_signals[13]}]
# IO_L8P_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[14]}]
set_property PACKAGE_PIN 	AA12			[get_ports {gpio_signals[14]}]
# IO_L8N_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[15]}]
set_property PACKAGE_PIN 	AB12			[get_ports {gpio_signals[15]}]
# IO_L9P_T1_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[16]}]
set_property PACKAGE_PIN 	AB13			[get_ports {gpio_signals[16]}]
# IO_L9N_T1_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[17]}]
set_property PACKAGE_PIN 	AB14			[get_ports {gpio_signals[17]}]
# IO_L10P_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[18]}]
set_property PACKAGE_PIN 	Y12			 	[get_ports {gpio_signals[18]}]
# IO_L10N_T1_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[19]}]
set_property PACKAGE_PIN 	Y13			 	[get_ports {gpio_signals[19]}]
# IO_L11P_T1_SRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[20]}]
set_property PACKAGE_PIN 	AA14			[get_ports {gpio_signals[20]}]
# IO_L11N_T1_SRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[21]}]
set_property PACKAGE_PIN 	AA15			[get_ports {gpio_signals[21]}]
# IO_L12P_T1_MRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[22]}]
set_property PACKAGE_PIN 	Y14			 	[get_ports {gpio_signals[22]}]
# IO_L12N_T1_MRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[23]}]
set_property PACKAGE_PIN 	Y15			 	[get_ports {gpio_signals[23]}]
# IO_L13P_T2_MRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[24]}]
set_property PACKAGE_PIN 	Y18			 	[get_ports {gpio_signals[24]}]
# IO_L13N_T2_MRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[25]}]
set_property PACKAGE_PIN 	Y19			 	[get_ports {gpio_signals[25]}]
# IO_L14P_T2_SRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[26]}]
set_property PACKAGE_PIN 	AA16			[get_ports {gpio_signals[26]}]
# IO_L14N_T2_SRCC_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[27]}]
set_property PACKAGE_PIN 	AA17			[get_ports {gpio_signals[27]}]
# IO_L15P_T2_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[28]}]
set_property PACKAGE_PIN 	AB21			[get_ports {gpio_signals[28]}]
# IO_L15N_T2_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[29]}]
set_property PACKAGE_PIN 	AB22			[get_ports {gpio_signals[29]}]
# IO_L16P_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[30]}]
set_property PACKAGE_PIN 	AB18			[get_ports {gpio_signals[30]}]
# IO_L16N_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[31]}]
set_property PACKAGE_PIN 	AB19			[get_ports {gpio_signals[31]}]
# IO_L17P_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[32]}]
set_property PACKAGE_PIN 	AB16			[get_ports {gpio_signals[32]}]
# IO_L17N_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[33]}]
set_property PACKAGE_PIN 	AB17			[get_ports {gpio_signals[33]}]
# IO_L18P_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[34]}]
set_property PACKAGE_PIN 	AA19			[get_ports {gpio_signals[34]}]
# IO_L18N_T2_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[35]}]
set_property PACKAGE_PIN 	AA20			[get_ports {gpio_signals[35]}]
# IO_L19P_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[36]}]
set_property PACKAGE_PIN 	R17			 	[get_ports {gpio_signals[36]}]
# IO_L19N_T3_VREF_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[37]}]
set_property PACKAGE_PIN 	T17			 	[get_ports {gpio_signals[37]}]
# IO_L20P_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[38]}]
set_property PACKAGE_PIN 	U19			 	[get_ports {gpio_signals[38]}]
# IO_L20N_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[39]}]
set_property PACKAGE_PIN 	V19			 	[get_ports {gpio_signals[39]}]
# IO_L21P_T3_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[40]}]
set_property PACKAGE_PIN 	V18			 	[get_ports {gpio_signals[40]}]
# IO_L21N_T3_DQS_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[41]}]
set_property PACKAGE_PIN 	W18			 	[get_ports {gpio_signals[41]}]
# IO_L22P_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[42]}]
set_property PACKAGE_PIN 	U17			 	[get_ports {gpio_signals[42]}]
# IO_L22N_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[43]}]
set_property PACKAGE_PIN 	U18			 	[get_ports {gpio_signals[43]}]
# IO_L23P_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[44]}]
set_property PACKAGE_PIN 	V16			 	[get_ports {gpio_signals[44]}]
# IO_L23N_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[45]}]
set_property PACKAGE_PIN 	W16			 	[get_ports {gpio_signals[45]}]
# IO_L24P_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[46]}]
set_property PACKAGE_PIN 	W17			 	[get_ports {gpio_signals[46]}]
# IO_L24N_T3_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[47]}]
set_property PACKAGE_PIN 	Y17			 	[get_ports {gpio_signals[47]}]
# IO_25_13
set_property IOSTANDARD 	LVCMOS33 	[get_ports {gpio_signals[48]}]
set_property PACKAGE_PIN 	U16			 	[get_ports {gpio_signals[48]}]


################# 			IO BANK 34 				####################
# IO_L1P_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[49]}]
set_property PACKAGE_PIN	J8				[get_ports {gpio_signals[49]}]
# IO_L1N_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[50]}]
set_property PACKAGE_PIN 	K8			 	[get_ports {gpio_signals[50]}]
# IO_L2P_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[51]}]
set_property PACKAGE_PIN 	J7			 	[get_ports {gpio_signals[51]}]
# IO_L2N_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[52]}]
set_property PACKAGE_PIN 	J6			 	[get_ports {gpio_signals[52]}]
# IO_L3P_T0_DQS_PUDC_B_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[53]}]
set_property PACKAGE_PIN 	K7			 	[get_ports {gpio_signals[53]}]
# IO_L3N_T0_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[54]}]
set_property PACKAGE_PIN 	L7				[get_ports {gpio_signals[54]}]
# IO_L4P_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[55]}]
set_property PACKAGE_PIN 	L6			 	[get_ports {gpio_signals[55]}]
# IO_L4N_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[56]}]
set_property PACKAGE_PIN 	M6			 	[get_ports {gpio_signals[56]}]
# IO_L5P_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[57]}]
set_property PACKAGE_PIN 	N8			 	[get_ports {gpio_signals[57]}]
# IO_L5N_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[58]}]
set_property PACKAGE_PIN 	P8			 	[get_ports {gpio_signals[58]}]
# IO_L6P_T0_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[59]}]
set_property PACKAGE_PIN 	M8			 	[get_ports {gpio_signals[59]}]
# IO_L6N_T0_VREF_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[60]}]
set_property PACKAGE_PIN 	M7			 	[get_ports {gpio_signals[60]}]
# IO_L7P_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[61]}]
set_property PACKAGE_PIN 	J5				[get_ports {gpio_signals[61]}]
# IO_L7N_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[62]}]
set_property PACKAGE_PIN 	K5				[get_ports {gpio_signals[62]}]
# IO_L8P_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[63]}]
set_property PACKAGE_PIN 	J2				[get_ports {gpio_signals[63]}]
# IO_L8N_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[64]}]
set_property PACKAGE_PIN 	J1				[get_ports {gpio_signals[64]}]
# IO_L9P_T1_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[65]}]
set_property PACKAGE_PIN 	J3				[get_ports {gpio_signals[65]}]
# IO_L9N_T1_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[66]}]
set_property PACKAGE_PIN 	K2				[get_ports {gpio_signals[66]}]
# IO_L10P_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[67]}]
set_property PACKAGE_PIN 	L2			 	[get_ports {gpio_signals[67]}]
# IO_L10N_T1_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[68]}]
set_property PACKAGE_PIN 	L1			 	[get_ports {gpio_signals[68]}]
# IO_L11P_T1_SRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[69]}]
set_property PACKAGE_PIN 	K4				[get_ports {gpio_signals[69]}]
# IO_L11N_T1_SRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[70]}]
set_property PACKAGE_PIN 	K3				[get_ports {gpio_signals[70]}]
# IO_L12P_T1_MRCC_34 PL_CLOCK
set_property IOSTANDARD 	LVCMOS18 	[get_ports {clk_in}]		
set_property PACKAGE_PIN 	L5			 	[get_ports {clk_in}]
# IO_L12N_T1_MRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[71]}]
set_property PACKAGE_PIN 	L4			 	[get_ports {gpio_signals[71]}]
# IO_L13P_T2_MRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[72]}]
set_property PACKAGE_PIN 	T2			 	[get_ports {gpio_signals[72]}]
# IO_L13N_T2_MRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[73]}]
set_property PACKAGE_PIN 	T1			 	[get_ports {gpio_signals[73]}]
# IO_L14P_T2_SRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[74]}]
set_property PACKAGE_PIN 	U2				[get_ports {gpio_signals[74]}]
# IO_L14N_T2_SRCC_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[75]}]
set_property PACKAGE_PIN 	U1				[get_ports {gpio_signals[75]}]
# IO_L15P_T2_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[76]}]
set_property PACKAGE_PIN 	M2				[get_ports {gpio_signals[76]}]
# IO_L15N_T2_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[77]}]
set_property PACKAGE_PIN 	M1				[get_ports {gpio_signals[77]}]
# IO_L16P_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[78]}]
set_property PACKAGE_PIN 	N1				[get_ports {gpio_signals[78]}]
# IO_L16N_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[79]}]
set_property PACKAGE_PIN 	P1				[get_ports {gpio_signals[79]}]
# IO_L17P_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[80]}]
set_property PACKAGE_PIN 	R3				[get_ports {gpio_signals[80]}]
# IO_L17N_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[81]}]
set_property PACKAGE_PIN 	R2				[get_ports {gpio_signals[81]}]
# IO_L18P_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[82]}]
set_property PACKAGE_PIN 	P3				[get_ports {gpio_signals[82]}]
# IO_L18N_T2_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[83]}]
set_property PACKAGE_PIN 	P2				[get_ports {gpio_signals[83]}]
# IO_L19P_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[84]}]
set_property PACKAGE_PIN 	N6			 	[get_ports {gpio_signals[84]}]
# IO_L19N_T3_VREF_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[85]}]
set_property PACKAGE_PIN 	N5			 	[get_ports {gpio_signals[85]}]
# IO_L20P_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[86]}]
set_property PACKAGE_PIN 	P6			 	[get_ports {gpio_signals[86]}]
# IO_L20N_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[87]}]
set_property PACKAGE_PIN 	P5			 	[get_ports {gpio_signals[87]}]
# IO_L21P_T3_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[88]}]
set_property PACKAGE_PIN 	N4			 	[get_ports {gpio_signals[88]}]
# IO_L21N_T3_DQS_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[89]}]
set_property PACKAGE_PIN 	N3			 	[get_ports {gpio_signals[89]}]
# IO_L22P_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[90]}]
set_property PACKAGE_PIN 	M4			 	[get_ports {gpio_signals[90]}]
# IO_L22N_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[91]}]
set_property PACKAGE_PIN 	M3			 	[get_ports {gpio_signals[91]}]
# IO_L23P_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[92]}]
set_property PACKAGE_PIN 	R5			 	[get_ports {gpio_signals[92]}]
# IO_L23N_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[93]}]
set_property PACKAGE_PIN 	R4			 	[get_ports {gpio_signals[93]}]
# IO_L24P_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[94]}]
set_property PACKAGE_PIN 	P7			 	[get_ports {gpio_signals[94]}]
# IO_L24N_T3_34
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[95]}]
set_property PACKAGE_PIN 	R7			 	[get_ports {gpio_signals[95]}]


################# 			IO BANK 35 				####################
# IO_L1P_T0_AD0P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[96]}]
set_property PACKAGE_PIN	F7				[get_ports {gpio_signals[96]}]
# IO_L1N_T0_AD0N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[97]}]
set_property PACKAGE_PIN	E7				[get_ports {gpio_signals[97]}]
# IO_L2P_T0_AD8P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[98]}]
set_property PACKAGE_PIN	D7				[get_ports {gpio_signals[98]}]
# IO_L2N_T0_AD8N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[99]}]
set_property PACKAGE_PIN	D6				[get_ports {gpio_signals[99]}]
# IO_L3P_T0_DQS_AD1P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[100]}]
set_property PACKAGE_PIN	E8				[get_ports {gpio_signals[100]}]
# IO_L3N_T0_DQS_AD1N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[101]}]
set_property PACKAGE_PIN	D8				[get_ports {gpio_signals[101]}]
# IO_L4P_T0_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[102]}]
set_property PACKAGE_PIN	G8				[get_ports {gpio_signals[102]}]
# IO_L4N_T0_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[103]}]
set_property PACKAGE_PIN	G7				[get_ports {gpio_signals[103]}]
# IO_L5P_T0_AD9P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[104]}]
set_property PACKAGE_PIN	F5				[get_ports {gpio_signals[104]}]
# IO_L5N_T0_AD9N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[105]}]
set_property PACKAGE_PIN	E5				[get_ports {gpio_signals[105]}]
# IO_L6P_T0_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[106]}]
set_property PACKAGE_PIN	G6				[get_ports {gpio_signals[106]}]
# IO_L6N_T0_VREF_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[107]}]
set_property PACKAGE_PIN	F6				[get_ports {gpio_signals[107]}]
# IO_L7P_T1_AD2P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[108]}]
set_property PACKAGE_PIN	C8				[get_ports {gpio_signals[108]}]
# IO_L7N_T1_AD2N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[109]}]
set_property PACKAGE_PIN	B8				[get_ports {gpio_signals[109]}]
# IO_L8P_T1_AD10P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[110]}]
set_property PACKAGE_PIN	B7				[get_ports {gpio_signals[110]}]
# IO_L8N_T1_AD10N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[111]}]
set_property PACKAGE_PIN	B6				[get_ports {gpio_signals[111]}]
# IO_L9P_T1_DQS_AD3P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[112]}]
set_property PACKAGE_PIN	A7				[get_ports {gpio_signals[112]}]
# IO_L9N_T1_DQS_AD3N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[113]}]
set_property PACKAGE_PIN	A6				[get_ports {gpio_signals[113]}]
# IO_L10P_T1_AD11P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[114]}]
set_property PACKAGE_PIN	A5				[get_ports {gpio_signals[114]}]
# IO_L10N_T1_AD11N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[115]}]
set_property PACKAGE_PIN	A4				[get_ports {gpio_signals[115]}]
# IO_L11P_T1_SRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[116]}]
set_property PACKAGE_PIN	C6				[get_ports {gpio_signals[116]}]
# IO_L11N_T1_SRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[117]}]
set_property PACKAGE_PIN	C5				[get_ports {gpio_signals[117]}]
# IO_L12P_T1_MRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[118]}]
set_property PACKAGE_PIN	D5				[get_ports {gpio_signals[118]}]
# IO_L12N_T1_MRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[119]}]
set_property PACKAGE_PIN	C4				[get_ports {gpio_signals[119]}]
# IO_L13P_T2_MRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[120]}]
set_property PACKAGE_PIN	B4				[get_ports {gpio_signals[120]}]
# IO_L13N_T2_MRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[121]}]
set_property PACKAGE_PIN	B3				[get_ports {gpio_signals[121]}]
# IO_L14P_T2_AD4P_SRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[122]}]
set_property PACKAGE_PIN	D3				[get_ports {gpio_signals[122]}]
# IO_L14N_T2_AD4N_SRCC_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[123]}]
set_property PACKAGE_PIN	C3				[get_ports {gpio_signals[123]}]
# IO_L15P_T2_DQS_AD12P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[124]}]
set_property PACKAGE_PIN	A2				[get_ports {gpio_signals[124]}]
# IO_L15N_T2_DQS_AD12N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[125]}]
set_property PACKAGE_PIN	A1				[get_ports {gpio_signals[125]}]
# IO_L16P_T2_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[126]}]
set_property PACKAGE_PIN	D1				[get_ports {gpio_signals[126]}]
# IO_L16N_T2_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[127]}]
set_property PACKAGE_PIN	C1				[get_ports {gpio_signals[127]}]
# IO_L17P_T2_AD5P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[128]}]
set_property PACKAGE_PIN	E2				[get_ports {gpio_signals[128]}]
# IO_L17N_T2_AD5N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[129]}]
set_property PACKAGE_PIN	D2				[get_ports {gpio_signals[129]}]
# IO_L18P_T2_AD13P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[130]}]
set_property PACKAGE_PIN	B2				[get_ports {gpio_signals[130]}]
# IO_L18N_T2_AD13N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[131]}]
set_property PACKAGE_PIN	B1				[get_ports {gpio_signals[131]}]
# IO_L19P_T3_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[132]}]
set_property PACKAGE_PIN	H4				[get_ports {gpio_signals[132]}]
# IO_L19N_T3_VREF_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[133]}]
set_property PACKAGE_PIN	H3				[get_ports {gpio_signals[133]}]
# IO_L20P_T3_AD6P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[134]}]
set_property PACKAGE_PIN	G4				[get_ports {gpio_signals[134]}]
# IO_L20N_T3_AD6N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[135]}]
set_property PACKAGE_PIN	F4				[get_ports {gpio_signals[135]}]
# IO_L21P_T3_DQS_AD14P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[136]}]
set_property PACKAGE_PIN	E4				[get_ports {gpio_signals[136]}]
# IO_L21N_T3_DQS_AD14N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[137]}]
set_property PACKAGE_PIN	E3				[get_ports {gpio_signals[137]}]
# IO_L22P_T3_AD7P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[138]}]
set_property PACKAGE_PIN	G3				[get_ports {gpio_signals[138]}]
# IO_L22N_T3_AD7N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[139]}]
set_property PACKAGE_PIN	G2				[get_ports {gpio_signals[139]}]
# IO_L23P_T3_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[140]}]
set_property PACKAGE_PIN	F2				[get_ports {gpio_signals[140]}]
# IO_L23N_T3_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[141]}]
set_property PACKAGE_PIN	F1				[get_ports {gpio_signals[141]}]
# IO_L24P_T3_AD15P_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[142]}]
set_property PACKAGE_PIN	H1				[get_ports {gpio_signals[142]}]
# IO_L24N_T3_AD15N_35
set_property IOSTANDARD 	LVCMOS18 	[get_ports {gpio_signals[143]}]
set_property PACKAGE_PIN	G1				[get_ports {gpio_signals[143]}]


################# 			IO BANK 112 				####################
# =========================== MGT transceivers ==========================
#set_property PACKAGE_PIN 	U9			[get_ports {MGTREFCLK0P_112}]
#set_property PACKAGE_PIN 	V9			[get_ports {MGTREFCLK0N_112}]
#set_property PACKAGE_PIN 	U5			[get_ports {MGTREFCLK1P_112}]
#set_property PACKAGE_PIN 	V5			[get_ports {MGTREFCLK1N_112}]

#set_property PACKAGE_PIN 	AA3			[get_ports {MGTPTXP0_112}]
#set_property PACKAGE_PIN 	AB3			[get_ports {MGTPTXN0_112}]
#set_property PACKAGE_PIN 	AA7			[get_ports {MGTPRXP0_112}]
#set_property PACKAGE_PIN 	AB7			[get_ports {MGTPRXN0_112}]

#set_property PACKAGE_PIN 	W4			[get_ports {MGTPTXP1_112}]
#set_property PACKAGE_PIN 	Y4			[get_ports {MGTPTXN1_112}]
#set_property PACKAGE_PIN 	W8			[get_ports {MGTPRXP1_112}]
#set_property PACKAGE_PIN 	Y8			[get_ports {MGTPRXN1_112}]

#set_property PACKAGE_PIN 	AA5			[get_ports {MGTPTXP2_112}]
#set_property PACKAGE_PIN 	AB5			[get_ports {MGTPTXN2_112}]
#set_property PACKAGE_PIN 	AA9			[get_ports {MGTPRXP2_112}]
#set_property PACKAGE_PIN 	AB9			[get_ports {MGTPRXN2_112}]

#set_property PACKAGE_PIN 	W2			[get_ports {MGTPTXP3_112}]
#set_property PACKAGE_PIN 	Y2			[get_ports {MGTPTXN3_112}]
#set_property PACKAGE_PIN 	W6			[get_ports {MGTPRXP3_112}]
#set_property PACKAGE_PIN 	Y6			[get_ports {MGTPRXN3_112}]



