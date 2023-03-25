library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity key_control is

	port(rst       : in std_logic;
	     clk       : in std_logic;
	     new_key   : in std_logic;
	     key_ready : out std_logic;
	     sel       : out std_logic;
	     counter   : out std_logic_vector(5 downto 0);
             rw        : out std_logic;
             wr_address: out std_logic_vector(5 downto 0)
             );
end key_control;

architecture key_control_arch of key_control is

type state_type is (S0, S1, S2, S3, S4);
signal state        : state_type;
signal temp         : integer := 0;
signal temp_address : integer  := 0;


begin

--clocked process
p1: process (clk, rst)
   begin
      if rst = '1' then
         state <= S0;
      elsif clk'event and clk = '1' then
         case state is
            when S0 => if new_key = '0' then
                          state <= S0;
                       else 
                          state <= S1;
                       end if;
            when S1 => state <= S2;
	    when S2 => if temp < 35 then
                          state <= S3;
                       else
                          state <= S4;
                       end if;
	    when S3 => if temp < 35 then
                          state <= S2;
                       else
                          state <= S4;
                       end if;
            when S4 => state <= S0;
         end case;
      end if;
end process;

--combinational process
p2 : process(state)
   begin
      case state is
         when S0 => rw <= '0'; 
                    key_ready <= '0';
		    sel <= '0';
                    temp_address <= 0;
		    temp <= 0;
         when S1 => rw <= '1'; 
                    key_ready <= '0';
		    sel <= '0';
                    temp_address <= 0;
		    temp <= 0;
	 when S2 => rw <= '1'; 
                    key_ready <= '0';
	      	    sel <= '1';
                    temp_address <= temp_address + 1;
		    temp <= temp + 1;
	 when S3 => rw <= '1'; 
                    key_ready <= '0';
	      	    sel <= '1';
                    temp_address <= temp_address + 1;
		    temp <= temp + 1;
         when S4 => rw <= '1'; 
                    key_ready <= '1';
	      	    sel <= '1';
                    temp_address <= 35;
		    temp <= 35;
     end case;
     wr_address <= std_logic_vector(to_unsigned(temp_address, 6));
     counter    <= std_logic_vector(to_unsigned(temp, 6));

end process;
end key_control_arch;