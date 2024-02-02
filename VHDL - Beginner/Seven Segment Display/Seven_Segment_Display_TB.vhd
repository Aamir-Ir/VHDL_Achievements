LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY lab4_TB IS
END lab4_TB;
 
ARCHITECTURE behavior OF lab4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT test
    PORT(
         INPUT : IN  std_logic_vector(3 downto 0);
         LEDTARGET : OUT  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal INPUT : std_logic_vector(3 downto 0);
   signal LEDTARGET : std_logic_vector(3 downto 0);

 	--Outputs
   signal OUTPUT : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 constant period : time := 20 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test PORT MAP (
          INPUT => INPUT,
          LEDTARGET => LEDTARGET,
          OUTPUT => OUTPUT
        );
 
	

   -- Stimulus process
   stim_proc: process
	
   begin	

		INPUT <= "0000";
		wait for period;
		assert(OUTPUT = "0000001")report "ERROR on case 0000" severity error;
		
		
		INPUT <= "0001";
		wait for period;
		assert(OUTPUT = "1001111")report "ERROR on case 0001" severity error;
		
		
		INPUT <= "0010";
		wait for period;
		assert(OUTPUT = "0010010")report "ERROR on case 0010" severity error;
		
		INPUT <= "0011";
		wait for period;
		assert(OUTPUT = "0000110")report "ERROR on case 0011" severity error;
		
		INPUT <= "0100";
		wait for period;
		assert(OUTPUT = "1001100")report "ERROR on case 0100" severity error;
		
		INPUT <= "0101";
		wait for period;
		assert(OUTPUT = "0100100")report "ERROR on case 0101" severity error;
		
		INPUT <= "0110";
		wait for period;
		assert(OUTPUT = "0100000")report "ERROR on case 0110" severity error;
		
		INPUT <= "0111";
		wait for period;
		assert(OUTPUT = "0001111")report "ERROR on case 0111" severity error;

		
		INPUT <= "1000";
		wait for period;
		assert(OUTPUT = "0000000")report "ERROR on case 1000" severity error;
		
		INPUT <= "1001";
		wait for period;
		assert(OUTPUT = "0000100")report "ERROR on case 1001" severity error;
		
		INPUT <= "1010";
		wait for period;
		assert(OUTPUT = "0001000")report "ERROR on case 1010" severity error;
		
		INPUT <= "1011";
		wait for period;
		assert(OUTPUT = "1100000")report "ERROR on case 1011" severity error;
		
		INPUT <= "1100";
		wait for period;
		assert(OUTPUT = "0110001")report "ERROR on case 1100" severity error;
		
		INPUT <= "1101";
		wait for period;
		assert(OUTPUT = "1000010")report "ERROR on case 1101" severity error;
		
		INPUT <= "1110";
		wait for period;
		assert(OUTPUT = "0110000")report "ERROR on case 1110" severity error;
		
		INPUT <= "1111";
		wait for period;
		assert(OUTPUT = "0111000")report "ERROR on case 1111" severity error;

      wait;
   end process;

END;
