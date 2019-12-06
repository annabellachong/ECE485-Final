library ieee; 
use ieee.std_logic_1164.all;

entity tb_datapath is
end tb_datapath;

architecture Behavioral of tb_datapath is
	signal clk_SIG: std_logic;

component datapath is 
	Port(	clk:	in std_logic);

end component;

begin 
	uut : datapath port map (
		clk => clk ); 

begin datap_INST: datapath
	port map (
		clk => clk_SIG);

process is
begin
	clk_SIG <= '1';
	wait for 100ns;

end process;
end Behavioral; 

