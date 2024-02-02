LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY SimpleLogic_SimpleLogic_sch_tb IS
END SimpleLogic_SimpleLogic_sch_tb;
ARCHITECTURE behavioral OF SimpleLogic_SimpleLogic_sch_tb IS 

   COMPONENT SimpleLogic
   PORT( A	:	IN	STD_LOGIC; 
          B	:	IN	STD_LOGIC; 
			 C	:	IN	STD_LOGIC;
          F	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL A	:	STD_LOGIC;
   SIGNAL B	:	STD_LOGIC;
	SIGNAL C	:	STD_LOGIC;
   SIGNAL F	:	STD_LOGIC;

BEGIN

   UUT: SimpleLogic PORT MAP(
		A => A, 
		B => B, 
		C => C,
		F => F
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	constant period: time:= 20ns;
   BEGIN
      
		A <= '0';
		B <= '0';
		C <= '0';
		wait for period;
		assert (F = '1')
		report "test failed for input combination 000" severity error;
		
		A <= '0';
		B <= '0';
		C <= '1';
		wait for period;
		assert (F = '1')
		report "test failed for input combination 001" severity error;
		
		A <= '0';
		B <= '1';
		C <= '0';
		wait for period;
		assert (F = '1')
		report "test failed for input combination 010" severity error;      	

		A <= '0';
		B <= '1';
		C <= '1';
		wait for period;
		assert (F = '0')
		report "test failed for input combination 011" severity error;
		
		A <= '1';
		B <= '0';
		C <= '0';
		wait for period;
		assert (F = '1')
		report "test failed for input combination 100" severity error;
		
		A <= '1';
		B <= '0';
		C <= '1';
		wait for period;
		assert (F = '0')
		report "test failed for input combination 101" severity error;
		
		A <= '1';
		B <= '1';
		C <= '0';
		wait for period;
		assert (F = '0')
		report "test failed for input combination 110" severity error;
		
		A <= '1';
		B <= '1';
		C <= '1';
		wait for period;
		assert (F = '0')
		report "test failed for input combination 111" severity error;
		
				
		WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
