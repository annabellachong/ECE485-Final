library ieee; 
use ieee.std_logic_1164.all;

entity tb_controlUnit is
end tb_controlUnit;

architecture test of tb_controlUnit is
	component controlUnit is 
		port(	clk:	in std_logic; 
			OpCode: 	in STD_LOGIC_VECTOR(5 downto 0);
			PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst: out STD_LOGIC;
			PCSrc, ALUOp, ALUSrcB: out STD_LOGIC_VECTOR(1 downto 0)); 
	end component;


	for U1: controlUnit use entity WORK.controlUnit(behaviour);

	--INPUT
	signal OpCode_s: STD_LOGIC_VECTOR(5 downto 0);
	signal clk_s: std_logic := '0'; 
	constant clk_period : time := 20 ns;
	constant high_time: time:= clk_period/2; 
	constant low_time: time:= clk_period - high_time;  
	--OUTPUTs
	signal PCWriteCond_s, PCWrite_s, IorD_s, MemRead_s, MemWrite_s, MemtoReg_s, IRWrite_s, ALUSrcA_s, RegWrite_s, RegDst_s: STD_LOGIC;
	signal PCSrc, ALUOp, ALUSrcB: STD_LOGIC_VECTOR(1 downto 0); 
	
	begin
	U1: controlUnit port map (clk_s, OpCode_s, PCWriteCond_s, PCWrite_s, IorD_s, MemRead_s, MemWrite_s, MemtoReg_s, IRWrite_s, ALUSrcA_s, RegWrite_s, RegDst_s, PCSrc, ALUOp, ALUSrcB);
		process
		begin

		-- Test Case 1 
				OpCode_s <= "000100"; --
				clk_s <= '1';  			
				wait for high_time; 
				clk_s <= '0';
				wait for low_time; 
		--Test Case 2
			--OpCode_s <= "100011"; --LW
			--clk_s <= '0'; 
			--reset_s <= '0'; 			
			--wait for clk_period/10; 
			--clk_s <= '1';
			--wait for clk_period/10; 
		--Test Case 4
			--OpCode_s <= "000010"; 
			--clk_s <= '0'; 
			--reset_s <= '0'; 
			--wait for 10ns; 
		--Test Case 5
			--OpCode_s <= "001000"; 
			--clk_s <= '1'; 
			--reset_s <= '0'; 
			--wait for 10ns; 
		--Test Case 6
			--OpCode_s <= "011000"; 
			--clk_s <= '1'; 
			--reset_s <= '0'; 
			--wait for 10ns; 
		
		end process; 
end test; 