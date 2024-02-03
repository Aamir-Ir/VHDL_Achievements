library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicMultiplexer is
    Port ( A_LM : in  STD_LOGIC;
           B_LM : in  STD_LOGIC;
           S0_LM : in  STD_LOGIC;
           S1_LM : in  STD_LOGIC;
           G_LM : out  STD_LOGIC);
end LogicMultiplexer;

architecture Structural of LogicMultiplexer is

begin

  G_LM <= (A_LM and B_LM) when (S1_LM = '0' and S0_LM = '0')
					else (A_LM or B_LM) when (S1_LM = '0' and S0_LM = '1')
					else (A_LM xor B_LM) when (S1_LM = '1' and S0_LM = '0')
					else (not A_LM) when (S1_LM = '1' and S0_LM = '1');

end Structural;

