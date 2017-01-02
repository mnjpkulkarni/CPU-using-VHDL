library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	en_ALU:in std_logic;
	opcode:in std_logic_vector(2 downto 0);
	mode:in std_logic_vector(1 downto 0);
	outputL,outputH: out std_logic_vector(15 downto 0);
	ofl:out std_logic;
	ZA,ZB,EQ,GT:out std_logic);
end ALU;

architecture behavior of ALU is

component arithmetic_unit is 
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	opcode:in std_logic_vector(2 downto 0);
	outputL:out std_logic_vector(15 downto 0);
	outputH:out std_logic_vector(15 downto 0);
	ofl:out std_logic);
end component;

component logical_unit is
port(A,B: in std_logic_vector(15 downto 0);
	opcode:in std_logic_vector(2 downto 0);
	outputL:out std_logic_vector(15 downto 0);
	outputH:out std_logic_vector(15 downto 0);
	ZA,ZB: out std_logic;
	EQ,GT:out std_logic);
end component;

component BarrelShifter IS -- A is shifted by the amount of B.
 PORT ( A : IN std_logic_vector (15 Downto 0);
 B : IN std_logic_vector (15 downto 0);
 opcode : IN std_logic_vector(2 downto 0); -- 0: Left; 1: Right
 outputL,outputH : OUT std_logic_vector (15 Downto 0));
END component;

signal ol1,ol2,ol3,oh1,oh2,oh3:std_logic_vector(15 downto 0);

begin

u00: arithmetic_unit port map(A,B,cin,opcode,ol1,oh1,ofl);
u01: logical_unit port map(A,B,opcode,ol2,oh2,ZA,ZB,EQ,GT);
u10: BarrelShifter port map(A,B,opcode,ol3,oh3);

process(A,B,cin,mode,en_ALU)
begin

if (mode="00" and en_ALU='1') then
outputL<=ol1;
outputH<=oh1;
ZA<='0';
ZB<='0';
EQ<='0';
GT<='0';


elsif (mode="01" and en_ALU='1') then
outputL<=ol2;
outputH<=oh2;
ofl<='0';


elsif (mode="10" and en_ALU='1') then
outputL<=ol3;
outputH<=oh3;
ofl<='0';
ZA<='0';
ZB<='0';
EQ<='0';
GT<='0';

end if;

end process;

end behavior;
