library ieee;
use ieee.std_logic_1164.all;

entity exit_reg is

     port(rst  : in std_logic;
          clk  : in std_logic;
          data_ready : in std_logic;
          core_out   : in std_logic_vector(63 downto 0);
          data_out   : out std_logic_vector(63 downto 0)
          );

end exit_reg;

architecture exit_reg_arch of exit_reg is

begin

    process(rst, clk)
    begin
 
    if rst = '1' then

         data_out <= (others => '0');
 
     elsif clk'event and clk = '1' then

          if data_ready = '1' then

                data_out <= core_out;
          end if;
      end if;

     end process;

end exit_reg_arch;