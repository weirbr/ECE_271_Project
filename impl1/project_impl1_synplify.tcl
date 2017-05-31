#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_7000HE
set_option -package TG144C
set_option -speed_grade -5

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false
set_option -frequency 1
set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
set_option -include_path {C:/Users/Connor/Documents/ECE_271_Project}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/NES_parallel_to_serial.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Decode_SNES.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Shift_register_SNEs.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Big_boy.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Controller_SM.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Button_board_reciever.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/N64_reciever.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/Remote_reciever.sv}
add_file -verilog {C:/Users/Connor/Documents/ECE_271_Project/impl1/sources/N64_serial_to_parallel.sv}


#-- set result format/file last
project -result_file {C:/Users/Connor/Documents/ECE_271_Project/impl1/project_impl1.edi}

#-- error message log file
project -log_file {project_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run
