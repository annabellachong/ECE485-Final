library ieee; 
use ieee.std_logic_1164.all; 

entity aluControl is
	Port(	func: 		in STD_LOGIC_VECTOR(5 downto 0);
		ALUOp:		in STD_LOGIC_VECTOR(1 downto 0);
		Op:		out STD_LOGIC_VECTOR(3 downto 0));
end aluControl; 

architecture behavior of aluControl is
begin 
	Op <= "0010" when ALUOp = "10" and func = "100000" else
		"0110" when ALUOp = "10" and func = "100010" else 
		"0000" when ALUOp = "10" and func = "100100" else 
		"0001" when ALUOp = "10" and func = "100101" else
		"0000"; 
end behavior; 

