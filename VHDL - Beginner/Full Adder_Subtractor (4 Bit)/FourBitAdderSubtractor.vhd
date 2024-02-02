library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitAdderSubtractor is
    Port ( Operand_FBAS : in  STD_LOGIC;
           A_FBAS : in  STD_LOGIC_VECTOR(3 downto 0);
           B_FBAS : in  STD_LOGIC_VECTOR(3 downto 0);
           Sum_FBAS : out  STD_LOGIC_VECTOR(3 downto 0);
           CarryOut_FBAS : out  STD_LOGIC;
           Overflow_FBAS : out  STD_LOGIC);
end FourBitAdderSubtractor;

architecture Structural of FourBitAdderSubtractor is
	component FullAdder is
	Port ( A_Full : in  STD_LOGIC;
           B_Full : in  STD_LOGIC;
           CarryIn_Full : in  STD_LOGIC;
           CarryOut_Full : out  STD_LOGIC;
           Sum_Full : out  STD_LOGIC);	  
		  
	end component FullAdder;
	
	signal Carry1_FBAS, Carry2_FBAS, Carry3_FBAS, Carry4_FBAS : std_logic;
	signal TMP: std_logic_vector(3 downto 0);

begin
	TMP(0)<= Operand_FBAS xor B_FBAS(0);
	TMP(1)<= Operand_FBAS xor B_FBAS(1);
	TMP(2)<= Operand_FBAS xor B_FBAS(2);
	TMP(3)<= Operand_FBAS xor B_FBAS(3);
	
	FullAdder_0:FullAdder 
		port map(A_FBAS(0),TMP(0),Operand_FBAS,Carry1_FBAS, Sum_FBAS(0)); --- Sum_FBAS(0)
	
	FullAdder_1:FullAdder 
		port map(A_FBAS(1),TMP(1),Carry1_FBAS,Carry2_FBAS, Sum_FBAS(1)); --- Sum_FBAS(1)
	
	FullAdder_2:FullAdder 
		port map(A_FBAS(2),TMP(2),Carry2_FBAS,Carry3_FBAS, Sum_FBAS(2));-- - Sum_FBAS(2)
	
	FullAdder_3:FullAdder 
		port map(A_FBAS(3),TMP(3),Carry3_FBAS,Carry4_FBAS, Sum_FBAS(3));-- - Sum_FBAS(3)
	
	Overflow_FBAS <= Carry3_FBAS XOR Carry4_FBAS ;
	CarryOut_FBAS <= Carry4_FBAS;
	
end Structural;

