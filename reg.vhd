-- library declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Register File entity declaration
entity reg is
	port ( 
		clk : in std_logic;
		R1 : in std_logic_vector (4 downto 0);
		R2 : in std_logic_vector (4 downto 0);
		WriteReg : in std_logic_vector (4 downto 0);
		WriteData : in std_logic_vector (31 downto 0);
		RegWrite: in std_logic; 
		ReadData1 : out std_logic_vector (31 downto 0);
		ReadData2 : out std_logic_vector (31 downto 0)
	);
end entity reg;

--(a) Memory Behavioral Model
architecture behavior of reg is
type rf_type is array (0 to 31) of std_logic_vector (31 downto 0); -- 32*32 reg file size
signal rf: rf_type;

begin
	Write2Reg: process(RegWrite) -- Write to register
	begin
		if (RegWrite = '1') then
			rf(conv_integer(WriteReg)) <=  WriteData;
		end if;	
	end process;
	
	ReadR1: process(clk, R1) -- Read register number 1
	begin
		ReadData1 <= rf(conv_integer(R1));
	end process;
	
	ReadR2: process(clk, R2) -- Read register number 2
	begin
		ReadData2 <= rf(conv_integer(R2));
	end process;
end architecture behavior;

