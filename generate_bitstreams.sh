vivado -mode tcl -source miami_reference_design.tcl -tclargs ${MACHINE}

if [ ! -f ./miami_reference_design.runs/impl_1/miami_reference_design_wrapper.bit ]
then
	echo "No bitstreams generated"
	exit 1
fi

# Create the "main" file for the OE part
ln ./miami_reference_design.runs/impl_1/miami_reference_design_wrapper.bit ./fpga.bit
