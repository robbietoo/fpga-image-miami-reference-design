fpga-image-miami-reference-design
=================================

This repository contains VHDL code and scripts to build a FPGA image for the Miami-7015/7030 SoM 


To build the FPGA bitstream, cd to this directory, export the $MACHINE variable with value topic-miami-7015 or topic-miami-7030 and run generate_bitstreams.sh

	cd fpga-image-miami-reference-design
	export MACHINE=topic-miami-7015
	./generate_bitstreams.sh
