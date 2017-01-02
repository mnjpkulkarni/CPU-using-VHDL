library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY BarrelShifter IS -- A is shifted by the amount of B.
 PORT ( A : IN std_logic_vector (15 Downto 0);
 B : IN std_logic_vector (15 downto 0);
 opcode : IN std_logic_vector(2 downto 0); -- 0: Left; 1: Right
 outputL,outputH : OUT std_logic_vector (15 Downto 0));
END BarrelShifter;


ARCHITECTURE behavior of BarrelShifter is
signal s: std_logic_vector(15 downto 0);
Begin
process(A,B,opcode)
begin
 if (opcode="001") then
case B is
when x"0000" =>s<=A;
when x"0001" =>s<=A(14 downto 0)&A(15);
when x"0002" => s<=A(13 downto 0)&A(15)&A(14);
when x"0003" => s<=A(12 downto 0)&A(15)&A(14)&A(13);
when x"0004" => s<=A(11 downto 0)&A(15)&A(14)&A(13)&A(12);
when x"0005" => s<=A(10 downto 0)&A(15)&A(14)&A(13)&A(12)&A(11);
when x"0006" => s<=A(9 downto 0)&A(15)&A(14)&A(13)&A(12)&A(11)&A(10);
when x"0007" => s<=A(8 downto 0)&A(15)&A(14)&A(13)&A(12)&A(11)&A(10)&A(9);
when x"0008" => s<=A(7 downto 0)&A(15)&A(14)&A(13)&A(12)&A(11)&A(10)&A(9)&A(8);
when x"0009" => s<=A(6 downto 0)&A(15 downto 7);
when x"000A" => s<=A(5 downto 0)&A(15 downto 6);
when x"000B" => s<=A(4 downto 0)&A(15 downto 5);
when x"000C" => s<=A(3 downto 0)&A(15 downto 4);
when x"000D" => s<=A(2 downto 0)&A(15 downto 3);
when x"000E" => s<=A(1 downto 0)&A(15 downto 2);
when x"000F" => s<=A(0) & A(15 downto 1);
when others =>s<=x"0000";
end case;

elsif (opcode="000") then
case B is
when x"0000" => s<=A;
when x"0001" => s<=A(0)&A(15 downto 1);
when x"0002" => s<=A(1 downto 0)&A(15 downto 2);
when x"0003" => s<=A(2 downto 0)&A(15 downto 3);
when x"0004" => s<=A(3 downto 0)&A(15 downto 4);
when x"0005" => s<=A(4 downto 0)&A(15 downto 5);
when x"0006" => s<=A(5 downto 0)&A(15 downto 6);
when x"0007" => s<=A(6 downto 0)&A(15 downto 7);
when x"0008" => s<=A(7 downto 0)&A(15 downto 8);
when x"0009" => s<=A(8 downto 0)&A(15 downto 9);
when x"000A" => s<=A(9 downto 0)&A(15 downto 10);
when x"000B" => s<=A(10 downto 0)&A(15 downto 11);
when x"000C" => s<=A(11 downto 0)&A(15 downto 12);
when x"000D" => s<=A(12 downto 0)&A(15 downto 13);
when x"000E" => s<=A(13 downto 0)&A(15 downto 14);
when x"000F" => s<=A(14 downto 0)&A(15);
when others =>s<=x"0000";
end case;


end if;
end process;

 







outputL<=s;
outputH<=(others=>'0');
end behavior;



 


