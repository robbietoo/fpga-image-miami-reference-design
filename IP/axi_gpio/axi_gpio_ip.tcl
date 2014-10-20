# Create GPIO IP
open_project {./axi_gpio.xpr}
ipx::package_project -root_dir .
set_property vendor {TEP} [ipx::current_core]
set_property range_dependency {} [ipx::get_address_block reg0 [ipx::get_memory_map S_AXI [ipx::current_core]]]
set_property range {65536} [ipx::get_address_block reg0 [ipx::get_memory_map S_AXI [ipx::current_core]]]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project
