library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu32_tb is
end alu32_tb;

architecture Behavioral of alu32_tb is
	signal A_SIG: STD_LOGIC_VECTOR(31 downto 0);
	signal B_SIG: STD_LOGIC_VECTOR(31 downto 0);
	signal ALUop_SIG: STD_LOGIC_VECTOR(3 downto 0);
	signal zero_SIG: STD_LOGIC;
	signal result_SIG: STD_LOGIC_VECTOR(31 downto 0);

component alu32 is
	Port( A: in STD_LOGIC_VECTOR(31 downto 0);
	      B: in STD_LOGIC_VECTOR(31 downto 0);
	      ALUop: in STD_LOGIC_VECTOR(3 downto 0);
	      zero: out STD_LOGIC;
	      result: out STD_LOGIC_VECTOR(31 downto 0)
	);

end component;

begin alu32_INST: alu32
	port map(
		A => A_SIG,
		B => B_SIG,
		ALUop => ALUop_SIG,
		zero => zero_SIG,
		result => result_SIG);

process is
begin 
	A_SIG <= x"00001234";
	B_SIG <= x"00000004";
	ALUop_SIG <= "0010";
	wait for 10ns;
	
end process;
end Behavioral;