library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;		
use IEEE.STD_LOGIC_UNSIGNED.all;


-- define inputs A and B to be 32 bits
-- input ALUop is 4 bits
-- output result is 32 bits
entity alu32 is	
	Port( A: in STD_LOGIC_VECTOR(31 downto 0);
	      B: in STD_LOGIC_VECTOR(31 downto 0);
	      ALUop: in STD_LOGIC_VECTOR(3 downto 0);
	      zero: out STD_LOGIC;
	      result: out STD_LOGIC_VECTOR(31 downto 0));
end alu32;

architecture struct of alu32 is
	component adder_32 is
		Port (A: 		in STD_LOGIC_VECTOR(31 downto 0);    
		      B:		in STD_LOGIC_VECTOR(31 downto 0);
		      carryin:    	in STD_LOGIC;
		      sum:		out STD_LOGIC_VECTOR(31 downto 0);
		      carryout: 	out STD_LOGIC);
end component;

	signal add_result: STD_LOGIC_VECTOR(31 downto 0); 
	signal sub_result: STD_LOGIC_VECTOR(31 downto 0); 
	signal neg_B:	   STD_LOGIC_VECTOR(31 downto 0);

begin

	neg_B <= std_logic_vector(unsigned(not B)+1);

	ADD: adder_32 port map(A => A, B => B, carryin => '0', sum => add_result, carryout => open);
	SUB: adder_32 port map(A, neg_B, '0', sub_result, open);

	result <=	A and B when(ALUop = "0000") else
			A or B when(ALUop = "0001") else
			add_result when(ALUop = "0010") else
			sub_result when(ALUop = "0110") ;

	zero <=		'1' when unsigned(sub_result) = 0 else --if A=B, sub_result = 0
			'0';


end struct;