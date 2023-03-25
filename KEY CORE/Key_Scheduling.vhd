library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity key_scheduling is

	generic(key_length : integer := 80);
	port(rst        : in std_logic;
             clk        : in std_logic;
	     sel        : in std_logic;
             counter    : in std_logic_vector(5 downto 0);
	     key        : in std_logic_vector(key_length - 1 downto 0);
	     Ki         : out std_logic_vector(31 downto 0)
	);
end key_scheduling;

architecture key_scheduling_arch of key_scheduling is 

--COMPONENT INSTANTIATION--
component sbox
port (input  : in std_logic_vector(3 downto 0);
     output : out std_logic_vector(3 downto 0)
     );
end component;

component conh
port (input  : in integer;
      output : out std_logic_vector(2 downto 0)
);
end component;

component conl
port (input  : in integer;
      output : out std_logic_vector(2 downto 0)
);

end component;


--TYPES--
type type1_1Dx1D is array (0 to 19) of std_logic_vector (3 downto 0);

--SIGNALS--              
signal WK, WK_next                : type1_1Dx1D;
signal k0, k16                    : std_logic_vector(3 downto 0);
signal constantH, constantL       : std_logic_vector(2 downto 0) := "000";
signal temp0, temp1, temp2, temp3 : std_logic_vector(3 downto 0) := "0000";
signal ex0, ex1, ex2, ex3         : std_logic_vector(3 downto 0) := "0000";
signal cnt                        : integer := 0;

begin

            cnt <= to_integer(unsigned(counter));

            U1: sbox port map(WK(0), k0);
            U2: sbox port map(WK(16), k16);
            U3: conh  port map (cnt, constantH);
            U4: conl  port map (cnt, constantL);

	    ex0 <= WK(1) xor k0;
            ex1 <= WK(4) xor k16; 
            ex2 <= WK(7) xor ('0'& constantH);
            ex3 <= WK(19) xor ('0'& constantL);

            temp0 <= WK(0);
            temp1 <= ex0;
            temp2 <= WK(2);
            temp3 <= WK(3);

	    WK_next(0)  <= ex1;
	    WK_next(1)  <= WK(5);
            WK_next(2)  <= WK(6);
	    WK_next(3)  <= ex2;
	    WK_next(4)  <= WK(8);
	    WK_next(5)  <= WK(9);
	    WK_next(6)  <= WK(10);
	    WK_next(7)  <= WK(11);
	    WK_next(8)  <= WK(12);
	    WK_next(9)  <= WK(13);
	    WK_next(10) <= WK(14);
	    WK_next(11) <= WK(15);
	    WK_next(12) <= WK(16);
	    WK_next(13) <= WK(17);
	    WK_next(14) <= WK(18);
	    WK_next(15) <= ex3;
	    WK_next(16) <= temp1;
            WK_next(17) <= temp2;
            WK_next(18) <= temp3;
            WK_next(19) <= temp0;

	  
   process(rst, clk)
   begin
   
   if rst = '1' then
      WK        <= (others => (others => '0'));
      Ki        <= (others => '0');
  
   elsif clk'event and clk = '1' then

       if sel = '0' then
  
            WK(0)  <= key(79 downto 76);                 
	    WK(1)  <= key(75 downto 72);                       
            WK(2)  <= key(71 downto 68);                            
	    WK(3)  <= key(67 downto 64);
	    WK(4)  <= key(63 downto 60);                      
	    WK(5)  <= key(59 downto 56);                       
	    WK(6)  <= key(55 downto 52);                   
	    WK(7)  <= key(51 downto 48);                 
	    WK(8)  <= key(47 downto 44);                          
	    WK(9)  <= key(43 downto 40);                    
	    WK(10) <= key(39 downto 36);                    
	    WK(11) <= key(35 downto 32);
	    WK(12) <= key(31 downto 28);
	    WK(13) <= key(27 downto 24);
	    WK(14) <= key(23 downto 20);
	    WK(15) <= key(19 downto 16);
	    WK(16) <= key(15 downto 12);
            WK(17) <= key(11 downto 8);
            WK(18) <= key(7 downto 4);
            WK(19) <= key(3 downto 0);

	    Ki(31 downto 28) <= key(75 downto 72);
	    Ki(27 downto 24) <= key(67 downto 64);
	    Ki(23 downto 20) <= key(63 downto 60);
	    Ki(19 downto 16) <= key(55 downto 52);
	    Ki(15 downto 12) <= key(27 downto 24);
	    Ki(11 downto 8)  <= key(23 downto 20);
	    Ki(7 downto 4)   <= key(19 downto 16);
	    Ki(3 downto 0)   <= key(15 downto 12);
     
       elsif sel = '1' then

	    WK(0)  <= WK_next(0);
	    WK(1)  <= WK_next(1);
            WK(2)  <= WK_next(2);
	    WK(3)  <= WK_next(3);
	    WK(4)  <= WK_next(4);
	    WK(5)  <= WK_next(5);
	    WK(6)  <= WK_next(6);
	    WK(7)  <= WK_next(7);
	    WK(8)  <= WK_next(8);
	    WK(9)  <= WK_next(9);
	    WK(10) <= WK_next(10);
	    WK(11) <= WK_next(11);
	    WK(12) <= WK_next(12);
	    WK(13) <= WK_next(13);
	    WK(14) <= WK_next(14);
	    WK(15) <= WK_next(15);
	    WK(16) <= WK_next(16);
            WK(17) <= WK_next(17);
            WK(18) <= WK_next(18);
            WK(19) <= WK_next(19);

	    Ki(31 downto 28) <= WK_next(1);
	    Ki(27 downto 24) <= WK_next(3);
	    Ki(23 downto 20) <= WK_next(4);
	    Ki(19 downto 16) <= WK_next(6);
	    Ki(15 downto 12) <= WK_next(13);
	    Ki(11 downto 8)  <= WK_next(14);
	    Ki(7 downto 4)   <= WK_next(15);
	    Ki(3 downto 0)   <= WK_next(16);
 
           
        end if;
   end if;
      
   end process;

end key_scheduling_arch;