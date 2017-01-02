library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity multiplier_unit is
port(A,B: in std_logic_vector(15 downto 0);
	outputL: out std_logic_vector(31 downto 0);
	ofl:out std_logic);
end multiplier_unit;

architecture behavior of multiplier_unit is
begin

process(A,B)

variable temp1:std_logic_vector(31 downto 0);
variable temp2:std_logic_vector(16 downto 0);

begin

temp1:="0000000000000000" & B;

for i in 1 to 16 loop
if (temp1(0)='1') then
temp2:=('0' & A)+('0' & temp1(31 downto 16));
temp1:=temp2 & temp1(15 downto 1);
else
temp1:='0' & temp1(31 downto 1);
end if;
end loop;

outputL<=temp1;
ofl<='0';

end process;

end behavior;
