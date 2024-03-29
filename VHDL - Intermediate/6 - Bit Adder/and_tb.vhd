--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:28:19 01/17/2022
-- Design Name:   
-- Module Name:   
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bitand
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY and_tb IS
END and_tb;
 
ARCHITECTURE behavior OF and_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bitand
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         f : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal f : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bitand PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          f => f
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
a<='0';b<='0';c<='0';d<='0';
wait for 10 ns;

a<='0';b<='0';c<='0';d<='1';
wait for 10 ns;

a<='0';b<='0';c<='1';d<='0';
wait for 10 ns;

a<='0';b<='0';c<='1';d<='1';
wait for 10 ns;

a<='0';b<='1';c<='0';d<='0';
wait for 10 ns;

a<='0';b<='1';c<='0';d<='1';
wait for 10 ns;

a<='0';b<='1';c<='1';d<='0';
wait for 10 ns;

a<='0';b<='1';c<='1';d<='1';
wait for 10 ns;

a<='1';b<='0';c<='0';d<='0';
wait for 10 ns;

a<='1';b<='0';c<='0';d<='1';
wait for 10 ns;

a<='1';b<='0';c<='1';d<='0';
wait for 10 ns;

a<='1';b<='0';c<='1';d<='1';
wait for 10 ns;

a<='1';b<='1';c<='0';d<='0';
wait for 10 ns;

a<='1';b<='1';c<='0';d<='1';
wait for 10 ns;

a<='1';b<='1';c<='1';d<='0';
wait for 10 ns;

a<='1';b<='1';c<='1';d<='1';

      wait;
   end process;

END;
