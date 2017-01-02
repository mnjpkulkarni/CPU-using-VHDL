library ieee;
use ieee.std_logic_1164.all;

entity register_a is 
port(regin:in std_logic_vector(15 downto 0);
	clk:in std_logic;
	reset:in std_logic;
	load_A:in std_logic;
	regout: out std_logic_vector(15 downto 0));
end register_a;

architecture behavior of register_a is 
begin

process(clk)
begin
if (reset='1' and load_A='1') then regout<=(others=>'0');
elsif (clk'event and clk='1' and load_A='1') then regout<=regin;
end if;

end process;

end behavior;