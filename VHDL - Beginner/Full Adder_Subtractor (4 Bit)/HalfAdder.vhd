library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HalfAdder is
    Port ( A_Half : in  STD_LOGIC;
           B_Half : in  STD_LOGIC;
           Sum_Half : out  STD_LOGIC;
           CarryOut_Half : out  STD_LOGIC);
end HalfAdder;

architecture Dataflow of HalfAdder is

begin

	Sum_Half <= A_Half xor B_Half;
	CarryOut_Half <= A_Half and B_Half;

end Dataflow;

