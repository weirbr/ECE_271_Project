delete wave *
add wave -position end  sim:/controller_SM/b_board_in
add wave -position end  sim:/controller_SM/N64_in
add wave -position end  sim:/controller_SM/remote_in
add wave -position end  sim:/controller_SM/NES1
add wave -position end  sim:/controller_SM/NES0
add wave -position end  sim:/controller_SM/SNES1
add wave -position end  sim:/controller_SM/SNES0
add wave -position end  sim:/controller_SM/select_in
add wave -position end  sim:/controller_SM/reset_in

force sim:/controller_SM/b_board_in 110110110110 0ps
force sim:/controller_SM/N64_in 110110110110 0ps
force sim:/controller_SM/remote_in 110110110110 0ps
force sim:/controller_SM/select_in 0000 0ps

run 10000ps
