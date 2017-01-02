library ieee;
use ieee.std_logic_1164.all;

entity controller is
port(data_bus_A,data_bus_B:in std_logic_vector(15 downto 0);
	data_bus_cin:in std_logic;
	opcode_cpu:in std_logic_vector(7 downto 0);
	en_A,en_B,en_STC,en_RDM,en_NOP,en_HLT,en_ALU:out std_logic;
	mode_ALU:out std_logic_vector(1 downto 0);
	opcode_ALU,RDM_addr:out std_logic_vector(2 downto 0);
	A_out,B_out:out std_logic_vector(15 downto 0);
	c_out:out std_logic);
end controller;

architecture behavior of controller is
begin

process(opcode_cpu)
begin

if (opcode_cpu(7 downto 5)="000") then en_A<='1';else en_A<='0';end if;
if (opcode_cpu(7 downto 5)="001") then en_B<='1';else en_b<='0';end if;
if (opcode_cpu(7 downto 5)="010") then en_STC<='1';else en_STC<='0';end if;
if (opcode_cpu(7 downto 5)="011") then en_RDM<='1';else en_RDM<='0';RDM_addr<=opcode_cpu(2 downto 0);end if;
if (opcode_cpu(7 downto 5)="100") then en_NOP<='1';else en_NOP<='0';end if;
if (opcode_cpu(7 downto 5)="101") then en_HLT<='1';else en_HLT<='0';end if;

if (opcode_cpu(7 downto 5)="110") then 
en_ALU<='1';
mode_ALU<=opcode_cpu(4 downto 3);
opcode_ALU<=opcode_cpu(2 downto 0);
A_out<=data_bus_A;
B_out<=data_bus_B;
c_out<=data_bus_cin;
else 
en_ALU<='0';
mode_ALU<="ZZ";
opcode_ALU<="ZZZ";
end if;


end process;

end behavior;
