This is the README for the axi GPIO IP. 

This IP is intented for testing purposes and can read/write all GPIO signals via a AXI-slave interface (the GPIO signals are in/out (tri-state)).
The number of GPIO signals is configurable (with a max of 200 signals) via the IP GUI. 

Another functionallity of this IP is that it can divide a clock signal by a configurable value. This value is configurable via the AXI-slave interface.

########### ADDRESS MAP ##################
The address map of this IP is as follow:
Each GPIO signal has a 4 word memory range to be configured:
Pin 0: 		0x0-0x0F
Pin 1: 		0x10-0x1F
----
Pin 199: 	0xC70-0xC7F

On address 0xC80 and 0xC84 the divided clock can be configured.

########## HOW TO USE THE GPIO SIGNALS ##########
Of this 4 word range only 3 words are used and only the first bit (LSB) of these words are used.
Read input value (1, 0) of pin:				0x0
Write output value (1, 0) of pin:			0x4
Write tri-state (1:output, 0:input):	0x8
Reserved:															0xC

########## HOW TO USE THE CLOCK DIVIDER ##########
The output on div_clk_out is 'clk_in' divided by 'divider + 1'. If (clk_in = 100Mhz and divider = 1) then div_clk_out = 50 Mhz.
The memory map is:
div_enable:			0xC80
divider:				0xC84

