LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY comparator_TB IS
END comparator_TB;
 
ARCHITECTURE behavior OF comparator_TB IS 
 
    COMPONENT comparator_VHDL
    PORT(
         A1 : IN  std_logic;
         A0 : IN  std_logic;
         B1 : IN  std_logic;
         B0 : IN  std_logic;
         GT : OUT  std_logic;
         EQ : OUT  std_logic;
         LT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A1 : std_logic := '0';
   signal A0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B0 : std_logic := '0';

 	--Outputs
   signal GT : std_logic;
   signal EQ : std_logic;
   signal LT : std_logic;
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator_VHDL PORT MAP (
          A1 => A1,
          A0 => A0,
          B1 => B1,
          B0 => B0,
          GT => GT,
          EQ => EQ,
          LT => LT
        );

   -- Stimulus process
   stim_proc: process
		constant period: time := 20 ns;
   begin		
		A1 <= '0';
		A0 <= '0';
		B1 <= '0';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 0000" severity error;
		assert (EQ = '1') report "ERROR on case 0000" severity error;
		assert (GT = '0') report "ERROR on case 0000" severity error;
		
		A1 <= '0';
		A0 <= '0';
		B1 <= '0';
		B0 <= '1';
		wait for period;
		assert (LT = '1') report "ERROR on case 0001" severity error;
		assert (EQ = '0') report "ERROR on case 0001" severity error;
		assert (GT = '0') report "ERROR on case 0001" severity error;
		
		A1 <= '0';
		A0 <= '0';
		B1 <= '1';
		B0 <= '0';
		wait for period;
		assert (LT = '1') report "ERROR on case 0010" severity error;
		assert (EQ = '0') report "ERROR on case 0010" severity error;
		assert (GT = '0') report "ERROR on case 0010" severity error;
		
		A1 <= '0';
		A0 <= '0';
		B1 <= '1';
		B0 <= '1';
		wait for period;
		assert (LT = '1') report "ERROR on case 0011" severity error;
		assert (EQ = '0') report "ERROR on case 0011" severity error;
		assert (GT = '0') report "ERROR on case 0011" severity error;
		
		A1 <= '0';
		A0 <= '1';
		B1 <= '0';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 0100" severity error;
		assert (EQ = '0') report "ERROR on case 0100" severity error;
		assert (GT = '1') report "ERROR on case 0100" severity error;
		
		A1 <= '0';
		A0 <= '1';
		B1 <= '0';
		B0 <= '1';
		wait for period;
		assert (LT = '0') report "ERROR on case 0101" severity error;
		assert (EQ = '1') report "ERROR on case 0101" severity error;
		assert (GT = '0') report "ERROR on case 0101" severity error;
		
		A1 <= '0';
		A0 <= '1';
		B1 <= '1';
		B0 <= '0';
		wait for period;
		assert (LT = '1') report "ERROR on case 0110" severity error;
		assert (EQ = '0') report "ERROR on case 0110" severity error;
		assert (GT = '0') report "ERROR on case 0110" severity error;
		
		A1 <= '0';
		A0 <= '1';
		B1 <= '1';
		B0 <= '1';
		wait for period;
		assert (LT = '1') report "ERROR on case 0111" severity error;
		assert (EQ = '0') report "ERROR on case 0111" severity error;
		assert (GT = '0') report "ERROR on case 0111" severity error;
		
		A1 <= '1';
		A0 <= '0';
		B1 <= '0';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 1000" severity error;
		assert (EQ = '0') report "ERROR on case 1000" severity error;
		assert (GT = '1') report "ERROR on case 1000" severity error;
		
		A1 <= '1';
		A0 <= '0';
		B1 <= '0';
		B0 <= '1';
		wait for period;
		assert (LT = '0') report "ERROR on case 1001" severity error;
		assert (EQ = '0') report "ERROR on case 1001" severity error;
		assert (GT = '1') report "ERROR on case 1001" severity error;
		
		A1 <= '1';
		A0 <= '0';
		B1 <= '1';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 1010" severity error;
		assert (EQ = '1') report "ERROR on case 1010" severity error;
		assert (GT = '0') report "ERROR on case 1010" severity error;
		
		A1 <= '1';
		A0 <= '0';
		B1 <= '1';
		B0 <= '1';
		wait for period;
		assert (LT = '1') report "ERROR on case 1011" severity error;
		assert (EQ = '0') report "ERROR on case 1011" severity error;
		assert (GT = '0') report "ERROR on case 1011" severity error;
		
		A1 <= '1';
		A0 <= '1';
		B1 <= '0';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 1100" severity error;
		assert (EQ = '0') report "ERROR on case 1100" severity error;
		assert (GT = '1') report "ERROR on case 1100" severity error;
		
		A1 <= '1';
		A0 <= '1';
		B1 <= '0';
		B0 <= '1';
		wait for period;
		assert (LT = '0') report "ERROR on case 1101" severity error;
		assert (EQ = '0') report "ERROR on case 1101" severity error;
		assert (GT = '1') report "ERROR on case 1101" severity error;
		
		A1 <= '1';
		A0 <= '1';
		B1 <= '1';
		B0 <= '0';
		wait for period;
		assert (LT = '0') report "ERROR on case 1110" severity error;
		assert (EQ = '0') report "ERROR on case 1110" severity error;
		assert (GT = '1') report "ERROR on case 1110" severity error;
		
		A1 <= '1';
		A0 <= '1';
		B1 <= '1';
		B0 <= '1';
		wait for period;
		assert (LT = '0') report "ERROR on case 1111" severity error;
		assert (EQ = '1') report "ERROR on case 1111" severity error;
		assert (GT = '0') report "ERROR on case 1111" severity error;
		
      WAIT;
   end process;

END;