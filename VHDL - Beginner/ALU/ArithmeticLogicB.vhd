library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticLogicB is
    Port ( S1_AL : in  STD_LOGIC;
           S0_AL : in  STD_LOGIC;
           Bin_AL : in  STD_LOGIC_VECTOR (3 downto 0);
           Bout_AL : out  STD_LOGIC_VECTOR (3 downto 0));
end ArithmeticLogicB;

architecture Structural of ArithmeticLogicB is

begin

	Bout_AL <= "0000" when (S1_AL = '0' and S0_AL = '0')
					else Bin_AL when (S1_AL = '0' and S0_AL = '1')
					else (not Bin_AL) when (S1_AL = '1' and S0_AL = '0')
					else "1111" when (S1_AL = '1' and S0_AL = '1');

end Structural;

