library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memDataReg_tb is
end memDataReg_tb;

--- define signals which will contain desired input values. Output remains empty
architecture Behavioral of memDataReg_tb is
	signal memData_SIG:	STD_LOGIC_VECTOR(31 downto 0);
	signal memDataOut_SIG:	STD_LOGIC_VECTOR(31 downto 0);

component memDataReg is 
	Port ( memData:	in STD_LOGIC_VECTOR(31 downto 0);
		memDataOut: out STD_LOGIC_VECTOR(31 downto 0));
end component;

begin memDataReg_INST: memDataReg
	port map (
		memData => memData_SIG,
		memDataOut => memDataOut_SIG);

process is
begin 
	memData_SIG <= x"00001234";
	wait for 10ns;
	
	memData_SIG <= x"0000A000";
	wait for 10ns;

end process;
end Behavioral; 
	