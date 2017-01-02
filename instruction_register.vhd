library ieee;
use ieee.std_logic_1164.all;


entity instruction_register is
port(opcode_cpu:in std_logic_vector(7 downto 0);
	clk,reset:in std_logic;
	opcode_cpu_out:out std_logic_vector(7 downto 0));
end instruction_register;

architecture behavior of instruction_register is

begin

process(opcode_cpu,clk,reset)
begin
if reset='1' then opcode_cpu_out<="ZZZZZZZZ";

elsif (clk'event and clk='1') then
opcode_cpu_out<=opcode_cpu;

end if;
end process;



end behavior;