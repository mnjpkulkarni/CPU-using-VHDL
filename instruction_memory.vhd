library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity instruction_memory is
port(addr_bus:in std_logic_vector(4 downto 0);
	opcode_cpu:out std_logic_vector(7 downto 0));
end instruction_memory;

architecture behavior of instruction_memory is
signal imsig:std_logic_vector(7 downto 0);
begin



process(addr_bus)
begin

case addr_bus is
 
when "00000" => imsig<="00000000";
when "00001" => imsig<="00100000";
when "00010" => imsig<="01000000";
when "00011" => imsig<="01100000";
when "00100" => imsig<="10000000";
when "00101" => imsig<="10100000";

when "00110" => imsig<="11000000";
when "00111" => imsig<="11000001";
when "01000" => imsig<="11000010";
when "01001" => imsig<="11000011";
when "01010" => imsig<="11000100";
when "01011" => imsig<="11000101";
when "01100" => imsig<="11000110";
when "01101" => imsig<="11000111";


when "01110" => imsig<="11001000";
when "01111" => imsig<="11001001";
when "10000" => imsig<="11001010";
when "10001" => imsig<="11001011";
when "10010" => imsig<="11001100";
when "10011" => imsig<="11001101";
when "10100" => imsig<="11001110";
when "10101" => imsig<="11001111";

when "10110" => imsig<="11001000";
when "10111" => imsig<="11001001";
when "11000" => imsig<="11001010";
when "11001" => imsig<="11001011";
when "11010" => imsig<="11001100";
when "11011" => imsig<="11001101";
when "11100" => imsig<="11001110";
when "11101" => imsig<="11001111";

when others => imsig<="11111111";

end case;

end process;

opcode_cpu<=imsig;

end behavior;




 