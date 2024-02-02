library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    Port ( A_Full : in  STD_LOGIC;
           B_Full : in  STD_LOGIC;
           CarryIn_Full : in  STD_LOGIC;
           CarryOut_Full : out  STD_LOGIC;
           Sum_Full : out  STD_LOGIC);
end FullAdder;

architecture Structural of FullAdder is
	signal M : STD_LOGIC;
	signal N : STD_LOGIC;
	signal P : STD_LOGIC;
	component HalfAdder is 
		Port ( A_Half : in  STD_LOGIC;
           B_Half : in  STD_LOGIC;
           Sum_Half : out  STD_LOGIC;
           CarryOut_Half : out  STD_LOGIC);
	end component HalfAdder;
begin
	ha1 : HalfAdder 
		port map (A_Half=>A_Full, B_Half=>B_Full , Sum_Half=> M, CarryOut_Half=>N);
					
	ha2 : HalfAdder 
		port map (A_Half=>M, B_Half=>CarryIn_Full , Sum_Half=> Sum_Full, CarryOut_Half=>P);
	CarryOut_Full<= P or N;
end Structural;

