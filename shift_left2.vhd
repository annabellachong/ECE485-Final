library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- shift left 2 takes in an input of 32 bits and returns an output of 32 bits
entity shift_left2 is
	Port ( input:	in STD_LOGIC_VECTOR(31 downto 0);
	       output:  out STD_LOGIC_VECTOR(31 downto 0));
end entity shift_left2;

architecture Behavioral of shift_left2 is
begin
	output <= input (29 downto 0) & "00";
	
end architecture Behavioral;
