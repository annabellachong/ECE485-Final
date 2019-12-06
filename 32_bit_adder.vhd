library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- one bit adder, defines intputs and outputs. A, B, and sum will be 32 bits. Carryin/out remain as 1.
entity adder_32 is
	Port (	A: 		in STD_LOGIC_VECTOR(31 downto 0);    
		B:		in STD_LOGIC_VECTOR(31 downto 0);
		carryin: 	in STD_LOGIC;
		sum:		out STD_LOGIC_VECTOR(31 downto 0);
		carryout: 	out STD_LOGIC);
end adder_32;

architecture struct of adder_32 is
	-- Component instantiation list. Utilize 4-bit adders.
	component adder_4 is 
		Port (	A: 		in STD_LOGIC_VECTOR(3 downto 0);    
			B:		in STD_LOGIC_VECTOR(3 downto 0);
			carryin: 	in STD_LOGIC;
			sum:		out STD_LOGIC_VECTOR(3 downto 0);
			carryout: 	out STD_LOGIC);
end component;
-- use 7 signals b/c carryout of first 4-bit adder is the carryout of the second 4-bit adder and so on

	signal C : STD_LOGIC_VECTOR(7 downto 1);

-- Use 8, 4-bit adders to create 32-bit adder
begin
	Add_0: adder_4 port map(A(3 downto 0), B(3 downto 0), carryin, sum(3 downto 0), C(1));
	Add_1: adder_4 port map(A(7 downto 4), B(7 downto 4), C(1), sum(7 downto 4), C(2));
	Add_2: adder_4 port map(A(11 downto 8), B(11 downto 8), C(2), sum(11 downto 8), C(3));
	Add_3: adder_4 port map(A(15 downto 12), B(15 downto 12), C(3), sum(15 downto 12), C(4));	
	Add_4: adder_4 port map(A(19 downto 16), B(19 downto 16), C(4), sum(19 downto 16), C(5));
	Add_5: adder_4 port map(A(23 downto 20), B(23 downto 20), C(5), sum(23 downto 20), C(6));
	Add_6: adder_4 port map(A(27 downto 24), B(27 downto 24), C(6), sum(27 downto 24), C(7));
	Add_7: adder_4 port map(A(31 downto 28), B(31 downto 28), C(7), sum(31 downto 28), carryout);
end struct;
