library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--- A and B are the inputs to the mux. Y is the output. S is the select bit
entity input_mux_2 is 
	Port(	A: 	in STD_LOGIC_VECTOR(31 downto 0);
		B:	in STD_LOGIC_VECTOR(31 downto 0);
		S:	in STD_LOGIC;
		Y:	out STD_LOGIC_VECTOR(31 downto 0));
end input_mux_2;


--- If S == 0, select A. Else, select B
architecture Behavioral of input_mux_2 is
begin

	Y <= A when S = '0' else B;

end Behavioral;
