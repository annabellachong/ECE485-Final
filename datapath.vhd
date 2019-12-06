library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity datapath is
	Port(	clk:	in std_logic
); 
end datapath; 

architecture behaviour of datapath is
	component reg is 
		port ( clk : in std_logic;
			R1 : in std_logic_vector (4 downto 0);
			R2 : in std_logic_vector (4 downto 0);
			WriteReg : in std_logic_vector (4 downto 0);
			WriteData : in std_logic_vector (31 downto 0);
			RegWrite: in std_logic; 
			ReadData1 : out std_logic_vector (31 downto 0);
			ReadData2 : out std_logic_vector (31 downto 0));
	end component;

	component instrRegister is 
		port(	
			MemData:	in STD_LOGIC_VECTOR(31 downto 0);
			IRWrite:	in STD_LOGIC;
			OpCode, Func:	out STD_LOGIC_VECTOR(5 downto 0); 
			Rs, Rt, Rd:	out STD_LOGIC_VECTOR(4 downto 0);
			Imm:		out STD_LOGIC_VECTOR(15 downto 0);
			JumpAddr:	out STD_LOGIC_VECTOR(25 downto 0));
					
	end component; 

	component input_mux_2 is 
		port (A:	in STD_LOGIC_VECTOR(31 downto 0);
		      B:	in STD_LOGIC_VECTOR(31 downto 0);	
		      S: 	in STD_LOGIC;
		      Y:	out STD_LOGIC_VECTOR(31 downto 0));

	end component; 

	component input_mux_4 is 
		port(	A,B,C,D: 	in STD_LOGIC_VECTOR(31 downto 0);
			S:		in STD_LOGIC_VECTOR(1 downto 0);
			Y:		out STD_LOGIC_VECTOR(31 downto 0));
	end component; 

	component controlUnit is 
		port(	clk:	in std_logic; 
			OpCode: 	in STD_LOGIC_VECTOR(5 downto 0);
			PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst: out STD_LOGIC;
			PCSrc, ALUOp, ALUSrcB: out STD_LOGIC_VECTOR(1 downto 0));
	end component; 

	component alu32 is 
		Port(	A: in STD_LOGIC_VECTOR(31 downto 0);
	      		B: in STD_LOGIC_VECTOR(31 downto 0);
	      		ALUop: in STD_LOGIC_VECTOR(3 downto 0);
	      		zero: out STD_LOGIC;
	      		result: out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component signExt is 
		Port(	Imm: 		in STD_LOGIC_VECTOR(15 downto 0);
			ImmExt:		out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component memory is 
		Port (	address:	in STD_LOGIC_VECTOR(31 downto 0);
			memWriteIn: in STD_LOGIC_VECTOR(31 downto 0);
			memRead:	in STD_LOGIC;
			memWrite:	in STD_LOGIC;
			memData:	out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component memDataReg is 
		Port ( memData:	in STD_LOGIC_VECTOR(31 downto 0);
		memDataOut: out STD_LOGIC_VECTOR(31 downto 0));

	end component;

	component regA is
		Port( readD1: in STD_LOGIC_VECTOR(31 downto 0);
	      		outD1:  out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component regB is
		Port( readD2: in STD_LOGIC_VECTOR(31 downto 0);
	     		 outD2:  out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component shift_left2 is
		Port ( input:	in STD_LOGIC_VECTOR(31 downto 0);
	       		output:  out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component r is
		Port (	enable: in STD_LOGIC;
			D: in STD_LOGIC_VECTOR(31 downto 0);
			Q: out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	
	component aluControl is 
		Port(	func: 		in STD_LOGIC_VECTOR(5 downto 0);
			ALUOp:		in STD_LOGIC_VECTOR(1 downto 0);
			Op:		out STD_LOGIC_VECTOR(3 downto 0));
	end component; 

	component shiftleft_j is 
		Port(	input:	in STD_LOGIC_VECTOR(25 downto 0);
	       		output:  out STD_LOGIC_VECTOR(27 downto 0));
	end component;

	signal PCWriteCond: STD_LOGIC; 
	signal PCWrite: STD_LOGIC; 
	signal IorD: STD_LOGIC;
	signal MemRead: STD_LOGIC;
	signal MemWrite: STD_LOGIC; 
	signal MemtoReg: STD_LOGIC; 
	signal IRWrite: STD_LOGIC;
	signal ALUSrcA: STD_LOGIC; 
	signal RegWrite: STD_LOGIC; 
	signal RegDst:  STD_LOGIC;
	signal OpCode: STD_LOGIC_VECTOR(5 downto 0);
	signal PCSrc, ALUOp, ALUSrcB: STD_LOGIC_VECTOR(1 downto 0); 
	signal D,Q: std_logic_VECTOR(31 downto 0) ;
	signal E: std_logic; 
	signal ALUZero: std_logic; 
	signal address, memWriteIn, memData : std_logic_VECTOR(31 downto 0); 
	signal readR1, readR2: std_logic_vector(4 downto 0);
	signal instr4 : std_logic_vector(4 downto 0);

	signal WriteR: std_logic_vector(31 downto 0);   
	signal writeData: std_logic_vector(31 downto 0);
	signal Imm: std_logic_vector(15 downto 0);
	signal ALUOut, memDataOut: std_logic_vector(31 downto 0);
	signal A, Aout, B, Bout: std_logic_vector(31 downto 0); 
	signal ImmExt: std_logic_vector(31 downto 0);
	signal sl2: std_logic_vector(31 downto 0);
	signal ALU_in1, ALU_in2 : std_logic_vector(31 downto 0);
	signal pJumpAddr : std_logic_vector(25 downto 0);
	signal JumpAddr : std_logic_vector(27 downto 0);
	signal JumpAddr1 : std_logic_vector(31 downto 0);
	signal ALUResult: std_logic_vector(31 downto 0);
	signal func: std_logic_vector(5 downto 0);  
	signal Op: std_logic_vector(3 downto 0);
	signal mux1_in0, mux1_in1 : std_logic_vector(31 downto 0);
	--signal instr1, instr2, instr3, 
	
begin

	controlU: controlUnit port map ( clk, OpCode, PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst,
		PCSrc, ALUOp, ALUSrcB );   
	E <= (ALUZero and PCWriteCond) or PCWrite; 
	PC : r port map (E, D, Q);
	-- memory 
	Memory1: memory port map (address, memWriteIn, memRead, memWrite, memData);
	instructReg: instrRegister port map (memData, IRWrite, OpCode, func, readR1, readR2, instr4, Imm, pJumpAddr);   
	MemDataReg1 : memDataReg port map ( memData, memDataOut);  

	mux1_in0 <= std_logic_vector(resize(unsigned('0'&readR2),32)); --resizing from 
	mux1_in1 <= std_logic_vector(resize(unsigned('0'&instr4),32)); 
	
	Mux1 : input_mux_2 port map (mux1_in0, mux1_in1, RegDst, WriteR);  
	Mux2 : input_mux_2 port map (ALUOut, memDataOut, MemtoReg, writeData); 
	Regs: reg port map ( clk, readR1, readR2, WriteR(4 downto 0), writeData, RegWrite, A,B); 	
	signExtnd: signExt port map (Imm, ImmExt); 
	RegAA : regA port map (A, Aout); 
	RegBB: regB port map (B, Bout); 
	shiftleft2:  shift_left2 port map (ImmExt, sl2) ;
	Mux1A : input_mux_2 port map (Q, Aout, ALUSrcA, ALU_in1);  
	Mux4 : input_mux_4 port map (Bout, x"00000004", ImmExt, sl2, ALUSrcB, ALU_in2);
	shiftleft2J:  shiftleft_j port map (pJumpAddr, JumpAddr);
	
	JumpAddr1 <= Q(31 downto 28) & JumpAddr(27 downto 0);
	
	Mux4B : input_mux_4 port map (ALUResult, ALUOut, JumpAddr1, x"00000000", PCSrc, D);
	ALUCon : aluControl port map (func, ALUOp, Op);
	ALUOut1: r port map (clk, ALUResult, ALUOut); 

end behaviour; 
