LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenSegmentDecoder
    PORT(
         A_SSD : IN  std_logic_vector(3 downto 0);
         B_SSD : IN  std_logic_vector(3 downto 0);
         Cin_SSD : IN  std_logic;
         S0_SSD : IN  std_logic;
         S1_SSD : IN  std_logic;
         S2_SSD : IN  std_logic;
         Target_SSD : OUT  std_logic_vector(3 downto 0);
         Output_SSD : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_SSD : std_logic_vector(3 downto 0) := (others => '0');
   signal B_SSD : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin_SSD : std_logic := '0';
   signal S0_SSD : std_logic := '0';
   signal S1_SSD : std_logic := '0';
   signal S2_SSD : std_logic := '0';

 	--Outputs
   signal Target_SSD : std_logic_vector(3 downto 0);
   signal Output_SSD : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenSegmentDecoder PORT MAP (
          A_SSD => A_SSD,
          B_SSD => B_SSD,
          Cin_SSD => Cin_SSD,
          S0_SSD => S0_SSD,
          S1_SSD => S1_SSD,
          S2_SSD => S2_SSD,
          Target_SSD => Target_SSD,
          Output_SSD => Output_SSD
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin	

--testing arithmetic circuit
		S0_SSD <= '0';
		S1_SSD <= '0';
		Cin_SSD <= '0';
		A_SSD <= "0111";
		B_SSD <= "0101";
      wait for 65 ns;	
		
		S0_SSD <= '0';
		S1_SSD <= '0';
		Cin_SSD <= '1';
		wait for 65 ns;
		
		S0_SSD <= '0';
		S1_SSD <= '1';
		Cin_SSD <= '0';
		wait for 65 ns;
		
		S0_SSD <= '0';
		S1_SSD <= '1';
		Cin_SSD <= '1';
		wait for 65 ns;
		
		S0_SSD <= '1';
		S1_SSD <= '0';
		Cin_SSD <= '0';
		wait for 65 ns;
		
		S0_SSD <= '1';
		S1_SSD <= '0';
		Cin_SSD <= '1';
		wait for 65 ns;
		
		S0_SSD <= '1';
		S1_SSD <= '1';
		Cin_SSD <= '0';
		wait for 65 ns;
		
		S0_SSD <= '1';
		S1_SSD <= '1';
		Cin_SSD <= '1';
		wait for 65 ns;

-- testing logic circuit
		S2_SSD <= '1';

      S0_SSD <= '0';
		S1_SSD <= '0';
		Cin_SSD <= '0';
      wait for 65 ns;	
		
		S0_SSD <= '0';
		S1_SSD <= '1';
		Cin_SSD <= '0';
		wait for 65 ns;
		
		
		S0_SSD <= '1';
		S1_SSD <= '0';
		Cin_SSD <= '0';
		wait for 65 ns;
	
		
		S0_SSD <= '1';
		S1_SSD <= '1';
		Cin_SSD <= '0';
		wait for 65 ns;
		

      wait;
   end process;

END;
