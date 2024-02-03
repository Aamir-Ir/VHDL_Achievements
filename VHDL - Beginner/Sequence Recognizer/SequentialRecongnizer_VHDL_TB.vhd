
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SequentialRecongnizer_VHDL_TB IS
END SequentialRecongnizer_VHDL_TB;
 
ARCHITECTURE behavior OF SequentialRecongnizer_VHDL_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SequenceRecongnizer_VHDL
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         X : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal X : std_logic := '0';

 	--Outputs
   signal Y : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SequenceRecongnizer_VHDL PORT MAP (
          clk => clk,
          reset => reset,
          X => X,
          Y => Y
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	  X <= '0';
	  reset <= '1';
	  -- Wait 100 ns for global reset to finish
	  wait for 10 ns;
		reset <= '0';
	  wait for 10 ns;
	  X <= '1';
	  wait for 10 ns;
	  X <= '1';
	  wait for 10 ns;
	  X <= '1'; 
	  wait for 10 ns;
	  X <= '0'; 
	  wait for 10 ns;
	  X <= '1'; 
	  wait for 10 ns;
	  X <= '0'; 
      wait;
   end process;

END;
