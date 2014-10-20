# Create block design
create_bd_design $project_name

# Create interface ports
set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

# Create ports
set clk_in [ create_bd_port -dir I -type clk clk_in ]
set_property -dict [ list CONFIG.FREQ_HZ {98000000}  ] $clk_in
set div_clk_out [ create_bd_port -dir O -type clk div_clk_out ]
set gpio_signals [ create_bd_port -dir IO -from 143 -to 0 gpio_signals ]

# Create instance: axi_gpio_0, and set properties
set axi_gpio_0 [ create_bd_cell -type ip -vlnv TEP:user:axi_gpio:1.0 axi_gpio_0 ]
set_property -dict [ list CONFIG.GPIOS {144}  ] $axi_gpio_0

# Create instance: processing_system7_0, and set properties
set ip_defs [get_ipdefs -filter "NAME =~ *processing_system7*"]
foreach ip_def $ip_defs {
	if { [string first "processing_system7:" $ip_def] != -1 } {
		set processing_system7_0 [ create_bd_cell -type ip -vlnv $ip_def processing_system7_0 ]
	}
}

set_property -dict [ list \
	CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V} \
	CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
	CONFIG.PCW_EN_CLK0_PORT {1} \
	CONFIG.PCW_EN_RST0_PORT {1} \
	CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
	CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
	CONFIG.PCW_I2C0_I2C0_IO {MIO 50 .. 51} \
	CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_I2C1_I2C1_IO {MIO 52 .. 53} \
	CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_MIO_0_PULLUP {enabled} CONFIG.PCW_MIO_0_SLEW {slow} \
	CONFIG.PCW_MIO_1_PULLUP {disabled} CONFIG.PCW_MIO_1_SLEW {slow} \
	CONFIG.PCW_MIO_24_PULLUP {enabled} CONFIG.PCW_MIO_24_SLEW {slow} \
	CONFIG.PCW_MIO_25_PULLUP {disabled} CONFIG.PCW_MIO_25_SLEW {slow} \
	CONFIG.PCW_MIO_26_PULLUP {enabled} CONFIG.PCW_MIO_26_SLEW {slow} \
	CONFIG.PCW_MIO_27_PULLUP {disabled} CONFIG.PCW_MIO_27_SLEW {slow} \
	CONFIG.PCW_MIO_28_PULLUP {disabled} CONFIG.PCW_MIO_28_SLEW {fast} \
	CONFIG.PCW_MIO_29_PULLUP {disabled} CONFIG.PCW_MIO_29_SLEW {fast} \
	CONFIG.PCW_MIO_30_PULLUP {disabled} CONFIG.PCW_MIO_30_SLEW {fast} \
	CONFIG.PCW_MIO_31_PULLUP {disabled} CONFIG.PCW_MIO_31_SLEW {fast} \
	CONFIG.PCW_MIO_32_PULLUP {disabled} CONFIG.PCW_MIO_32_SLEW {fast} \
	CONFIG.PCW_MIO_33_PULLUP {disabled} CONFIG.PCW_MIO_33_SLEW {fast} \
	CONFIG.PCW_MIO_34_PULLUP {disabled} CONFIG.PCW_MIO_34_SLEW {fast} \
	CONFIG.PCW_MIO_35_PULLUP {disabled} CONFIG.PCW_MIO_35_SLEW {fast} \
	CONFIG.PCW_MIO_36_PULLUP {disabled} CONFIG.PCW_MIO_36_SLEW {fast} \
	CONFIG.PCW_MIO_37_PULLUP {disabled} CONFIG.PCW_MIO_37_SLEW {fast} \
	CONFIG.PCW_MIO_38_PULLUP {disabled} CONFIG.PCW_MIO_38_SLEW {fast} \
	CONFIG.PCW_MIO_39_PULLUP {disabled} CONFIG.PCW_MIO_39_SLEW {fast} \
	CONFIG.PCW_MIO_40_PULLUP {disabled} CONFIG.PCW_MIO_40_SLEW {fast} \
	CONFIG.PCW_MIO_41_PULLUP {disabled} CONFIG.PCW_MIO_41_SLEW {fast} \
	CONFIG.PCW_MIO_42_PULLUP {disabled} CONFIG.PCW_MIO_42_SLEW {fast} \
	CONFIG.PCW_MIO_43_PULLUP {disabled} CONFIG.PCW_MIO_43_SLEW {fast} \
	CONFIG.PCW_MIO_44_PULLUP {disabled} CONFIG.PCW_MIO_44_SLEW {fast} \
	CONFIG.PCW_MIO_45_PULLUP {disabled} CONFIG.PCW_MIO_45_SLEW {fast} \
	CONFIG.PCW_MIO_50_PULLUP {enabled} \
	CONFIG.PCW_MIO_51_PULLUP {enabled} \
	CONFIG.PCW_MIO_52_PULLUP {enabled} \
	CONFIG.PCW_MIO_53_PULLUP {enabled} \
	CONFIG.PCW_MIO_0_DIRECTION {out} \
	CONFIG.PCW_MIO_25_DIRECTION {out} \
	CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
	CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
	CONFIG.PCW_SD0_GRP_CD_IO {MIO 24} \
	CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
	CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
	CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_UART0_UART0_IO {MIO 26 .. 27} \
	CONFIG.PCW_UART1_PERIPHERAL_ENABLE {0} \
	CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_PJTAG_PJTAG_IO {MIO 46 .. 49} \
	CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K128M16 JT-125} \
	CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.191} \
	CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.209} \
	CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.256} \
	CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.228} \
	CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.118} \
	CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.182} \
	CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.237} \
	CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
	CONFIG.PCW_USE_M_AXI_GP0 {1} \
	] $processing_system7_0

# Create instance: processing_system7_0_axi_periph, and set properties
set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
set_property -dict [ list CONFIG.NUM_MI {1}  ] $processing_system7_0_axi_periph

# Create instance: rst_processing_system7_0_100M, and set properties
set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

# Create instance: xlconstant_0, and set properties
set ip_defs [get_ipdefs -filter "NAME =~ *xlconstant*"]
foreach ip_def $ip_defs {
	if { [string first "xlconstant:" $ip_def] != -1 } {
		set xlconstant_0 [ create_bd_cell -type ip -vlnv $ip_def xlconstant_0 ]
	}
}
set_property -dict [ list CONFIG.CONST_VAL {0}  ] $xlconstant_0

# Create interface connections
connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]

# Create port connections
connect_bd_net -net Net [get_bd_ports gpio_signals] [get_bd_pins axi_gpio_0/gpio_signals]
connect_bd_net -net axi_gpio_0_div_clk_out [get_bd_ports div_clk_out] [get_bd_pins axi_gpio_0/div_clk_out]
connect_bd_net -net clk_in_1 [get_bd_ports clk_in] [get_bd_pins axi_gpio_0/clk_in]
connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_gpio_0/S_AXI_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk]
connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/S_AXI_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]
connect_bd_net -net xlconstant_0_const [get_bd_pins processing_system7_0/USB0_VBUS_PWRFAULT] [get_bd_pins xlconstant_0/const]

# Create address segments
create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/reg0] SEG_axi_gpio_0_reg0

# Save block design
save_bd_design

# Generate HDL Wrapper, import and set as top-level
make_wrapper -files [get_files ./${project_name}.srcs/sources_1/bd/${project_name}/${project_name}.bd] -top
import_files -force -norecurse ./${project_name}.srcs/sources_1/bd/${project_name}/hdl/${project_name}_wrapper.vhd
set_property top ${project_name}_wrapper [current_fileset]
