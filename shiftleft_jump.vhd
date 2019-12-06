library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- shift left 2 takes in an input of 32 bits and returns an output of 32 bits
entity shiftleft_j is
	Port ( input:	in STD_LOGIC_VECTOR(25 downto 0);
	       output:  out STD_LOGIC_VECTOR(27 downto 0));
end entity shiftleft_j;

architecture Behavioral of shiftleft_j is
begin
	output <= input (25 downto 0) & "00";
	
end architecture Behavioral;
