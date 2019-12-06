library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- one bit adder, defines intputs and outputs. Each is 1 bit
entity adder is
	Port (	A: 		in STD_LOGIC;    
		B:		in STD_LOGIC;
		carryin: 	in STD_LOGIC;
		sum:		out STD_LOGIC;
		carryout: 	out STD_LOGIC);
end adder;

-- define what adder will do. Behavioral. Based off gate logic.
architecture Behavioral of adder is
begin
	sum <= A xor B xor carryin;

	carryout <= ((A xor B) and carryin) or (A and B);
end Behavioral;