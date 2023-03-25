library ieee;
use ieee.std_logic_1164.all;

entity start_reg is

    port(rst       : in std_logic;
         clk       : in std_logic;
         key_ready : in std_logic;
         start     : out std_logic
        );

end start_reg;

architecture start_reg_arch of start_reg is

begin

   process(rst, clk)
   begin

       if rst = '1' then
          start <= '0';

       elsif clk'event and clk ='1' then
     
          if key_ready <= '1' then
              start <= '1';
          else
              start <= '0';
          end if;

       end if;
 
    end process;

end start_reg_arch;
