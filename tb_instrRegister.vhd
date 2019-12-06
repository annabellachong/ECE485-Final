library ieee; 
use ieee.std_logic_1164.all;

entity tb_instrRegister is
end tb_instrRegister;

architecture test of tb_instrRegister is
	component instrRegister is 
		port( 
-- figure out how to integrate clk 
		MemData:	in STD_LOGIC_VECTOR(31 downto 0);
		IRWrite:	in STD_LOGIC;
		OpCode, Func:	out STD_LOGIC_VECTOR(5 downto 0); 
		Rs, Rt, Rd:	out STD_LOGIC_VECTOR(4 downto 0);
		Imm:		out STD_LOGIC_VECTOR(15 downto 0);
		JumpAddr:	out STD_LOGIC_VECTOR(25 downto 0));  
	 end component;
	
	for U1: instrRegister use entity WORK.instrRegister(behaviour);

	--INPUTS
	signal MemData_s: std_logic_vector(31 downto 0);
	signal IRWrite_s: std_logic; 
	--OUTPUT
	signal OpCode_s, Func_s: std_logic_vector(5 downto 0); 
	signal Rs_s, Rt_s, Rd_s: std_logic_vector(4 downto 0);
	signal Imm_s: std_logic_vector(15 downto 0);
	signal JumpAddr_s: std_logic_vector(25 downto 0);

	begin

	U1: instrRegister port map ( MemData_s, IRWrite_s, OpCode_s, Func_s, Rs_s, Rt_s, Rd_s, Imm_s, JumpAddr_s);
		process
		begin

		-- Test Case 1 
			MemData_s <= x"01578820"; 
			IRWrite_s <= '1';
			wait for 10 ns;
		
		end process; 
end test; 
