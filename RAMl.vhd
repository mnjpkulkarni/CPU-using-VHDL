library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RAMl is
generic(N:integer:=3;
	W:integer:=16);
port(clk:in std_logic;
	data_in:in std_logic_vector((W-1) downto 0);
	address:in std_logic_vector((N-1) downto 0);
	we:in std_logic;
data_out:out std_logic_vector((W-1) downto 0));
end RAMl;

architecture behavior of RAMl is
type memory is array (2**(N)-1 downto 0) of std_logic_vector((W-1) downto 0);
signal temp:memory;

begin

process(clk)
begin

if (clk 'event and clk='1') then

if (we='0') then temp(conv_integer(address))<=data_in; data_out<=(others=>'0');
elsif (we='1') then data_out<=temp(conv_integer(address));
end if;

end if;
end process;
end behavior;
