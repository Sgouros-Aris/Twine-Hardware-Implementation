library ieee;
use ieee.std_logic_1164.all;

entity conl is

port (input  : in integer;
      output : out std_logic_vector(2 downto 0)
);

end conl;

architecture conl_arch of conl is
begin

   output <= "001" when input = 0 else
             "010" when input = 1 else
             "100" when input = 2 else
             "000" when input = 3 else
             "000" when input = 4 else
             "000" when input = 5 else
             "011" when input = 6 else
             "110" when input = 7 else
             "100" when input = 8 else
             "000" when input = 9 else
             "000" when input = 10 else
             "011" when input = 11 else
             "101" when input = 12 else
             "010" when input = 13 else
             "100" when input = 14 else
             "000" when input = 15 else
             "011" when input = 16 else
             "110" when input = 17 else
             "111" when input = 18 else
             "110" when input = 19 else
             "100" when input = 20 else
   	     "011" when input = 21 else
   	     "101" when input = 22 else
   	     "001" when input = 23 else
   	     "001" when input = 24 else
   	     "010" when input = 25 else
   	     "111" when input = 26 else
   	     "110" when input = 27 else
   	     "100" when input = 28 else
   	     "000" when input = 29 else
   	     "011" when input = 30 else
   	     "101" when input = 31 else
   	     "001" when input = 32 else
   	     "010" when input = 33 else
   	     "100" when input = 34 else
   	     "011" when input = 35;

end conl_arch;