library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory_tb is 
end memory_tb;

--- define signals which will contain desired input values. Output remains empty
architecture Behavioral of memory_tb is
	signal address_SIG:	 STD_LOGIC_VECTOR(31 downto 0);
	signal mIn_SIG:  STD_LOGIC_VECTOR(31 downto 0);
	signal mRead_SIG:	 STD_LOGIC;
	signal mWrite_SIG:	 STD_LOGIC;
	signal mData_SIG:	 STD_LOGIC_VECTOR(31 downto 0);

component memory is
	Port (  address:	in STD_LOGIC_VECTOR(31 downto 0);
		memWriteIn: in STD_LOGIC_VECTOR(31 downto 0);
		memRead:	in STD_LOGIC;
		memWrite:	in STD_LOGIC;
		memData:	out STD_LOGIC_VECTOR(31 downto 0));
end component;

begin
mem_INST: memory
	port map (
		address => address_SIG,
		memWriteIn => mIn_SIG,
		memRead => mRead_SIG,
		memWrite => mWrite_SIG,
		memData => mData_SIG);
process is
begin
		-- read to confirm that nothing is in address
		address_SIG <= x"00000008";
		mIn_SIG <= x"12345678";
		mRead_SIG <= '1';
		mWrite_SIG <= '0';
		
		wait for 10ns;

		-- write into address
		address_SIG <= x"00000008";
		mIn_SIG <= x"12345678";
		mRead_SIG <= '0';
		mWrite_SIG <= '1';

		wait for 10ns;
		
		-- read into address to confirm writing worked in next 10 ns

end process;
end Behavioral;
		