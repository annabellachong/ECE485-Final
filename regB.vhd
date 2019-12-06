library ieee; 
use ieee.std_logic_1164.all; 

entity regB is 
	Port( readD2: in STD_LOGIC_VECTOR(31 downto 0);
	      outD2:  out STD_LOGIC_VECTOR(31 downto 0));

end entity regB;

architecture behavior of regB is
begin
	outD2 <= readD2;
	
end architecture behavior;
