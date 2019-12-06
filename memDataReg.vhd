library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration. memData is the input from memory component. In/out is 32 bits.
entity memDataReg is
	Port ( memData:	in STD_LOGIC_VECTOR(31 downto 0);
		memDataOut: out STD_LOGIC_VECTOR(31 downto 0));

end entity memDataReg;

-- input becomes the output
architecture behavior of memDataReg is
begin
	memDataOut <= memData;

end architecture behavior;