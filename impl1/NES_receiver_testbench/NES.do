delete wave *
add wave sim:/NES_para_to_ser/clk
add wave sim:/NES_para_to_ser/latch
add wave sim:/NES_para_to_ser/data
add wave sim:/NES_para_to_ser/AIn
add wave sim:/NES_para_to_ser/BIn
add wave sim:/NES_para_to_ser/sel
add wave sim:/NES_para_to_ser/start
add wave sim:/NES_para_to_ser/up
add wave sim:/NES_para_to_ser/down
add wave sim:/NES_para_to_ser/left
add wave sim:/NES_para_to_ser/right
add wave sim:/NES_para_to_ser/reset
add wave sim:/NES_para_to_ser/data_q

force sim:/NES_para_to_ser/AIn 1 0, 1 5000ps
force sim:/NES_para_to_ser/BIn 1 0ps
force sim:/NES_para_to_ser/sel 1 0ps
force sim:/NES_para_to_ser/start 1 0ps
force sim:/NES_para_to_ser/up 1 0ps
force sim:/NES_para_to_ser/down 1 0ps
force sim:/NES_para_to_ser/left 1 0ps
force sim:/NES_para_to_ser/right 1 0ps
force sim:/NES_para_to_ser/reset 1 0ps

force sim:/NES_para_to_ser/clk 1 0, 0 {500 ps} -r 1000ps

force sim:/NES_para_to_ser/reset 0 20ps, 1 500ps

force sim:/NES_para_to_ser/latch 1 6000ps, 0 6500ps

run 10000ps
