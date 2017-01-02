library ieee;
use ieee.std_logic_1164.all;

entity register_C is
port(ALU_L,ALU_H: in std_logic_vector(15 downto 0);
	clk,reset:in std_logic;
	c_out_L,c_out_H: out std_logic_vector(15 downto 0));
end register_C;

architecture behavior of register_C is 
begin

process(ALU_L,ALU_H,clk,reset)
begin

if reset='1' then c_out_L<=(others=>'Z');c_out_H<=(others=>'Z');

elsif (clk'event and clk='1') then 
c_out_L<=ALU_L;
c_out_H<=ALU_H;

end if;

end process;

end behavior;