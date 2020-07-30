# Create project
open_project -reset opfb-fir-cfg

# Add sources files and test bench
add_files src/fir_config.cpp
add_files src/fir_config.hpp
add_files src/fir_confighelp.cpp
add_files -tb src/tb.cpp -cflags "-Wno-unknown-pragmas"

# Specify the top-level function for synthesis
set_top opfb_fir_cfg

# Create solution1
open_solution -reset "solution1"

# Specify Xilinx part, clock period, and export style
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Generate channel config stream for OPFB FIRs} -display_name "OPFB FIR Config Gen" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.2

# Simulate the C Code
csim_design

# Synethsize, verify the RTL, and produce IP
csynth_design
cosim_design -tool xsim
export_design
exit
