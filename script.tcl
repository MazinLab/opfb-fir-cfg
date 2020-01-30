open_project opfb-fir-cfg
set_top opfb_fir_cfg
add_files src/fir_config.cpp
add_files src/fir_config.hpp
add_files src/fir_confighelp.cpp
add_files -tb src/tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Generate channel config stream for OPFB FIRs} -display_name "OPFB FIR Config Gen" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.1
csim_design
#csynth_design
#cosim_design -tool xsim

