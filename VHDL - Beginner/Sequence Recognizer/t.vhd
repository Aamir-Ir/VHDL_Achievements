
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY t IS
END t;
 
ARCHITECTURE behavior OF t IS 
 
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		X <= '1';
	X <= '1';
	X <= '0';
	X <= '1';
	ASSERT(Y='1')REPORT"ERROR ON CASE" SEVERITY ERROR;

      wait;
   end process;

END;
