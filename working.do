force -freeze sim:/twine_total/rst 1 0
run
force -freeze sim:/twine_total/rst 0 0
force -freeze sim:/twine_total/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/twine_total/new_data 1 0
force -freeze sim:/twine_total/data_in 0000000100100011010001010110011110001001101010111100110111101111 0
force -freeze sim:/twine_total/encr_decr 0 0
force -freeze sim:/twine_total/new_key 1 0
force -freeze sim:/twine_total/key 00000000000100010010001000110011010001000101010101100110011101111000100010011001 0
run
force -freeze sim:/twine_total/new_key 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
