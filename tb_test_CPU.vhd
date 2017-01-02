library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity tb_test_CPU is
end tb_test_CPU;

architecture structure of tb_test_CPU is 
component test_CPU is 
port(data_bus_A,data_bus_B:in std_logic_vector(15 downto 0);
	data_bus_cin:in std_logic;
	addr_bus:in std_logic_vector(4 downto 0);
	ld,inc,clk,reset:in std_logic;
	outputL,outputH:out std_logic_vector(15 downto 0)
	);
end component;



signal data_bus_A,data_bus_B,outputL,outputH:std_logic_vector(15 downto 0);
	signal data_bus_cin:std_logic;
signal addr_bus:std_logic_vector(4 downto 0);
signal ld,inc,reset:std_logic;
signal clk:std_logic:='0';







begin

u: test_CPU port map(data_bus_A,data_bus_B,data_bus_cin,addr_bus,ld,inc,clk,reset,outputL,outputH);

clk<=not clk after 5 ns;
process
begin

wait for 0ns;
data_bus_A<=x"1110";data_bus_B<=x"1010";data_bus_cin<='0';addr_bus<="00011";ld<='1';inc<='0';reset<='0';
wait for 100ns;






end process;

end structure;
