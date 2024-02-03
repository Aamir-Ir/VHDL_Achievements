
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity slt is
 Port ( 
 		In1		:	in	std_logic;
		In2		:	in	std_logic;
		Sout	:	out	std_logic
		);
end slt;

architecture Behavioral of slt is

begin
--  A  B  S 
--  0  0  0 
--  0  1  1 
--  1  0  0 
--  1  1  0 

Sout <= (not In1) and In2;

end Behavioral;
