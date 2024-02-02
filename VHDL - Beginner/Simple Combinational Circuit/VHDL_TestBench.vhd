LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

ENTITY TripGenie_TripGenie_sch_tb IS
END TripGenie_TripGenie_sch_tb;

ARCHITECTURE behavioral OF TripGenie_TripGenie_sch_tb IS 

   COMPONENT TripGenie
   PORT( MtPilot	:	IN	STD_LOGIC; 
          SilverCity	:	IN	STD_LOGIC; 
          Hooterville	:	IN	STD_LOGIC; 
          Mayberry	:	IN	STD_LOGIC; 
          HWY1	:	OUT	STD_LOGIC; 
          HWY2	:	OUT	STD_LOGIC; 
          HWY3	:	OUT	STD_LOGIC; 
          HWY4	:	OUT	STD_LOGIC; 
          HWY5	:	OUT	STD_LOGIC; 
          HWY6	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL MtPilot	:	STD_LOGIC;
   SIGNAL SilverCity	:	STD_LOGIC;
   SIGNAL Hooterville	:	STD_LOGIC;
   SIGNAL Mayberry	:	STD_LOGIC;
   SIGNAL HWY1	:	STD_LOGIC;
   SIGNAL HWY2	:	STD_LOGIC;
   SIGNAL HWY3	:	STD_LOGIC;
   SIGNAL HWY4	:	STD_LOGIC;
   SIGNAL HWY5	:	STD_LOGIC;
   SIGNAL HWY6	:	STD_LOGIC;

BEGIN

   UUT: TripGenie PORT MAP(
		MtPilot => MtPilot, 
		SilverCity => SilverCity, 
		Hooterville => Hooterville, 
		Mayberry => Mayberry, 
		HWY1 => HWY1, 
		HWY2 => HWY2, 
		HWY3 => HWY3, 
		HWY4 => HWY4, 
		HWY5 => HWY5, 
		HWY6 => HWY6
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	constant period: time := 20 ns;
   BEGIN
	
	Mayberry<= '0';
	MtPilot<= '0';
	SilverCity<= '0';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY1='0') and(HWY1='0') and(HWY1='0'))
	report "test failed for input combination 0000" severity error;
	
	Mayberry<= '0';
	MtPilot<= '0';
	SilverCity<= '0';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0001" severity error;
	
	Mayberry<= '0';
	MtPilot<= '0';
	SilverCity<= '1';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0010" severity error;
	
	Mayberry<= '0';
	MtPilot<= '0';
	SilverCity<= '1';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='1') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0011" severity error;
	
	Mayberry<= '0';
	MtPilot<= '1';
	SilverCity<= '0';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0100" severity error;
	
	Mayberry<= '0';
	MtPilot<= '1';
	SilverCity<= '0';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='1') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0101" severity error;
	
	Mayberry<= '0';
	MtPilot<= '1';
	SilverCity<= '1';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='1'))
	report "test failed for input combination 0110" severity error;
	
	Mayberry<= '0';
	MtPilot<= '1';
	SilverCity<= '1';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 0111" severity error;
	
	Mayberry<= '1';
	MtPilot<= '0';
	SilverCity<= '0';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1000" severity error;
	
	Mayberry<= '1';
	MtPilot<= '0';
	SilverCity<= '0';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='1') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1001" severity error;
	
	Mayberry<= '1';
	MtPilot<= '0';
	SilverCity<= '1';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='1') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1010" severity error;
	
	Mayberry<= '1';
	MtPilot<= '0';
	SilverCity<= '1';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1011" severity error;
	
	Mayberry<= '1';
	MtPilot<= '1';
	SilverCity<= '0';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='1') and(HWY6='0'))
	report "test failed for input combination 1100" severity error;
	
	Mayberry<= '1';
	MtPilot<= '1';
	SilverCity<= '0';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1101" severity error;
	
	Mayberry<= '1';
	MtPilot<= '1';
	SilverCity<= '1';
	Hooterville<= '0';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1110" severity error;
	
	Mayberry<= '1';
	MtPilot<= '1';
	SilverCity<= '1';
	Hooterville<= '1';
	wait for period;
	assert((HWY1='0') and(HWY2='0') and(HWY3='0') and(HWY4='0') and(HWY5='0') and(HWY6='0'))
	report "test failed for input combination 1111" severity error;
	
	
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
