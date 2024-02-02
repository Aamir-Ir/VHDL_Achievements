library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegmentDecoder is
    Port ( Operand_7SD : in  std_logic;
			  Input_7SD : inout std_logic_vector(3 downto 0);
			  A_7SD : in  std_logic_vector(3 downto 0);
			  B_7SD: in std_logic_vector(3 downto 0);
			  Output_7SD: out std_logic_vector(6 downto 0);
	        Segment_7SD: out std_logic_vector(3 downto 0));
end SevenSegmentDecoder;

architecture Structural of SevenSegmentDecoder is

	component FourBitAdderSubtractor is
		Port ( Operand_FBAS : in  STD_LOGIC;
           A_FBAS : in  STD_LOGIC_VECTOR(3 downto 0);
           B_FBAS : in  STD_LOGIC_VECTOR(3 downto 0);
           Sum_FBAS : out  STD_LOGIC_VECTOR(3 downto 0);
           CarryOut_FBAS : out  STD_LOGIC;
           Overflow_FBAS : out  STD_LOGIC);
	end component FourBitAdderSubtractor;

	signal CarryOut_7SD: std_logic;
	signal Overflow_7SD: std_logic;

begin

	FBAS : FourBitAdderSubtractor
		port map(Operand_7SD, A_7SD, B_7SD, Input_7SD, CarryOut_7SD, Overflow_7SD);

	Segment_7SD<= "0111";

	Output_7SD <= 
		"0000001" WHEN (Input_7SD = "0000") ELSE
		"1001111" WHEN (Input_7SD = "0001") ELSE
		"0010010" WHEN (Input_7SD = "0010") ELSE
		"0000110" WHEN (Input_7SD = "0011") ELSE
		"1001100" WHEN (Input_7SD = "0100") ELSE
		"0100100" WHEN (Input_7SD = "0101") ELSE
		"0100000" WHEN (Input_7SD = "0110") ELSE
		"0001111" WHEN (Input_7SD = "0111") ELSE
		"0000000" WHEN (Input_7SD = "1000") ELSE
		"0000100" WHEN (Input_7SD = "1001") ELSE
		"0001000" WHEN (Input_7SD = "1010") ELSE
		"1100000" WHEN (Input_7SD = "1011") ELSE
		"0110001" WHEN (Input_7SD = "1100") ELSE
		"1000010" WHEN (Input_7SD = "1101") ELSE
		"0110000" WHEN (Input_7SD = "1110") ELSE
		"0111000" WHEN (Input_7SD = "1111");

end Structural;

