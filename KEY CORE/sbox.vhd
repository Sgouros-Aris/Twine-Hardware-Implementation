library ieee;
use ieee.std_logic_1164.all;

entity sbox is

port (input  : in std_logic_vector(3 downto 0);
      output : out std_logic_vector(3 downto 0)
);

end sbox;

architecture sbox_arch of sbox is
begin

   output <= "1100" when input = "0000" else --0
             "0000" when input = "0001" else --1
             "1111" when input = "0010" else--2
             "1010" when input = "0011" else --3
             "0010" when input = "0100" else --4
             "1011" when input = "0101" else --5
             "1001" when input = "0110" else --6
             "0101" when input = "0111" else --7
             "1000" when input = "1000" else --8
             "0011" when input = "1001" else --9
             "1101" when input = "1010" else --10
             "0111" when input = "1011" else --11
             "0001" when input = "1100" else --12
             "1110" when input = "1101" else --13
             "0110" when input = "1110" else --14
             "0100" when input = "1111"; --15

end sbox_arch;
