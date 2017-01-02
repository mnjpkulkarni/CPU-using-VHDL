library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_CPU is 
port(data_bus_A,data_bus_B:in std_logic_vector(15 downto 0);
	data_bus_cin:in std_logic;
	addr_bus:in std_logic_vector(4 downto 0);
	ld,inc,clk,reset:in std_logic;
	outputL,outputH: out std_logic_vector(15 downto 0));
end test_CPU;

architecture behavior of test_CPU is

component program_counter is 
port(addr_bus_in: in std_logic_vector(4 downto 0);
	ld,inc,clk,reset: in std_logic;
	addr_bus_out:out std_logic_vector(4 downto 0));
end component;

component instruction_memory is
port(addr_bus:in std_logic_vector(4 downto 0);
	opcode_cpu:out std_logic_vector(7 downto 0));
end component;

component controller is
port(data_bus_A,data_bus_B:in std_logic_vector(15 downto 0);
	data_bus_cin:in std_logic;opcode_cpu:in std_logic_vector(7 downto 0);
	en_A,en_B,en_STC,en_RDM,en_NOP,en_HLT,en_ALU:out std_logic;
	mode_ALU:out std_logic_vector(1 downto 0);
	opcode_ALU,RDM_addr:out std_logic_vector(2 downto 0);
	A_out,B_out:out std_logic_vector(15 downto 0);
	c_out:out std_logic);
end component;

component ALU is
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	en_ALU:in std_logic;
	opcode:in std_logic_vector(2 downto 0);
	mode:in std_logic_vector(1 downto 0);
	outputL,outputH: out std_logic_vector(15 downto 0);
	ofl:out std_logic;
	ZA,ZB,EQ,GT:out std_logic);
end component;


component RAMl is
generic(N:integer:=3;
	W:integer:=16);
port(clk:in std_logic;
	data_in:in std_logic_vector((W-1) downto 0);
	address:in std_logic_vector((N-1) downto 0);
	we:in std_logic;
data_out:out std_logic_vector((W-1) downto 0));
end component;




signal ov,f1,f2,f3,f4:std_logic;
signal abus:std_logic_vector(4 downto 0);
signal op:std_logic_vector(7 downto 0);
signal eA,eB,eSTC,eRDM,eNOP,eHLT,eALU:std_logic;
signal oALU,r_addr:std_logic_vector(2 downto 0);
signal mALU:std_logic_vector(1 downto 0);
signal da,db,oL,oH,rl:std_logic_vector(15 downto 0);
signal dc:std_logic;



begin

u01: program_counter port map(addr_bus,ld,inc,clk,reset,abus);

u02: instruction_memory port map(abus,op);

u04: controller port map(data_bus_A,data_bus_B,data_bus_cin,op,eA,eB,eSTC,eRDM,eNOP,eHLT,eALU,mALU,oALU,r_addr,da,db,dc);



u06: ALU port map(da,db,dc,eALU,oALU,mALU,outputL,outputH,ov,f1,f2,f3,f4);

u07: RAMl port map(clk,oL,r_addr,eRDM,rl);








end behavior;
