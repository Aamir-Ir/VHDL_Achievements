library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticCircuit is
    Port ( Ain_AC : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin_AC : in  STD_LOGIC_VECTOR (3 downto 0);
           S0_AC : in  STD_LOGIC;
           S1_AC : in  STD_LOGIC;
           Cout_AC : out  STD_LOGIC;
           G_AC : out  STD_LOGIC_VECTOR (3 downto 0);
           Cin_AC : in  STD_LOGIC);
end ArithmeticCircuit;

architecture Structural of ArithmeticCircuit is

component ArithmeticLogicB is
	Port ( S1_AL : in  STD_LOGIC;
           S0_AL : in  STD_LOGIC;
           Bin_AL : in  STD_LOGIC_VECTOR (3 downto 0);
           Bout_AL : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

component FullAdder is
	Port ( A_FA : in  STD_LOGIC;
           B_FA : in  STD_LOGIC;
           Cin_FA : in  STD_LOGIC;
           Sum_FA : out  STD_LOGIC;
           Cout_FA : out  STD_LOGIC);
	end component;
	
	SIGNAL Bpostlogic:STD_LOGIC_VECTOR (3 downto 0);
	SIGNAL C1,C2,C3: STD_LOGIC;

	
begin

BLogic:ArithmeticLogicB PORT MAP(S1_AL=>S1_AC, S0_AL=>S0_AC,Bin_AL=>Bin_AC,Bout_AL=>Bpostlogic);
FA1:FullAdder PORT MAP(A_FA => Ain_AC(0),B_FA => Bpostlogic(0), Cin_FA => Cin_AC, Sum_FA => G_AC(0),Cout_FA => C1);
FA2:FullAdder PORT MAP(A_FA => Ain_AC(1),B_FA => Bpostlogic(1), Cin_FA => C1, Sum_FA => G_AC(1),Cout_FA => C2);
FA3:FullAdder PORT MAP(A_FA => Ain_AC(2),B_FA => Bpostlogic(2), Cin_FA => C2, Sum_FA => G_AC(2),Cout_FA => C3);
FA4:FullAdder PORT MAP(A_FA => Ain_AC(3),B_FA => Bpostlogic(3), Cin_FA => C3, Sum_FA => G_AC(3),Cout_FA => Cout_AC);


end Structural;

