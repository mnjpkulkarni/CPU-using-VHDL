library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder_unit is
port(A,B:in std_logic_vector(15 downto 0);
	cin:in std_logic;
	outputL,outputH: out std_logic_vector(15 downto 0);
	ofl:out std_logic);
end adder_unit;

architecture behavior of adder_unit is

begin

process(A,B,cin)

variable sum:std_logic_vector(15 downto 0);
variable carry:std_logic;

begin
carry:=cin;
for i in 0 to 15 loop
sum(i):=A(i) xor B(i) xor carry;
carry:=(A(i) and B(i)) or (B(i) and carry) or (A(i) and carry);
end loop;
outputL<=sum;
outputH<=(others=>'0');
ofl<=carry;
end process;



end behavior;


