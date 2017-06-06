delete wave *
add wave -position end  sim:/NES_para_to_ser/clk
add wave -position end  sim:/NES_para_to_ser/latch
add wave -position end  sim:/NES_para_to_ser/data
add wave -position end  sim:/NES_para_to_ser/AIn
add wave -position end  sim:/NES_para_to_ser/BIn
add wave -position end  sim:/NES_para_to_ser/sel
add wave -position end  sim:/NES_para_to_ser/start
add wave -position end  sim:/NES_para_to_ser/up
add wave -position end  sim:/NES_para_to_ser/down
add wave -position end  sim:/NES_para_to_ser/left
add wave -position end  sim:/NES_para_to_ser/right
add wave -position end  sim:/NES_para_to_ser/reset
add wave -position end  sim:/NES_para_to_ser/data_q

force -freeze sim:/N64_reciever/clk_i 1 0, 0 {35714 ps}, -r 71429
