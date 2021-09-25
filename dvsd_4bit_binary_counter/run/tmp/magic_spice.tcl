
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/balakrishna/Desktop/vsdflow/work/tools/openlane_working_dir/openlane/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/binary_counter_bala/results/routing/17-dvsd_4bit_binary_counter.def
}
load dvsd_4bit_binary_counter -dereference
cd /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/binary_counter_bala/results/magic/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
if { ! 0 } {
	extract unique
}
# extract warn all
extract

ext2spice lvs
ext2spice -o /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/binary_counter_bala/results/magic/dvsd_4bit_binary_counter.spice dvsd_4bit_binary_counter.ext
feedback save /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/binary_counter_bala/logs/magic/30-magic_ext2spice.feedback.txt
# exec cp dvsd_4bit_binary_counter.spice /openLANE_flow/designs/dvsd_4bit_binary_counter/runs/binary_counter_bala/results/magic/dvsd_4bit_binary_counter.spice

