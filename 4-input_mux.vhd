library ieee; 
use ieee.std_logic_1164.all; 

-- instantiation of 4 input MUX; S: select signal 
entity input_mux_4 is
	Port(	A,B,C,D: 	in STD_LOGIC_VECTOR(31 downto 0);
		S:		in STD_LOGIC_VECTOR(1 downto 0);
		Y:		out STD_LOGIC_VECTOR(31 downto 0));
end input_mux_4; 

--- If S == 00, select A else S= 01 select B, S= 10 Select C; S=11 Select D
architecture behaviour of input_mux_4 is
begin
	Y <= A when S = "00" else 
	     B when S = "01" else 
	     C when S = "10" else 
	     D; 
 
end behaviour; 