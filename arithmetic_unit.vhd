library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity arithmetic_unit is 
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	opcode:in std_logic_vector(2 downto 0);
	outputL:out std_logic_vector(15 downto 0);
	outputH:out std_logic_vector(15 downto 0);
	ofl:out std_logic);
end arithmetic_unit;

architecture behavior of arithmetic_unit is

component adder_unit is
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	outputL,outputH: out std_logic_vector(15 downto 0);
	ofl:out std_logic);
end component;


component multiplier_unit is
port(A,B: in std_logic_vector(15 downto 0);
	outputL: out std_logic_vector(31 downto 0);
	ofl:out std_logic);
end component;

signal outL1,outH1:std_logic_vector(15 downto 0);
signal outL2:std_logic_vector(31 downto 0);
signal ofl1,ofl2:std_logic;

 
begin

u1: adder_unit port map(A,B,cin,outL1,outH1,ofl1);
u2: multiplier_unit port map(A,B,outL2,ofl2);


process(A,B,cin,opcode,outL1,outH1,ofl1,outL2,ofl2)
begin



if (opcode="000") then 
outputL<=outL1;
outputH<=outH1;
ofl<=ofl1;

elsif (opcode="001") then
outputL<=outL2(31 downto 16);
outputH<=outL2(15 downto 0);

end if;

end process;

end behavior;

