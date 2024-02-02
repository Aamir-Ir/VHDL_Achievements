LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FourBitAdderSubtractor_TB IS
END FourBitAdderSubtractor_TB;
 
ARCHITECTURE behavior OF FourBitAdderSubtractor_TB IS
    COMPONENT FourBitAdderSubtractor
    PORT(
         Operand_FBAS : IN  std_logic;
         A_FBAS : IN  std_logic_vector(3 downto 0);
         B_FBAS : IN  std_logic_vector(3 downto 0);
         Sum_FBAS : OUT  std_logic_vector(3 downto 0);
         CarryOut_FBAS : OUT  std_logic;
         Overflow_FBAS : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal Operand_FBAS : std_logic := '0';
   signal A_FBAS : std_logic_vector(3 downto 0) := (others => '0');
   signal B_FBAS : std_logic_vector(3 downto 0) := (others => '0');
 	--Outputs
   signal Sum_FBAS : std_logic_vector(3 downto 0);
   signal CarryOut_FBAS : std_logic;
   signal Overflow_FBAS : std_logic;
 
   constant period : time := 10 ns;
 
BEGIN
   uut: FourBitAdderSubtractor PORT MAP (
          Operand_FBAS => Operand_FBAS,
          A_FBAS => A_FBAS,
          B_FBAS => B_FBAS,
          Sum_FBAS => Sum_FBAS,
          CarryOut_FBAS => CarryOut_FBAS,
          Overflow_FBAS => Overflow_FBAS
        );


   -- Stimulus process
   stim_proc: process
   begin		
	

 A_7SD <= "0000"; B_7SD <= "0101"; -- 0 + 5 => 05 (0 0101)
 WAIT FOR 100 ns;
 A_7SD <= "0001"; B_7SD <= "0111"; -- 1 + 7 => 08 (0 1000)
 WAIT FOR 100 ns;
 A_7SD <= "0010"; B_7SD <= "1001"; -- 2 + 9 => 0B (0 1011)
 WAIT FOR 100 ns;
 A_7SD <= "0011"; B_7SD <= "1011"; -- 3 + B => 0E (0 1110)
 WAIT FOR 100 ns;
 A_7SD <= "0100"; B_7SD <= "1101"; -- 4 + D => 11 (1 0001)
 WAIT FOR 100 ns;
 A_7SD <= "0101"; B_7SD <= "1111"; -- 5 + F => 14 (1 0100)
 WAIT FOR 100 ns;
 A_7SD <= "0110"; B_7SD <= "0001"; -- 6 + 1 => 07 (0 0111)
 WAIT FOR 100 ns;
 A_7SD <= "0111"; B_7SD <= "0011"; -- 7 + 3 => 0A (0 1010)
 WAIT FOR 100 ns;
 A_7SD <= "1000"; B_7SD <= "0101"; -- 8 + 5 => 0D (0 1101)
 WAIT FOR 100 ns;
 A_7SD <= "1001"; B_7SD <= "0111"; -- 9 + 7 => 10 (1 0000)



      wait;
   end process;

END;
