library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OneBitALU is
	Port ( A_OBALU : in  STD_LOGIC;
           B_OBALU : in  STD_LOGIC;
           Cin_OBALU : in  STD_LOGIC;
           S0_OBALU : in  STD_LOGIC;
           S1_OBALU : in  STD_LOGIC;
           S2_OBALU : in  STD_LOGIC;
           Cout_OBALU : out  STD_LOGIC;
           G_OBALU : out  STD_LOGIC);
end OneBitALU;

architecture Structural of OneBitALU is

component LogicCircuit is
	Port ( A_LC : in  STD_LOGIC_VECTOR (3 downto 0);
           B_LC : in  STD_LOGIC_VECTOR (3 downto 0);
           S0_LC : in  STD_LOGIC;
           S1_LC : in  STD_LOGIC;
           G_LC : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
component ArithmeticCircuit is
	Port ( Ain_AC : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin_AC : in  STD_LOGIC_VECTOR (3 downto 0);
           S0_AC : in  STD_LOGIC;
           S1_AC : in  STD_LOGIC;
           Cout_AC : out  STD_LOGIC;
           G_AC : out  STD_LOGIC_VECTOR (3 downto 0);
           Cin_AC : in  STD_LOGIC);
	end component;

begin


end Structural;

