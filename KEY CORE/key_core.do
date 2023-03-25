force -freeze sim:/key_core/rst 1 0
force -freeze sim:/key_core/new_key 0 0
run
force -freeze sim:/key_core/rst 0 0
force -freeze sim:/key_core/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/key_core/new_key 1 0
force -freeze sim:/key_core/key 00000000000100010010001000110011010001000101010101100110011101111000100010011001 0
run
force -freeze sim:/key_core/new_key 1 0
run
