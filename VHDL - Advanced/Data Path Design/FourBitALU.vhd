library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitALU is
    Port ( A_ALU : in  STD_LOGIC_VECTOR(3 downto 0);
           B_ALU : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin_ALU : in  STD_LOGIC;
           S0_ALU : in  STD_LOGIC;
           S1_ALU : in  STD_LOGIC;
           S2_ALU : in  STD_LOGIC;
           Cout_ALU : out  STD_LOGIC := '0';
           G_ALU : out  STD_LOGIC_VECTOR(3 downto 0));
end FourBitALU;

architecture Structural of FourBitALU is

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

SIGNAL Cout_AC_TMP : STD_LOGIC;
SIGNAL G_AC_TMP,G_LC_TMP : STD_LOGIC_VECTOR (3 downto 0);

begin

	LC : LogicCircuit PORT MAP(A_LC=> A_ALU, B_LC=> B_ALU, S0_LC=> S0_ALU, S1_LC=> S1_ALU, G_LC=> G_LC_TMP);
	AC : ArithmeticCircuit PORT MAP(Ain_AC=> A_ALU, Bin_AC=> B_ALU, S0_AC=> S0_ALU, S1_AC=> S1_ALU, Cout_AC=> Cout_AC_TMP, G_AC=> G_AC_TMP, Cin_AC=>Cin_ALU );
	
	process(S2_ALU,G_AC_TMP,G_LC_TMP,Cout_AC_TMP)
		begin
		if (S2_ALU = '0') then
			G_ALU<=G_AC_TMP;
			Cout_ALU<=Cout_AC_TMP;
		else
			G_ALU<=G_LC_TMP;
		end if;
	end process;
	
end Structural;

