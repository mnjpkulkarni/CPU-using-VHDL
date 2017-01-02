library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity program_counter is 
port(addr_bus_in: in std_logic_vector(4 downto 0);
	ld,inc,clk,reset: in std_logic;
	addr_bus_out:out std_logic_vector(4 downto 0));
end program_counter;

architecture behavior of program_counter is
signal pcsig:std_logic_vector(4 downto 0);
begin

process(ld,inc,clk,reset)
begin
if (reset='1') then pcsig<="ZZZZZ";end if;

if (clk'event and clk='1' and ld='1') then
pcsig<=addr_bus_in;end if;
if (clk'event and clk='1' and inc='1') then

pcsig<=addr_bus_in+1;end if;

end process;

addr_bus_out<=pcsig;

end behavior;
