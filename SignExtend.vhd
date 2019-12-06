library ieee; 
use ieee.std_logic_1164.all; 

-- instantiation of 4 input MUX; S: select signal 
entity signExt is
	Port(	Imm: 		in STD_LOGIC_VECTOR(15 downto 0);
		ImmExt:		out STD_LOGIC_VECTOR(31 downto 0));
end signExt;

architecture behaviour of signExt is
begin
process(Imm)
begin
	if (Imm(15)= '0') then 
		ImmExt(31 downto 16) <= "0000000000000000";
		ImmExt(15 downto 0)<= Imm;
	else 
		ImmExt(31 downto 16) <= "1111111111111111";  
		ImmExt(15 downto 0)<= Imm;
	end if; 

end process; 
 
end behaviour; 