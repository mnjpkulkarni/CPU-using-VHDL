library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity logical_unit is
port(A,B: in std_logic_vector(15 downto 0);
	opcode:in std_logic_vector(2 downto 0);
	outputH:out std_logic_vector(15 downto 0);
	outputL:out std_logic_vector(15 downto 0);
	ZA,ZB: out std_logic;
	EQ,GT:out std_logic);
end logical_unit;

architecture behavior of logical_unit is
begin

process(A,B,opcode)
begin
if (A=B) then EQ<='1'; else EQ<='0';end if;
if (A>B) then GT<='1';else GT<='0';end if;
if (A="0000000000000000") then ZA<='1';else ZA<='0';end if;
if (B="0000000000000000") then ZB<='1';else ZB<='0';end if;

end process;

process(A,B,opcode)
begin 

case opcode is
when "000" => outputL<=A and B;
when "001" => outputL<=A or B;
when "010" => outputL<=A nand B;
when "011" => outputL<=A nor B;
when "100" => outputL<=not A;
when "101" => outputL<=not B;
when "110" => outputL<=A xor B;
when "111" => outputL<=A xnor B;
when others => outputL<="ZZZZZZZZZZZZZZZZ";
end case;
end process;
outputH<=(others=>'0');
end behavior;