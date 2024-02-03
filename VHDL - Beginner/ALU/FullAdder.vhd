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
    Port ( A_FA : in  STD_LOGIC;
           B_FA : in  STD_LOGIC;
           Cin_FA : in  STD_LOGIC;
           Sum_FA : out  STD_LOGIC;
           Cout_FA : out  STD_LOGIC);
end FullAdder;

architecture Structural of FullAdder is

	component HalfAdder is
	Port ( A,B : in STD_LOGIC;
			Sum,Cout : out STD_LOGIC);
	end component;
	
	SIGNAL S0,S1,S2:STD_LOGIC;
	
begin
HA1:HalfAdder PORT MAP(A=>A_FA,B=>B_FA,Sum=>S0,Cout=>S1);
HA2:HalfAdder PORT MAP(A=>S0,B=>Cin_FA,Sum=>Sum_FA,Cout=>S2);

Cout_FA<=S2 or S1;

end Structural;

