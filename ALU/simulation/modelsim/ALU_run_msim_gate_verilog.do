transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {ALU.vo}

vlog -vlog01compat -work work +incdir+/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects {/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects/stimulus.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  stimulus

add wave *
view structure
view signals
run -all
