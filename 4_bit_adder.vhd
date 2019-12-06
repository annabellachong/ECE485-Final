library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- one bit adder, defines intputs and outputs. A, B, and sum will be 4 bits. Carryin/out remain as 1 bit.
entity adder_4 is
	Port (	A: 		in STD_LOGIC_VECTOR(3 downto 0);    
		B:		in STD_LOGIC_VECTOR(3 downto 0);
		carryin: 	in STD_LOGIC;
		sum:		out STD_LOGIC_VECTOR(3 downto 0);
		carryout: 	out STD_LOGIC);
end adder_4;

architecture struct of adder_4 is
	-- Component instantiation list. Utilize 1-bit adder to design 4-bit adder.
	component adder is 
		Port( A: 		in STD_LOGIC;    
		      B:		in STD_LOGIC;
		      carryin: 	        in STD_LOGIC;
		      sum:		out STD_LOGIC;
		      carryout: 	out STD_LOGIC);
end component;
--3 signals b/c carryout of first 1-bit adder is the carryout of the second 1-bit adder and so on
	signal C1, C2, C3: STD_LOGIC;

begin
-- map hardware components. Structural Model.
	Add_0: adder port map(A(0), B(0), carryin, sum(0), C1);
	Add_1: adder port map(A(1), B(1), C1, sum(1), C2);
	Add_2: adder port map(A(2), B(2), C2, sum(2), C3);
	Add_3: adder port map(A(3), B(3), C3, sum(3), carryout);
end struct;