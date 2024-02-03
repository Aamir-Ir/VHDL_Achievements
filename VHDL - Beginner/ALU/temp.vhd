LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY temp IS
END temp;
 
ARCHITECTURE behavior OF temp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ArithmeticLogicB
    PORT(
         S1_AL : IN  std_logic;
         S0_AL : IN  std_logic;
         Bin_AL : IN  std_logic_vector(3 downto 0);
         Bout_AL : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S1_AL : std_logic := '0';
   signal S0_AL : std_logic := '0';
   signal Bin_AL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Bout_AL : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ArithmeticLogicB PORT MAP (
          S1_AL => S1_AL,
          S0_AL => S0_AL,
          Bin_AL => Bin_AL,
          Bout_AL => Bout_AL
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	
	Bin_AL<="1010";
	S1_AL <= '0';
	S0_AL <= '0';
	wait for 100 ns;
	
	S1_AL <= '0';
	S0_AL <= '1';
	wait for 100 ns;
	
	S1_AL <= '1';
	S0_AL <= '0';
	wait for 100 ns;
	
	S1_AL <= '1';
	S0_AL <= '1';
	wait for 100 ns;

      wait;
   end process;

END;
