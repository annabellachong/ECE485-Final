library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity instrRegister is 	
	Port(
-- figure out how to integrate clk 
		MemData:	in STD_LOGIC_VECTOR(31 downto 0);
		IRWrite:	in STD_LOGIC;
		OpCode:         out STD_LOGIC_VECTOR(5 downto 0);
		Func:	out STD_LOGIC_VECTOR(5 downto 0); 
		Rs:	out STD_LOGIC_VECTOR(4 downto 0);
		Rt:	out STD_LOGIC_VECTOR(4 downto 0);
		 Rd:	out STD_LOGIC_VECTOR(4 downto 0);
		Imm:		out STD_LOGIC_VECTOR(15 downto 0);
		JumpAddr:	out STD_LOGIC_VECTOR(25 downto 0));
					
end instrRegister; 

architecture behaviour of instrRegister is
--signal tmp_out1,tmp_out6: std_logic_vector(5 downto 0); --opcode, func
--signal tmp_out2, tmp_out3, tmp_out4: std_logic_vector(4 downto 0); -- RS, RD, RT
--signal tmp_out5: std_logic_vector(15 downto 0); -- Imm
--signal tmp_out7: std_logic_vector(25 downto 0); -- jump 

begin
--	OpCode <= tmp_out1; 
--	Rs <= tmp_out2;
--	Rt <= tmp_out3;
--	Rd <= tmp_out4;
--	Imm <= tmp_out5;
--	Func <= tmp_out6;
--	JumpAddr <= tmp_out7;
	
	process(Memdata, IRWrite)
	begin 
		if (IRWrite= '1') then 
			OpCode <= MemData(31 downto 26); --opcode
			Rs <= Memdata (25 downto 21); --rs
 			Rt <= Memdata (20 downto 16); --rt
			Rd <= Memdata (15 downto 11); --rd
			Imm <= Memdata (15 downto 0);  -- imm
			Func <= Memdata (5 downto 0);   --func
			JumpAddr <= Memdata (25 downto 0);  --jump
		end if; 
	end process; 
end behaviour;
