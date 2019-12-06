library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity r is
	Port (	enable: in STD_LOGIC;
		D: in STD_LOGIC_VECTOR(31 downto 0);
		Q: out STD_LOGIC_VECTOR(31 downto 0));

end r;

architecture Behavioral of r is 
begin
	Q <= D when enable = '1';

end Behavioral;