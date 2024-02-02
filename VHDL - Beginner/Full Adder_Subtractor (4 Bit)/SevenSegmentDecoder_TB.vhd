LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SevenSegmentDecoder_TB IS
END SevenSegmentDecoder_TB;
 
ARCHITECTURE behavior OF SevenSegmentDecoder_TB IS 
 
    COMPONENT SevenSegmentDecoder
    PORT(
         Operand_7SD : IN  std_logic;
         Input_7SD : INOUT  std_logic_vector(3 downto 0);
         A_7SD : IN  std_logic_vector(3 downto 0);
         B_7SD : IN  std_logic_vector(3 downto 0);
         Output_7SD : OUT  std_logic_vector(6 downto 0);
         Segment_7SD : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Operand_7SD : std_logic := '0';
   signal A_7SD : std_logic_vector(3 downto 0) := (others => '0');
   signal B_7SD : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal Input_7SD : std_logic_vector(3 downto 0);

 	--Outputs
   signal Output_7SD : std_logic_vector(6 downto 0);
   signal Segment_7SD : std_logic_vector(3 downto 0);
 
   constant period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenSegmentDecoder PORT MAP (
          Operand_7SD => Operand_7SD,
          Input_7SD => Input_7SD,
          A_7SD => A_7SD,
          B_7SD => B_7SD,
          Output_7SD => Output_7SD,
          Segment_7SD => Segment_7SD
        );

   -- Stimulus process
   stim_proc: process
   begin		
       
		 --addition
		 A_7SD <= "0000"; B_7SD <= "0101"; -- 0 + 5 => 05 (0 0101)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0101")report "error on case" severity error;
		 A_7SD <= "0001"; B_7SD <= "0111"; -- 1 + 7 => 08 (0 1000)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1000")report "error on case" severity error;
		 A_7SD <= "0010"; B_7SD <= "1001"; -- 2 + 9 => 0B (0 1011)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1011")report "error on case" severity error;
		 A_7SD <= "0011"; B_7SD <= "1011"; -- 3 + B => 0E (0 1110)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1110")report "error on case" severity error;
		 A_7SD <= "0100"; B_7SD <= "1101"; -- 4 + D => 11 (1 0001)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0001")report "error on case" severity error;
		 A_7SD <= "0101"; B_7SD <= "1111"; -- 5 + F => 14 (1 0100)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0100")report "error on case" severity error;
		 A_7SD <= "0110"; B_7SD <= "0001"; -- 6 + 1 => 07 (0 0111)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0111")report "error on case" severity error;
		 A_7SD <= "0111"; B_7SD <= "0011"; -- 7 + 3 => 0A (0 1010)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1010")report "error on case" severity error;
		 A_7SD <= "1000"; B_7SD <= "0101"; -- 8 + 5 => 0D (0 1101)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1101")report "error on case" severity error;
		 A_7SD <= "1001"; B_7SD <= "0111"; -- 9 + 7 => 10 (1 0000)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0000")report "error on case" severity error;
		 
		
		 --subtraction
		 Operand_7SD <= '1';
		 
		 A_7SD <= "0000"; B_7SD <= "0101"; -- 0 - 5 => -5 (0 0101)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1011")report "error on case" severity error;
		 A_7SD <= "0001"; B_7SD <= "0111"; -- 1 - 7 => -6 (0 1000)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1010")report "error on case" severity error;
		 A_7SD <= "0010"; B_7SD <= "1001"; -- 2 - 9 => -7 (0 1011)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "1001")report "error on case" severity error;
		 A_7SD <= "0110"; B_7SD <= "0001"; -- 6 - 1 => 5 (0 0111)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0101")report "error on case" severity error;
		 A_7SD <= "0111"; B_7SD <= "0011"; -- 7 - 3 => 4 (0 1010)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0100")report "error on case" severity error;
		 A_7SD <= "1000"; B_7SD <= "0101"; -- 8 - 5 => 3 (0 1101)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0011")report "error on case" severity error;
		 A_7SD <= "1001"; B_7SD <= "0111"; -- 9 - 7 => 2 (1 0000)
		 WAIT FOR 100 ns;
		 assert(Input_7SD = "0010")report "error on case" severity error;

      wait;
   end process;

END;
