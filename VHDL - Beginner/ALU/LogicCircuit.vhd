library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicCircuit is
    Port ( A_LC : in  STD_LOGIC_VECTOR (3 downto 0);
           B_LC : in  STD_LOGIC_VECTOR (3 downto 0);
           S0_LC : in  STD_LOGIC;
           S1_LC : in  STD_LOGIC;
           G_LC : out  STD_LOGIC_VECTOR (3 downto 0));
end LogicCircuit;

architecture Structural of LogicCircuit is

component LogicMultiplexer is
	Port ( A_LM : in  STD_LOGIC;
           B_LM : in  STD_LOGIC;
           S0_LM : in  STD_LOGIC;
           S1_LM : in  STD_LOGIC;
           G_LM : out  STD_LOGIC);
	end component;

begin

MUX1:LogicMultiplexer PORT MAP(A_LM=>A_LC(0), B_LM=>B_LC(0),S0_LM=>S0_LC,S1_LM=>S1_LC,G_LM=>G_LC(0));
MUX2:LogicMultiplexer PORT MAP(A_LM=>A_LC(1), B_LM=>B_LC(1),S0_LM=>S0_LC,S1_LM=>S1_LC,G_LM=>G_LC(1));
MUX3:LogicMultiplexer PORT MAP(A_LM=>A_LC(2), B_LM=>B_LC(2),S0_LM=>S0_LC,S1_LM=>S1_LC,G_LM=>G_LC(2));
MUX4:LogicMultiplexer PORT MAP(A_LM=>A_LC(3), B_LM=>B_LC(3),S0_LM=>S0_LC,S1_LM=>S1_LC,G_LM=>G_LC(3));

end Structural;

