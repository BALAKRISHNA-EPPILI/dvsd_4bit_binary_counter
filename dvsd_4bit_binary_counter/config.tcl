# User config
set ::env(DESIGN_NAME) dvsd_4bit_binary_counter

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Fill this
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clk"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}
set ::env(FP_CORE_UTIL) "10"
set ::env(PL_TARGET_DENSITY) "0.7"
set ::env(PL_RANDOM_GLB_PLACMENT) "1"
