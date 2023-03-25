library ieee;
use ieee.std_logic_1164.all;


entity twine_core is
  
   port (rst             : in std_logic;
         clk             : in std_logic;
         new_data        : in std_logic;
         data_in         : in std_logic_vector(63 downto 0);
         round_key       : in std_logic_vector(31 downto 0);
         start           : in std_logic;
         encr_decr       : in std_logic;
         busy_encr       : out std_logic;
         busy_decr       : out std_logic;
         rd_address      : out std_logic_vector(5 downto 0);
         data_ready      : out std_logic;
         core_out        : out std_logic_vector(63 downto 0)
         );
end twine_core;

architecture twine_core_arch of twine_core is

component round_control
port(        rst        : in std_logic;
	     clk        : in std_logic;
	     new_data   : in std_logic;
             start      : in std_logic;
             encr_decr  : in std_logic;
             busy_encr  : out std_logic;
             busy_decr  : out std_logic;
	     data_ready : out std_logic;
	     sel        : out std_logic;
	     counter    : out std_logic_vector(5 downto 0);
             rd_address : out std_logic_vector(5 downto 0)
             );
end component;

component twine_encr
port(     rst       : in std_logic;
          clk       : in std_logic;
          sel       : in std_logic;
          counter   : in std_logic_vector(5 downto 0);
          data_in   : in std_logic_vector(63 downto 0);
          encr_decr : in std_logic;
          round_key : in std_logic_vector(31 downto 0);
          core_out  : out std_logic_vector(63 downto 0)
         );
end component;

signal temp1 : std_logic;
signal temp2 : std_logic_vector(5 downto 0);

begin

  U1: round_control port map (rst, clk, new_data, start, encr_decr, busy_encr, busy_decr, data_ready, temp1, temp2, rd_address);
  U2: twine_encr    port map (rst, clk, temp1, temp2, data_in, encr_decr, round_key, core_out);

end twine_core_arch;