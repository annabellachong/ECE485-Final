library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_left2_tb is
end shift_left2_tb;

architecture Behavioral of shift_left2_tb is
	signal input_SIG	: STD_LOGIC_VECTOR(31 downto 0);
	signal output_SIG	: STD_LOGIC_VECTOR(31 downto 0);

component shift_left2 is
	Port ( input:	in STD_LOGIC_VECTOR(31 downto 0);
	       output:  out STD_LOGIC_VECTOR(31 downto 0));
end component;

begin sl2_INST: shift_left2
	port map (
		input => input_SIG,
		output => output_SIG);

process is
begin
	input_SIG <= x"00001234";

	wait for 10ns;

	input_SIG <= x"ABCD0000";

	wait for 10ns;

end process;
end Behavioral;