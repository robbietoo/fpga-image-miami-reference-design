fpga-image-miami-reference-design
=================================

This repository contains VHDL code and scripts to build a FPGA image for the Miami-7015/7030 SoM.

The design contains an IP that manages all GPIO pins of the FPGA. This IP can be configured runtime using a AXI-4 bus. (To read and write to this IP use 'devmem' for example)
All GPIO pins can be configured as input to read its value, or as output with a 1 or 0. Check the README in the IP/axi_gpio directory for documentation about how to use this IP.


To build the FPGA bitstream, cd to this directory, export the $MACHINE variable with value topic-miami-7015 or topic-miami-7030 and run generate_bitstreams.sh

	cd fpga-image-miami-reference-design
	export MACHINE=topic-miami-7015
	./generate_bitstreams.sh


