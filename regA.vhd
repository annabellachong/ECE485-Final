library ieee; 
use ieee.std_logic_1164.all; 

entity regA is 
	Port( readD1: in STD_LOGIC_VECTOR(31 downto 0);
	      outD1:  out STD_LOGIC_VECTOR(31 downto 0));

end entity regA;

architecture behavior of regA is
begin
	outD1 <= readD1;

end architecture behavior;