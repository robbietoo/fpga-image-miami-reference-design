# This script needs 1 parameter
# 0: board (machine)
if { $argc != 1 } {
    puts "ERROR: This script needs 1 argument, $argc found, see top of file for explanation"
	exit -1
} else {
	set machine [lindex $argv 0]
	if { $machine == "topic-miami-7015" } {
		set part "xc7z015clg485-1"
	} elseif { $machine == "topic-miami-7030" } {
		set part "xc7z030sbg485-1"
	} else {
    	puts "ERROR: MACHINE: ${machine} not valid."
		exit -1
	}		
}

set project_name "miami_reference_design"

puts "Board: $machine"
puts "Part: $part"

# Generate IP's 
cd IP/axi_gpio
source axi_gpio_ip.tcl
cd ../../

# Create project
create_project $project_name . -part $part -force
set_property target_language VHDL [current_project]

# Update IP Repo
set_property ip_repo_paths {./IP/} [current_fileset]
update_ip_catalog

# Create Block design
source ./generate_bd.tcl

# Add constraints file
add_files -fileset constrs_1 -norecurse ./${project_name}.xdc
import_files -fileset constrs_1 ./${project_name}.xdc

#reset and generate output products
reset_target all [get_files  ./${project_name}.srcs/sources_1/bd/${project_name}/${project_name}.bd]
generate_target all [get_files  ./${project_name}.srcs/sources_1/bd/${project_name}/${project_name}.bd]

# Run synthesize
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1

# Run implementation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# Close project
close_project

# Exit vivado
exit
