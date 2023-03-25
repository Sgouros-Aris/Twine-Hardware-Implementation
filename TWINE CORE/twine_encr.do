force -freeze sim:/twine_encr/rst 1 0
run
force -freeze sim:/twine_encr/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/twine_encr/sel 0 0
force -freeze sim:/twine_encr/counter 000000 0
force -freeze sim:/twine_encr/rst 0 0
force -freeze sim:/twine_encr/data_in 0000000100100011010001010110011110001001101010111100110111101111 0
force -freeze sim:/twine_encr/round_key 00000001001000110110011101111000 0
run
force -freeze sim:/twine_encr/sel 1 0
run
force -freeze sim:/twine_encr/counter 000001 0
force -freeze sim:/twine_encr/round_key 00100011010001011000100110001100 0
run
force -freeze sim:/twine_encr/round_key 01000101011001110001000100101111 0
force -freeze sim:/twine_encr/counter 000010 0
run
force -freeze sim:/twine_encr/round_key 01100111100010010011001111101111 0
force -freeze sim:/twine_encr/counter 000011 0
run
force -freeze sim:/twine_encr/round_key 10001001110000010101010101011001 0
force -freeze sim:/twine_encr/counter 000100 0
run
force -freeze sim:/twine_encr/round_key 00010000111100110111011100101001 0
force -freeze sim:/twine_encr/counter 000101 0
run
force -freeze sim:/twine_encr/round_key 00111010111101011001100111000101 0
force -freeze sim:/twine_encr/counter 000110 0
run
force -freeze sim:/twine_encr/round_key 01010101100101110001000011000010 0
force -freeze sim:/twine_encr/counter 000111 0
run
force -freeze sim:/twine_encr/round_key 01110010100110010011101010100111 0
force -freeze sim:/twine_encr/counter 001000 0
run
force -freeze sim:/twine_encr/round_key 10011101010100000101010100001110 0
force -freeze sim:/twine_encr/counter 001001 0
run
force -freeze sim:/twine_encr/round_key 00011111001010100111001001101000 0
force -freeze sim:/twine_encr/counter 001010 0
run
force -freeze sim:/twine_encr/round_key 00111100011101011001110111001011 0
force -freeze sim:/twine_encr/counter 001011 0
run
force -freeze sim:/twine_encr/round_key 01010100111000100000111100001110 0
force -freeze sim:/twine_encr/counter 001100 0
run
force -freeze sim:/twine_encr/round_key 01110110100011011010110011111001 0
force -freeze sim:/twine_encr/counter 001101 0
run
force -freeze sim:/twine_encr/round_key 10011101101111110101010000101111 0
force -freeze sim:/twine_encr/counter 001110 0
run
force -freeze sim:/twine_encr/round_key 00000010111011000010011011001110 0
force -freeze sim:/twine_encr/counter 001111 0
run
force -freeze sim:/twine_encr/round_key 10101010100101001101110110110100 0
force -freeze sim:/twine_encr/counter 010000 0
run
force -freeze sim:/twine_encr/round_key 01010000111101101111001011000010 0
force -freeze sim:/twine_encr/counter 010001 0
run
force -freeze sim:/twine_encr/round_key 00101000111011011100101011100010 0
force -freeze sim:/twine_encr/counter 010010 0
run
force -freeze sim:/twine_encr/round_key 11011010010000100100000011001110 0
force -freeze sim:/twine_encr/counter 010011 0
run
force -freeze sim:/twine_encr/round_key 11111111001010100110100001101101 0
force -freeze sim:/twine_encr/counter 010100 0
run
force -freeze sim:/twine_encr/round_key 11001001001000001101101001010000 0
force -freeze sim:/twine_encr/counter 010101 0
run
force -freeze sim:/twine_encr/round_key 01001011111010000010111100011101 0
force -freeze sim:/twine_encr/counter 010110 0
run
force -freeze sim:/twine_encr/round_key 01100000110110101010100110010010 0
force -freeze sim:/twine_encr/counter 010111 0
run
force -freeze sim:/twine_encr/round_key 11010000000011110000101111111010 0
force -freeze sim:/twine_encr/counter 011000 0
run
force -freeze sim:/twine_encr/round_key 00100011110110011000000000010010 0
force -freeze sim:/twine_encr/counter 011001 0
run
force -freeze sim:/twine_encr/round_key 10101101001010111010000000001100 0
force -freeze sim:/twine_encr/counter 011010 0
run
force -freeze sim:/twine_encr/round_key 00001111101000001111001110100101 0
force -freeze sim:/twine_encr/counter 011011 0
run
force -freeze sim:/twine_encr/round_key 10000000001000001001110101001010 0
force -freeze sim:/twine_encr/counter 011100 0
run
force -freeze sim:/twine_encr/round_key 10100011110000111011111101111000 0
force -freeze sim:/twine_encr/counter 011101 0
run
force -freeze sim:/twine_encr/round_key 11111101010111010000000000011110 0
force -freeze sim:/twine_encr/counter 011110 0
run
force -freeze sim:/twine_encr/round_key 10010010101011110000001111001101 0
force -freeze sim:/twine_encr/counter 011111 0
run
force -freeze sim:/twine_encr/round_key 10110011100000000011110100010011 0
force -freeze sim:/twine_encr/counter 100000 0
run
force -freeze sim:/twine_encr/round_key 00000000111000111101001000101001 0
force -freeze sim:/twine_encr/counter 100001 0
run
force -freeze sim:/twine_encr/round_key 00001110110111011111001101101111 0
force -freeze sim:/twine_encr/counter 100010 0
run
force -freeze sim:/twine_encr/round_key 00110101001100100000000001101110 0
force -freeze sim:/twine_encr/counter 100011 0
run




