library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity round_control is

	port(rst       : in std_logic;
	     clk       : in std_logic;
	     new_data  : in std_logic;
             start     : in std_logic;
             encr_decr : in std_logic;
             busy_encr : out std_logic;
             busy_decr : out std_logic;
	     data_ready : out std_logic;
	     sel       : out std_logic;
	     counter   : out std_logic_vector(5 downto 0);
             rd_address: out std_logic_vector(5 downto 0)
             );
end round_control;

architecture round_control_arch of round_control is

type state_type is (S0, S1, S2, S3, S4, S5, S56, S6, S7, S8, S9, S10, S11, S116);
signal state        : state_type;
signal temp         : integer  := 0;
signal temp_address : integer  := 0;


begin

--clocked process
p1: process (clk, rst)
   begin
      if rst = '1' then
         state <= S0;
      elsif clk'event and clk = '1' then
         case state is
              --INITIALIZATION--
            when S0 => if new_data = '0' then
                          state <= S0;
                       elsif start = '0' then
                          state <= S0;
                       else 
                          if encr_decr = '0' then
                              state <= S1;
                          elsif encr_decr = '1' then 
                              state <= S7;
                          end if;
                       end if;
               --ENCRYPTION--
            when S1 => state <= S2;
            when S2 => state <= S3;
	    when S3 => if temp < 35 then
                          state <= S4;
                       else
                          state <= S5;
                       end if;
	    when S4 => if temp < 35 then
                          state <= S3;
                       else
                          state <= S5;
                       end if;
            when S5 => state <= S56;
	    when S56 => state <=S6;
            when S6 => state <= S0;
                 --DECRYPTION--
            when S7 => state <= S8;
            when S8 => state <= S9;
	    when S9 => if temp > 0 then
                          state <= S10;
                       else
                          state <= S11;
                       end if;
	    when S10 => if temp > 0 then
                          state <= S9;
                       else
                          state <= S11;
                       end if;
            when S11 => state <= S116;
	    when S116 => state <= S6;
 
         end case;
      end if;
end process;


--combinational process
p2 : process(state)
   begin
      case state is
         when S0 => sel <= '0'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '0';
		    temp <= 0;
                    temp_address <= 0;
         when S1 => sel <= '0'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= 0;
                    temp_address <= 0;
	 when S2 => sel <= '0'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= 1;
                    temp_address <= 1;
	 when S3 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= temp + 1;
                    temp_address <= temp_address + 1;
         when S4 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= temp + 1;
                    temp_address <= temp_address + 1;
         when S5 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= 35;
                    temp_address <= 35;
	 when S56 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '1';
                    busy_decr <= '0';
		    temp <= 35;
                    temp_address <= 35;
         when S6 => sel <= '0'; 
                    data_ready <= '1';
		    busy_encr <= '0';
                    busy_decr <= '0';
		    temp <= 0;
                    temp_address <= 0;
         when S7 => sel <= '0'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= 35;
                    temp_address <= 35;
         when S8 => sel <= '0'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= 34;
                    temp_address <= 34;
         when S9 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= temp - 1;
                    temp_address <= temp_address - 1;
        when S10 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= temp - 1;
                    temp_address <= temp_address - 1;
        when S11 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= 0;
                    temp_address <= 0;
	when S116 => sel <= '1'; 
                    data_ready <= '0';
		    busy_encr <= '0';
                    busy_decr <= '1';
		    temp <= 0;
                    temp_address <= 0;
     end case;
     rd_address <= std_logic_vector(to_unsigned(temp_address, 6));
     counter    <= std_logic_vector(to_unsigned(temp, 6));

end process;
end round_control_arch;
