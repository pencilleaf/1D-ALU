set projDir "C:/Users/x-cla/Documents/mojo/ALUchecked/work/planAhead"
set projName "ALUchecked"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/mojo_top_0.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/alu_1.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/alu_error_2.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/reset_conditioner_3.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/multi_seven_seg_4.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/adder_auto_5.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/boolean_auto_6.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/shifter_auto_7.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/multiplier_auto_8.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/compare_auto_9.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/adder_10.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/boolean_11.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/compare_12.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/shifter_13.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/multiplier_14.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/counter_15.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/seven_seg_16.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/decoder_17.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/stateCounter_18.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/stateCounter_18.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/stateCounter_18.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/stateCounter_18.v" "C:/Users/x-cla/Documents/mojo/ALUchecked/work/verilog/stateCounter_18.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
