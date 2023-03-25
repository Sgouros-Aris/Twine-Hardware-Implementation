library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is

   port(rst        : in std_logic;
        clk        : in std_logic;
        rw         : in std_logic;
        wr_address : in std_logic_vector(5 downto 0);
        rd_address : in std_logic_vector(5 downto 0);
        Ki         : in std_logic_vector(31 downto 0);
        round_key  : out std_logic_vector(31 downto 0)
        );

end memory;

architecture memory_arch of memory is

type type_1Dx1D is array (0 to 35) of std_logic_vector (31 downto 0);

signal temp : std_logic_vector(5 downto 0);
signal RK : type_1Dx1D;

begin

    temp <= wr_address when rw = '1' else rd_address;

    process(rst,clk)
    begin

    if rst = '1' then
        RK <= (others => (others =>'0'));

    elsif clk'event and clk = '1' then

        if rw = '1' then

             RK(to_integer(unsigned(wr_address))) <= Ki;

        else

             round_key <= RK(to_integer(unsigned(rd_address))); 
        end if;

    end if;
    end process;

end memory_arch;