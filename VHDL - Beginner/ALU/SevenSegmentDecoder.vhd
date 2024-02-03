library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegmentDecoder is
    Port ( A_SSD : in  STD_LOGIC_VECTOR (3 downto 0);
			  B_SSD : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin_SSD : in  STD_LOGIC;
           S0_SSD : in  STD_LOGIC;
           S1_SSD : in  STD_LOGIC;
           S2_SSD : in  STD_LOGIC;
           Target_SSD : out  STD_LOGIC_VECTOR (3 downto 0);
           Output_SSD : out  STD_LOGIC_VECTOR (6 downto 0));
end SevenSegmentDecoder;

architecture Structural of SevenSegmentDecoder is

component FourBitALU is
	Port ( A_ALU : in  STD_LOGIC_VECTOR(3 downto 0);
           B_ALU : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin_ALU : in  STD_LOGIC;
           S0_ALU : in  STD_LOGIC;
           S1_ALU : in  STD_LOGIC;
           S2_ALU : in  STD_LOGIC;
           Cout_ALU : out  STD_LOGIC := '0';
           G_ALU : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

SIGNAL Carry: STD_LOGIC;
SIGNAL G_SSD  :  STD_LOGIC_VECTOR (3 downto 0);

begin
ALU : FourBitALU PORT MAP (A_ALU=> A_SSD, B_ALU=> B_SSD, Cin_ALU=>Cin_SSD, S0_ALU=>S0_SSD, S1_ALU=>S1_SSD, S2_ALU=>S2_SSD, Cout_ALU=>Carry, G_ALU=> G_SSD);

Target_SSD<="0111";
Output_SSD <=
    "0000001" WHEN (G_SSD = "0000") ELSE
    "1001111" WHEN (G_SSD = "0001") ELSE
    "0010010" WHEN (G_SSD = "0010") ELSE
    "0000110" WHEN (G_SSD = "0011") ELSE
    "1001100" WHEN (G_SSD = "0100") ELSE
    "0100100" WHEN (G_SSD = "0101") ELSE
    "0100000" WHEN (G_SSD = "0110") ELSE
    "0001111" WHEN (G_SSD = "0111") ELSE
    "0000000" WHEN (G_SSD = "1000") ELSE
    "0000100" WHEN (G_SSD = "1001") ELSE
    "0001000" WHEN (G_SSD = "1010") ELSE
    "1100000" WHEN (G_SSD = "1011") ELSE
    "0110001" WHEN (G_SSD = "1100") ELSE
    "1000010" WHEN (G_SSD = "1101") ELSE
    "0110000" WHEN (G_SSD = "1110") ELSE
    "0111000" WHEN (G_SSD = "1111");

end Structural;

