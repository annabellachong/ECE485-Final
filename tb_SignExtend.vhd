library ieee; 
use ieee.std_logic_1164.all;

entity tb_signExt is
end tb_signExt;

architecture test of tb_SignExt is
	component signExt is 
		port(	Imm: 		in STD_LOGIC_VECTOR(15 downto 0);
			ImmExt:		out STD_LOGIC_VECTOR(31 downto 0));
	end component;
	
	for U1: signExt use entity WORK.signExt(behaviour);

	--INPUTS
	signal Imm_s: std_logic_vector(15 downto 0);
	--OUTPUT
	signal ImmExt_s: std_logic_vector(31 downto 0);

	begin
	U1: signExt port map (Imm_s, ImmExt_s);
		process
		begin
		
		-- Test Case 1 
			Imm_s <= "0001000100010001"; 
			wait for 10 ns;
		-- Test Case 2 
			Imm_s <= "1000100010001000"; 
			wait for 10 ns;

		end process;

end test; 