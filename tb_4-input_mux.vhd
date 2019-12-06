library ieee; 
use ieee.std_logic_1164.all;

entity tb_4input_mux is
end tb_4input_mux;

architecture test of tb_4input_mux is
	component input_mux_4 is 
		port( A,B,C,D: 	in STD_LOGIC_VECTOR(31 downto 0);
		S:		in STD_LOGIC_VECTOR(1 downto 0);
		Y:		out STD_LOGIC_VECTOR(31 downto 0));  
	 end component;
	
	for U1: input_mux_4 use entity WORK.input_mux_4(behaviour);

	--INPUTS
	signal A_s, B_s, C_s, D_s: std_logic_vector(31 downto 0);
	signal S_s: std_logic_vector(1 downto 0); 
	--OUTPUT
	signal Y_s: std_logic_vector(31 downto 0);

	begin

	U1: input_mux_4 port map (A_s, B_s, C_s, D_s, S_s, Y_s);
		process
		begin

		A_s <= "00000000000000000000000000000000"; 
		B_s <= "00010001000100010001000100010001";
		C_s <= "00110011001100110011001100110011";
		D_s <= "01110111011101110111011101110111";

		-- Test Case 1 
			S_s <= "00"; 
			wait for 10 ns;

		-- Test Case 2 
			S_s <= "01"; 
			wait for 10 ns;

		-- Test Case 3 
			S_s <= "10"; 
			wait for 10 ns;

		-- Test Case 4 
			S_s <= "11"; 
			wait for 10 ns;

		end process; 
end test; 