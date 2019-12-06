library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- memory entity declaration. memRead/memWrite are 1 bit control signals
entity memory is
	Port ( address:	in STD_LOGIC_VECTOR(31 downto 0);
		memWriteIn: in STD_LOGIC_VECTOR(31 downto 0);
		memRead:	in STD_LOGIC;
		memWrite:	in STD_LOGIC;
		memData:	out STD_LOGIC_VECTOR(31 downto 0));
end entity memory;


architecture behavior of memory is
type memory_type is array(0 to 511) of STD_LOGIC_VECTOR(31 downto 0);  -- 2^9 because much bigger would crash
signal memory: memory_type;
begin
-- mem write responsible for writing to desired address if signal is 1
	MEM_WRITE: process(memWrite)
	begin 	
		if(memWrite = '1') then 
			memory(conv_integer(Address)) <= memWriteIn;
		end if;
	end process;

-- mem read responsible for reading data from desired address and placing in memOut
	MEM_READ: process(memRead)
	begin 	
		if(memRead = '1') then 
			memData <= memory(conv_integer(Address));
		end if;
	end process;
	

end architecture behavior;


	
		