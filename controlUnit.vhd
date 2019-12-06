library ieee; 
use ieee.std_logic_1164.all; 

-- instantiation of 4 input MUX; S: select signal 
entity controlUnit is
--generic(ClkFreqHz : integer);
	Port(	clk:	in std_logic; 
		OpCode: 	in STD_LOGIC_VECTOR(5 downto 0);
		PCWriteCond: out STD_LOGIC;
		PCWrite: out STD_LOGIC;
		IorD: out STD_LOGIC;
		MemRead: out STD_LOGIC;
		MemWrite: out STD_LOGIC;
 		MemtoReg: out STD_LOGIC;
 		IRWrite: out STD_LOGIC;
		ALUSrcA: out STD_LOGIC;
		RegWrite: out STD_LOGIC;
 		RegDst: out STD_LOGIC;
		PCSrc: out STD_LOGIC_VECTOR(1 downto 0);
		ALUOp: out STD_LOGIC_VECTOR(1 downto 0);
 		ALUSrcB: out STD_LOGIC_VECTOR(1 downto 0));
end controlUnit; 

architecture behaviour of controlUnit is
	type control_state is ( s0, s1, s2, s3, s4, s5, s6, s7, s8, s9); 
	signal state: control_state := s0; 
	signal nextstate: control_state;

begin 
	Process1: process (clk)
	begin
		if (rising_edge(clk)) then
			state <= nextstate; 
		else 
			null; 
		end if; 
	end process; 

	Process2: process (state, nextstate, OpCode)
	begin 
		nextstate <= state; --when no case is satisfied 
		
		case state is 
		when s0 => 
			ALUSrcA <= '0'; 
			ALUSrcB <= "01"; 
			ALUOp <= "00" ; 
			RegWrite <= '1'; 
			RegDst <= '1'; 
			MemtoReg <= '0';
			MemRead<= '1';
			MemWrite <= '0'; 
			IRWrite <= '1'; 
			IorD <= '0'; 
			PCWriteCond <= '0';
			PCWrite <= '1';
			PCSrc <= "00";
			nextstate <= s1; 

		when s1 => 
			ALUSrcA <= '0'; 
			ALUSrcB <= "01"; 
			ALUOp <= "00" ; 
			if (Opcode = "000000") then 	-- R-type
				nextstate <= s6; 
			elsif (Opcode = "100011") then 	-- LW
				nextstate <= s2; 
			elsif (OpCode = "101011") then -- SW 
				nextstate <= s2; 
			elsif (Opcode = "000100") then   -- BEQ
				nextstate <= s8; 
			elsif (Opcode = "000010") then   -- Jump
				nextstate <= s9; 
			else 			 	-- addi 
				nextstate <= s2; 
			end if; 

		when s2 => 
			ALUSrcA <= '0'; 
			ALUSrcB <= "01"; 
			ALUOp <= "00" ; 
			if (Opcode = "100011") then 	-- LW
				nextstate <= s3; 
			else 	
				nextstate <= s5; 	--SW
			end if; 
		when s3 => 
			MemRead <= '1'; 
			IorD <= '1'; 
			nextstate <= s4; 
		when s4 =>
			RegDst <= '0'; 
			RegWrite<= '1'; 
			MemtoReg<= '1'; 
			nextstate <= s0; 
		when s5 =>
			MemWrite <= '1';
			IorD <= '1'; 
			nextstate <= s0;

		when s6 => 
			ALUSrcA <= '1';
			ALUSrcB <= "00";
			ALUOp <= "10";
			nextstate <= s7; 

		when s7 => 
			RegWrite <= '1'; 
			RegDst <= '1'; 
			MemtoReg <= '0';
			nextstate <= s0; 
		when s8 => 
			ALUSrcA <= '1'; 
			ALUSrcB <= "00"; 
			ALUOp <= "01" ; 
			PCWriteCond <= '1'; --if ALUzero asserted
			PCSrc <= "01"; 
			nextstate <= s0; 
		when s9 => 
			PCWrite <= '1'; 
			PCSrc <= "10"; 
 			nextstate <= s0; 

		end case;
	end process; 

end architecture;
		
