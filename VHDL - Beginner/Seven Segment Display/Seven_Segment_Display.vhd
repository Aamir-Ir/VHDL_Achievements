library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity test is
    Port (  INPUT: in  std_logic_vector (3 downto 0);
				LEDTARGET: out  std_logic_vector (3 downto 0);
            OUTPUT: out std_logic_vector (6 downto 0));
end test;
architecture Behavioral of test is
begin
LEDTARGET<= "0111";
--output for binary inputs for numbers 0-15, output corresponds to each led on the 
--7-segment display, input corresponds to last four switches on board
OUTPUT <= 
	"0000001" WHEN (INPUT = "0000") ELSE
	"1001111" WHEN (INPUT = "0001") ELSE
	"0010010" WHEN (INPUT = "0010") ELSE
	"0000110" WHEN (INPUT = "0011") ELSE
	"1001100" WHEN (INPUT = "0100") ELSE
	"0100100" WHEN (INPUT = "0101") ELSE
	"0100000" WHEN (INPUT = "0110") ELSE
	"0001111" WHEN (INPUT = "0111") ELSE
	"0000000" WHEN (INPUT = "1000") ELSE
	"0000100" WHEN (INPUT = "1001") ELSE
	"0001000" WHEN (INPUT = "1010") ELSE
	"1100000" WHEN (INPUT = "1011") ELSE
	"0110001" WHEN (INPUT = "1100") ELSE
	"1000010" WHEN (INPUT = "1101") ELSE
	"0110000" WHEN (INPUT = "1110") ELSE
	"0111000" WHEN (INPUT = "1111");
end Behavioral;

