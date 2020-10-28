transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects/Backup/ALU {/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects/Backup/ALU/ALU.v}

vlog -vlog01compat -work work +incdir+/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects/Backup/ALU {/home/omkar/VJTI/VLSI/Verilog-projects/Quartus-2-projects/Backup/ALU/stimulus.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  stimulus

add wave *
view structure
view signals
run -all
