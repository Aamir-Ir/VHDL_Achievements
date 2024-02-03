LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY SequenceRecongnizer_Schematic_SequenceRecongnizer_Schematic_sch_tb IS
END SequenceRecongnizer_Schematic_SequenceRecongnizer_Schematic_sch_tb;
ARCHITECTURE behavioral OF 
      SequenceRecongnizer_Schematic_SequenceRecongnizer_Schematic_sch_tb IS 

   COMPONENT SequenceRecongnizer_Schematic
   PORT( debounce_out	:	IN	STD_LOGIC; 
          Y	:	OUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL debounce_out	:	STD_LOGIC;
   SIGNAL Y	:	STD_LOGIC;
   SIGNAL clk	:	STD_LOGIC;

BEGIN

   UUT: SequenceRecongnizer_Schematic PORT MAP(
		debounce_out => debounce_out, 
		Y => Y, 
		clk => clk
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	debounce_out <= '1';
	WAIT FOR 20 NS;
	debounce_out <= '1';
	WAIT FOR 20 NS;
	debounce_out <= '0';
	WAIT FOR 20 NS;
	debounce_out <= '1';
	WAIT FOR 20 NS;
	ASSERT(Y='1')REPORT"ERROR ON CASE" SEVERITY ERROR;
	
	
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
