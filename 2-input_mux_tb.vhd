library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_mux_2_tb is
end input_mux_2_tb;

--- define signals which will contain desired input values. Ouput values remain empty.
architecture Behavioral of input_mux_2_tb is
	signal A_SIG	: STD_LOGIC_VECTOR(31 downto 0);
	signal B_SIG	: STD_LOGIC_VECTOR(31 downto 0);
	signal S_SIG : STD_LOGIC;
	signal Y_SIG	: STD_LOGIC_VECTOR(31 downto 0);

component input_mux_2 is
	Port (A:	in STD_LOGIC_VECTOR(31 downto 0);
	      B:	in STD_LOGIC_VECTOR(31 downto 0);	
	      S: 	in STD_LOGIC;
	      Y:	out STD_LOGIC_VECTOR(31 downto 0));

end component;

begin
mux2_INST : input_mux_2
	port map (
		A => A_SIG,
		B => B_SIG,
		S => S_SIG,
		Y => Y_SIG);

process is
begin
	A_SIG <= x"00001234";
	B_SIG <= x"00000A00";
	S_SIG <= '0';

	wait for 10ns;

	A_SIG <= x"00001234";
	B_SIG <= x"00000A00";
	S_SIG <= '1';

	wait for 10ns;

end process;

end Behavioral; 