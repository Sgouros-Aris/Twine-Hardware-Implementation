library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity key_scheduling128 is

	generic(key_length : integer := 128);
	port(rst        : in std_logic;
             clk        : in std_logic;
	     sel        : in std_logic;
             counter    : in std_logic_vector(5 downto 0);
	     key        : in std_logic_vector(key_length - 1 downto 0);
	     Ki         : out std_logic_vector(31 downto 0)
	);
end key_scheduling128;

architecture key_scheduling128_arch of key_scheduling128 is 

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
type type1_1Dx1D is array (0 to key_length/4 - 1) of std_logic_vector (3 downto 0);

--SIGNALS--              
signal WK, WK_next                : type1_1Dx1D;
signal k0, k16, k30               : std_logic_vector(3 downto 0);
signal constantH, constantL       : std_logic_vector(2 downto 0) := "000";
signal temp0, temp1, temp2, temp3 : std_logic_vector(3 downto 0) := "0000";
signal ex0, ex1, ex2, ex3, ex4    : std_logic_vector(3 downto 0) := "0000";
signal cnt                        : integer := 0;

begin

            cnt <= to_integer(unsigned(counter));

            U1: sbox port map(WK(0), k0);
            U2: sbox port map(WK(16), k16);
            U3: sbox port map(WK(30), k30);
            U4: conh  port map (cnt, constantH);
            U5: conl  port map (cnt, constantL);

	    ex0 <= WK(1) xor k0;
            ex1 <= WK(4) xor k16; 
            ex2 <= WK(23) xor k30;
            ex3 <= WK(7) xor ('0'& constantH);
            ex4 <= WK(19) xor ('0'& constantL);

            temp0 <= WK(0);
            temp1 <= ex0;
            temp2 <= WK(2);
            temp3 <= WK(3);

	    WK_next(0)  <= ex1;
	    WK_next(1)  <= WK(5);
            WK_next(2)  <= WK(6);
	    WK_next(3)  <= ex3;
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
	    WK_next(15) <= ex4;
            WK_next(16) <= WK(20);
            WK_next(17) <= WK(21);
            WK_next(18) <= WK(22);
            WK_next(19) <= ex2;
            WK_next(20) <= WK(24);
            WK_next(21) <= WK(25);
            WK_next(22) <= WK(26);
            WK_next(23) <= WK(27);
            WK_next(24) <= WK(28);
            WK_next(25) <= WK(29);
            WK_next(26) <= WK(30);
            WK_next(27) <= WK(31);	 
	    WK_next(28) <= temp1;
            WK_next(29) <= temp2;
            WK_next(30) <= temp3;
            WK_next(31) <= temp0;

	  
  process(rst, clk)
   begin
   
   if rst = '1' then
      WK        <= (others => (others => '0'));
      Ki        <= (others => '0');
  
   elsif clk'event and clk = '1' then

       if sel = '0' then
  
            WK(0)  <= key(127 downto 124);                 
	    WK(1)  <= key(123 downto 120);                       
            WK(2)  <= key(119 downto 116);                            
	    WK(3)  <= key(115 downto 112);
	    WK(4)  <= key(111 downto 108);                      
	    WK(5)  <= key(107 downto 104);                       
	    WK(6)  <= key(103 downto 100);                   
	    WK(7)  <= key(99 downto 96);                
	    WK(8)  <= key(95 downto 92);                         
	    WK(9)  <= key(91 downto 88);                    
	    WK(10) <= key(87 downto 84);                    
	    WK(11) <= key(83 downto 80);
	    WK(12) <= key(79 downto 76);
	    WK(13) <= key(75 downto 72);
	    WK(14) <= key(71 downto 68);
	    WK(15) <= key(67 downto 64);
	    WK(16) <= key(63 downto 60);
            WK(17) <= key(59 downto 56);
            WK(18) <= key(55 downto 52);
            WK(19) <= key(51 downto 48);
            WK(20) <= key(47 downto 44);
	    WK(21) <= key(43 downto 40);        
            WK(22) <= key(39 downto 36);
            WK(23) <= key(35 downto 32);
            WK(24) <= key(31 downto 28);
            WK(25) <= key(27 downto 24);
            WK(26) <= key(23 downto 20);
            WK(27) <= key(19 downto 16);
            WK(28) <= key(15 downto 12);
            WK(29) <= key(11 downto 8);
            WK(30) <= key(7 downto 4);
            WK(31) <= key(3 downto 0);


	    Ki(31 downto 28) <= key(119 downto 116);
	    Ki(27 downto 24) <= key(115 downto 112);
	    Ki(23 downto 20) <= key(79 downto 76);
	    Ki(19 downto 16) <= key(67 downto 64);
	    Ki(15 downto 12) <= key(59 downto 56);
	    Ki(11 downto 8)  <= key(55 downto 52);
	    Ki(7 downto 4)   <= key(15 downto 12);
	    Ki(3 downto 0)   <= key(3 downto 0);
     
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
	    WK(20) <= WK_next(20);
            WK(21) <= WK_next(21);
            WK(22) <= WK_next(22);
            WK(23) <= WK_next(23);
            WK(24) <= WK_next(24);
            WK(25) <= WK_next(25);
            WK(26) <= WK_next(26);
            WK(27) <= WK_next(27);
            WK(28) <= WK_next(28);
            WK(29) <= WK_next(29);
            WK(30) <= WK_next(30);
            WK(31) <= WK_next(31);

	    Ki(31 downto 28) <= WK_next(2);
	    Ki(27 downto 24) <= WK_next(3);
	    Ki(23 downto 20) <= WK_next(12);
	    Ki(19 downto 16) <= WK_next(15);
	    Ki(15 downto 12) <= WK_next(17);
	    Ki(11 downto 8)  <= WK_next(18);
	    Ki(7 downto 4)   <= WK_next(28);
	    Ki(3 downto 0)   <= WK_next(31);
           
        end if;
   end if;
      
   end process;

end key_scheduling128_arch;