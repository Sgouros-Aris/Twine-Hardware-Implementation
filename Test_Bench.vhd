library ieee;
use ieee.std_logic_1164.all;

entity testbench is

generic(key_length : integer := 80);

end testbench;

architecture behavioral of testbench is

component twine_total is

    
    port(rst  		 : in std_logic;
         clk             : in std_logic;
         new_data        : in std_logic;
	 input_data      : in std_logic;
         data_in         : in std_logic_vector(63 downto 0);
         encr_decr       : in std_logic;
         new_key         : in std_logic;
	 input_key       : in std_logic;
         key             : in std_logic_vector(key_length - 1 downto 0);
         busy_encr       : out std_logic;
         busy_decr       : out std_logic;
         data_out        : out std_logic_vector(63 downto 0)
        );

end component;

   --INPUTS--
signal rst  : std_logic := '1';
signal clk  : std_logic := '0';
signal new_data : std_logic := '0';
signal input_data : std_logic := '1';
signal encr_decr : std_logic := '0';
signal new_key   : std_logic := '0';
signal input_key   : std_logic := '1';
signal data_in   : std_logic_vector(63 downto 0) := (others => '0');
signal key       : std_logic_vector(key_length - 1 downto 0) := (others => '0');

    --OUTPUTS--
signal data_out  : std_logic_vector(63 downto 0);
signal busy_encr : std_logic;
signal busy_decr : std_logic;

signal tb_counter : integer := 0;
constant ClockPeriod : TIME := 100 ps;


begin

    DUT: twine_total port map(rst, clk, new_data, input_data, data_in, encr_decr, new_key, input_key, key, busy_encr, busy_decr, data_out);

    clk <= not clk after ClockPeriod/2;
    --clock process
--    clock_generate : process
--                     begin
--                         wait for ClockPeriod/2;
--                         clk <= '1';
--                         wait for ClockPeriod/2;
--                         clk <= '0';
--                     end process;
--
--     count: process(clk)
--            begin
--                if rising_edge(clk) then
--                    tb_counter <= tb_counter + 1;
--                end if; 
--            end process;
--
--
     --stimulus process
     stim_proc : process
	begin
		report("Starting Sim");
		rst <= '1';  
		wait until rising_edge(clk);
		rst <= '0';
                new_data <= '1';
                data_in  <= x"0123456789ABCDEF";
                encr_decr <= '0';
                new_key  <= '1';
                key      <= x"00112233445566778899";
                wait until rising_edge(clk);
		new_key  <= '0';
		wait for 79*ClockPeriod;
		rst <='1';
		report("End Sim");
		wait;
        end process;  
 
end behavioral;
